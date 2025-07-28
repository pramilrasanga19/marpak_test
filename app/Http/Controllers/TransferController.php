<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Biller;
use Spatie\Activitylog\Models\Activity;

class TransferController extends Controller
{

    public function create()
    {
        return view('transfer.create', [
            'users' => User::where('id', '!=', auth()->id())->get(['id', 'name', 'email'])
        ]);
    }


public function store(Request $request)
{
    $validated = $request->validate([
        'recipient_id' => 'required|exists:users,id',
        'amount' => 'required|numeric|min:0.01|max:100000'
    ]);

    $sender = $request->user();
    $recipient = User::findOrFail($validated['recipient_id']);
    $amount = $validated['amount'];

    if (!$sender->hasSufficientBalance($amount)) {
        activity()
            ->causedBy($sender)
            ->withProperties([
                'event' => 'failed_transfer',
                'recipient' => $recipient->email,
                'amount' => $amount,
                'balance' => $sender->balance
            ])
            ->log('Transfer failed due to insufficient funds');
            
        return back()->with('error', 'Insufficient balance for this transfer');
    }

    try {
        DB::transaction(function () use ($sender, $recipient, $amount) {
            $senderOldBalance = $sender->balance;
            $recipientOldBalance = $recipient->balance;

            $sender->decrement('balance', $amount);
            $recipient->increment('balance', $amount);

            $senderTransaction = $sender->transactions()->create([
                'type' => Transaction::TYPE_TRANSFER,
                'amount' => $amount,
                'description' => "Transfer to {$recipient->name}",
                'related_user_id' => $recipient->id
            ]);

            $recipientTransaction = $recipient->transactions()->create([
                'type' => Transaction::TYPE_TRANSFER,
                'amount' => $amount,
                'description' => "Transfer from {$sender->name}",
                'related_user_id' => $sender->id
            ]);

           
            activity()
                ->causedBy($sender)
                ->performedOn($senderTransaction)
                ->withProperties([
                    'event' => 'funds_sent',
                    'recipient' => $recipient->email,
                    'amount' => $amount,
                    'balance_before' => $senderOldBalance,
                    'balance_after' => $sender->balance
                ])
                ->log("Transfer sent to {$recipient->name}");

         
            activity()
                ->causedBy($sender) 
                ->performedOn($recipientTransaction)
                ->withProperties([
                    'event' => 'funds_received',
                    'sender' => $sender->email,
                    'amount' => $amount,
                    'balance_before' => $recipientOldBalance,
                    'balance_after' => $recipient->balance
                ])
                ->log("Transfer received from {$sender->name}");
        });

        return redirect()
            ->route('home')
            ->with('success', sprintf(
                'Successfully transferred $%s to %s',
                number_format($amount, 2),
                $recipient->name
            ));

    } catch (\Exception $e) {
        activity()
            ->causedBy($sender)
            ->withProperties([
                'event' => 'transfer_error',
                'error' => $e->getMessage(),
                'recipient' => $recipient->email,
                'amount' => $amount
            ])
            ->log('Transfer processing failed');
            
        return back()->with('error', 'Transfer failed. Please try again.');
    }
}
}