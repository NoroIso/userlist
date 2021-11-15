<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class Profile extends Controller
{
     public function index(){
     	return view('user.users.index',['users' => User::paginate(10)]);
     }

     public function show($id){
        return view('user.users.show',['users' => User::find($id)]);
     }
}
