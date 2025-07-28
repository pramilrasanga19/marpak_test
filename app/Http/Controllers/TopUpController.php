<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Transaction;
use App\Models\User;
use Spatie\Activitylog\Models\Activity;

class TopUpController extends Controller
{

    public function create()
    {
        return view('topup.create', [
            'currentBalance' => auth()->user()->balance
        ]);
    }


public function store(Request $request)
{
    $validated = $request->validate([
        'amount' => 'required|numeric|min:0.01|max:100000'
    ]);

    $user = $request->user();
    $amount = $validated['amount'];

    try {
        DB::transaction(function () use ($user, $amount) {
            $oldBalance = $user->balance;
            $user->increment('balance', $amount);
            
            $transaction = $user->transactions()->create([
                'type' => Transaction::TYPE_TOPUP,
                'amount' => $amount,
                'description' => 'Account Top-up'
            ]);

            activity()
                ->causedBy($user)
                ->performedOn($transaction)
                ->withProperties([
                    'event' => 'topup_processed',
                    'amount' => $amount,
                    'balance_before' => $oldBalance,
                    'balance_after' => $user->balance,
                    'method' => 'manual' 
                ])
                ->log('Account top-up completed');
        });

        return redirect()
            ->route('home')
            ->with('success', "Successfully topped up $".number_format($amount, 2));

    } catch (\Exception $e) {
        activity()
            ->causedBy($user)
            ->withProperties([
                'event' => 'topup_error',
                'error' => $e->getMessage(),
                'amount' => $amount
            ])
            ->log('Top-up failed');
            
        return back()->with('error', 'Top-up failed. Please try again.');
    }
}
}