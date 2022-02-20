<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staffskt extends Model
{
    use HasFactory;
    protected $guarded=[];
    public function sekretariat(){
        return $this->belongsTo(Sekretariat::class, 'sekretariat_id', 'id');
        
      }
}
