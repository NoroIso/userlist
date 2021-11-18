<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Hash;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    //public function setPasswordAttribute($password){
       // $this->attributes['password'] = Hash::make($password);
    //}

    public function roles(){
        return $this->belongsToMany('App\Models\Role');
    }
    public function posts(){
        return $this->belongsToMany('App\Models\Post');
    }


    //public function posts()
    //{
      //return $this->hasMany(Post::class, 'user_id');
    //}

    /**
      Check if the user has a role
      @param string $role
      @return bool
    */
    public function hasAnyRole($role){
        return null !== $this->roles()->where('name',$role)->first();
    }
    /**
      Check the user has any given roles
      @param string $role
      @return bool
    */
    public function hasAnyRoles($role){
        return null !== $this->roles()->whereIn('name',$role)->first();
    }
}
