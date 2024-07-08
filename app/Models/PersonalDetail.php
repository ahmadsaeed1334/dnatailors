<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersonalDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'name', 'phone_no', 'address', 'date', 
        'bust', 'waist', 'hips', 'bicep', 'thigh', 'calf', 'weight'
    ];
}
