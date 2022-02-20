<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jenis_bencana extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function bencana()
    {
        return $this->hasMany('App\Models\Bencana', 'jb_id');
    }
}
