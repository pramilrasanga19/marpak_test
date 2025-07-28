<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\TopUpController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\TransferController;
use App\Http\Controllers\TransactionController;

Route::get('/', [HomeController::class, 'index'])->name('home')->middleware('auth');

// Top-up routes
Route::get('/topup', [TopUpController::class, 'create'])->name('topup.create')->middleware('auth');
Route::post('/topup', [TopUpController::class, 'store'])->name('topup.store')->middleware('auth');

// Bill payment routes
Route::get('/pay', [PaymentController::class, 'create'])->name('payment.create')->middleware('auth');
Route::post('/pay', [PaymentController::class, 'store'])->name('payment.store')->middleware('auth');

// Fund transfer routes
Route::get('/transfer', [TransferController::class, 'create'])->name('transfer.create')->middleware('auth');
Route::post('/transfer', [TransferController::class, 'store'])->name('transfer.store')->middleware('auth');

// Transaction history
Route::get('/transactions', [TransactionController::class, 'index'])->name('transactions.index')->middleware('auth');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
