<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Biller extends Model
{
    protected $fillable = ['name', 'fee_percentage'];
    
  
    protected $table = null;

    public static function all($columns = [])
    {
        return collect([
            (object) ['id' => 1, 'name' => 'Electricity', 'fee_percentage' => 10],
            (object) ['id' => 2, 'name' => 'Water', 'fee_percentage' => 5],
            (object) ['id' => 3, 'name' => 'Internet', 'fee_percentage' => 0],
        ]);
    }

    public static function find($id)
    {
        return collect(self::all())->firstWhere('id', $id);
    }

    public static function findOrFail($id)
    {
        $biller = self::find($id);
        if (!$biller) {
            throw new \Illuminate\Database\Eloquent\ModelNotFoundException();
        }
        return $biller;
    }
}