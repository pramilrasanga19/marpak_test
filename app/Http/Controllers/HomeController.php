<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        return view('home', [
            'balance' => auth()->user()->balance,
            'recentTransactions' => auth()->user()->transactions()
                ->latest()
                ->take(5)
                ->get()
        ]);
    }
}