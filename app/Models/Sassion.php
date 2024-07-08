<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sassion extends Model
{
    use HasFactory;
    protected $fillable = ['name'];

    public function semesters()
    {
        return $this->belongsToMany(Semester::class);
    }
}
