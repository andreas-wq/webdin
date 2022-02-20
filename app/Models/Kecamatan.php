<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kecamatan extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function desa()
    {
        return $this->hasMany('App\Models\Desa', 'kecamatan_id');
    }
    public function bencana()
    {
        return $this->hasMany('App\Models\Bencana', 'kecamatan_id');
    }
}
