<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePostRequest;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;

class ProfilePost extends Controller
{
    public function index(){
    	return view('user.posts.index',['posts' => Post::paginate(10)]);
    }

    public function show($id){
     	//$post = Post::find($id);
        return view('user.posts.show',['posts' => Post::find($id)]);
     }

     public function create()
     {
        return view('user.posts.create', ['posts' => Post::all()]);
     }

    public function store(StorePostRequest $request)
    {

        $validatedData = $request->validated();

        //$imageName = time().'.'.$request->image->extension();  
     
        //$request->image->move(public_path('images'), $imageName);

        $post = Post::create($validatedData);

        $post->users()->attach($request->users);

        $request->session()->flash('success', 'You have created the post');

        return redirect(route('user.posts.index'));
    }

    public function edit($id)
    {
        return view('user.posts.edit', 
            [
                'users' => User::all(),
                'post' => Post::find($id)
            ]);
    }

    public function update(StorePostRequest $request, $id)
    {
        $post = Post::find($id);

        if(!$post->id=$id){
            $request->session()->flash('error', 'You can not edit this post');
            return redirect(route('user.posts.index'));
        }

        $validatedData = $request->validated();

        //$imageName = time().'.'.$request->image->extension();  
     
        //$request->image->move(public_path('images'), $imageName);

        $post->update($validatedData);
        $post->users()->attach($request->users);

        $request->session()->flash('success', 'You have edited the post');

        return redirect(route('user.posts.index'));
    }

    public function destroy($id, Request $request)
    {
        Post::destroy($id);

        $request->session()->flash('success', 'You have deleted the post');

        return redirect(route('user.posts.index'));
    }
}
