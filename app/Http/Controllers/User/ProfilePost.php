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

        if($request->hasFile('image')){
            // Get filename with the extension
            $filenameWithExt = $request->file('image')->getClientOriginalName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('image')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore= $filename.'_'.time().'.'.$extension;
            // Upload Image
            $path = $request->file('image')->storeAs('public/images', $fileNameToStore);
        } else {
            $fileNameToStore = 'noimage.jpg';
        }

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

         //$this->authorize('update', $post);

        $post = Post::find($id);

        if(!$post->id=$id){
            $request->session()->flash('error', 'You can not edit this post');
            return redirect(route('user.posts.index'));
        }

        $validatedData = $request->validated();

        if($request->hasFile('image')){
            // Get filename with the extension
            $filenameWithExt = $request->file('image')->getClientOriginalName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('image')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore= $filename.'_'.time().'.'.$extension;
            // Upload Image
            $path = $request->file('image')->storeAs('public/images', $fileNameToStore);
        } else {
            $fileNameToStore = 'noimage.jpg';
        }

        $post->update($validatedData);
        $post->users()->attach($request->users);

        $request->session()->flash('success', 'You have edited the post');

        return redirect(route('user.posts.index'));
    }

    public function destroy($id, Request $request)
    {


        //$this->authorize('delete', $post);

        Post::destroy($id);
        $request->session()->flash('success', 'You have deleted the post');

        return redirect(route('user.posts.index'));
    }
}
