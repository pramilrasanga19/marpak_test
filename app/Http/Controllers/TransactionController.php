<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function index(Request $request)
    {
        $transactions = auth()->user()
            ->transactions()
            ->latest()
            ->paginate(10);

        if ($request->ajax()) {
            $view = view('transactions.partials.transactions_rows', compact('transactions'))->render();
            return response()->json([
                'html' => $view,
                'hasMorePages' => $transactions->hasMorePages(),
                'currentPage' => $transactions->currentPage(),
            ]);
        }

        return view('transactions.index', compact('transactions'));
    }
}
