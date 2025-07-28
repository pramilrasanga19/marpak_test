<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Transaction;
use App\Models\Biller;
use App\Models\User;
use Spatie\Activitylog\Models\Activity;

class PaymentController extends Controller
{

    public function create()
    {
        return view('payment.create', [
            'billers' => Biller::all(),
            'currentBalance' => auth()->user()->balance
        ]);
    }


public function store(Request $request)
{
    $validated = $request->validate([
        'biller_id' => 'required|numeric',
        'amount' => 'required|numeric|min:0.01|max:100000'
    ]);

    $user = $request->user();
    $biller = Biller::find($validated['biller_id']);
    $amount = $validated['amount'];
    $fee = $amount * ($biller->fee_percentage / 100);
    $totalAmount = $amount + $fee;

    if (!$user->hasSufficientBalance($totalAmount)) {
        activity()
            ->causedBy($user)
            ->withProperties([
                'event' => 'failed_payment',
                'biller' => $biller->name,
                'amount' => $amount,
                'fee' => $fee,
                'required' => $totalAmount,
                'current_balance' => $user->balance
            ])
            ->log('Payment attempt failed due to insufficient funds');
            
        return back()->with('error', 'Insufficient balance for this payment');
    }

    try {
        DB::transaction(function () use ($user, $biller, $amount, $fee, $totalAmount) {
           
            $balanceBefore = $user->balance;
            
            $user->decrement('balance', $totalAmount);
            $user->refresh(); 
            
            $transaction = $user->transactions()->create([
                'type' => Transaction::TYPE_PAYMENT,
                'amount' => $totalAmount,
                'description' => "Payment to {$biller->name}",
                'details' => [
                    'base_amount' => $amount,
                    'fee' => $fee,
                    'fee_percentage' => $biller->fee_percentage
                ]
            ]);

            activity()
                ->causedBy($user)
                ->performedOn($transaction)
                ->withProperties([
                    'event' => 'payment_processed',
                    'biller' => $biller->name,
                    'amount' => $amount,
                    'fee' => $fee,
                    'total' => $totalAmount,
                    'balance_before' => $balanceBefore,
                    'balance_after' => $user->balance
                ])
                ->log("Paid {$biller->name} bill");
        });

        return redirect()->route('home')
            ->with('success', "Paid $".number_format($amount,2)." to {$biller->name} (Fee: $".number_format($fee,2).")");

    } catch (\Exception $e) {
        activity()
            ->causedBy($user)
            ->withProperties([
                'event' => 'payment_error',
                'error' => $e->getMessage(),
                'input' => $request->except('_token')
            ])
            ->log('Payment processing failed');
            
        return back()->with('error', 'Payment failed. Please try again.');
    }
}
}