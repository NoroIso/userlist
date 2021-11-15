<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Post;
use App\Models\User;

class PostUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $posts = Post::all();

        User::all()->each(function ($user) use ($posts){
        	$user->posts()->attach(
        		$posts->random(1)->pluck('id')
        	);
        });
    }
}
