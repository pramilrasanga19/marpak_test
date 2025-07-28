<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Transaction extends Model
{
    const TYPE_TOPUP = 'topup';
    const TYPE_PAYMENT = 'payment';
    const TYPE_TRANSFER = 'transfer';

    protected $fillable = [
        'user_id',
        'type',
        'amount',
        'description',
        'related_user_id'
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'created_at' => 'datetime:Y-m-d H:i:s',
        'updated_at' => 'datetime:Y-m-d H:i:s',
    ];


    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }


    public function relatedUser(): BelongsTo
    {
        return $this->belongsTo(User::class, 'related_user_id');
    }


    public function scopeTopups($query)
    {
        return $query->where('type', self::TYPE_TOPUP);
    }


    public function scopePayments($query)
    {
        return $query->where('type', self::TYPE_PAYMENT);
    }


    public function scopeTransfers($query)
    {
        return $query->where('type', self::TYPE_TRANSFER);
    }


    public function getFormattedAmountAttribute(): string
    {
        return '$' . number_format($this->amount, 2);
    }
}