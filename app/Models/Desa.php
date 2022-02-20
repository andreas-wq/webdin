<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Desa extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function kecamatan()
    {
        return $this->belongsTo('App\Models\kecamatan', 'kecamatan_id');
    }
    public function bencana()
    {
        return $this->hasMany('App\Models\Bencana', 'desa_id');
    }
}
