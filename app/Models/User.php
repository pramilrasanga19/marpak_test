<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory, Notifiable, LogsActivity;


    protected $fillable = [
        'name',
        'email',
        'password',
        'balance'
    ];


    protected $hidden = [
        'password',
        'remember_token',
    ];


    protected $casts = [
        'email_verified_at' => 'datetime',
        'balance' => 'decimal:2',
    ];


    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'email', 'balance'])
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->setDescriptionForEvent(fn(string $eventName) => "User {$this->email} was {$eventName}")
            ->useLogName('user_activities');
    }


    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }


    public function receivedTransactions()
    {
        return $this->hasMany(Transaction::class, 'related_user_id');
    }


    public function hasSufficientBalance(float $amount): bool
    {
        return $this->balance >= $amount;
    }
}