<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bencana extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function kecamatan()
    {
        return $this->belongsTo('App\Models\kecamatan', 'kecamatan_id');
    }
    public function desa()
    {
        return $this->belongsTo('App\Models\Desa', 'desa_id');
    }
    public function jenis_bencana()
    {
        return $this->belongsTo('App\Models\Jenis_bencana', 'jb_id');
    }
}
