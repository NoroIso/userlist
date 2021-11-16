<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
//use Spatie\MediaLibrary\InteractsWithMedia;
//use Spatie\MediaLibrary\HasMedia;


class Post extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'image'
        //'user_id'

    ];

    public function users(){
    	return $this->belongsToMany('App\Models\User');
    }
}
