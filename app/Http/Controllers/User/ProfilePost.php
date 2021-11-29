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

    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'title' => 'required|max:255',
            'description' => 'required|min:8|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ]);

            // Get filename with the extension
            $filenameWithExt = $request->file('image')->hashName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('image')->extension();
            // Filename to store
            $fileNameToStore= $filename.'_'.time().'.'.$extension;


            try{
                // Upload Image
                $path = $request->file('image')->storePubliclyAs('images', $fileNameToStore, 'public');
            } catch (Exception $e) {
                $request->session()->flash('error', $e->getMessage());
            }

        $validatedData['image'] = $fileNameToStore;


        $post = Post::create($validatedData);

        //Post::create(array_merge($validatedData,['user_id' => auth()->id()]));

        $post->users()->sync($request->users);

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

    public function update(Request $request, $id)
    {

         //$this->authorize('update', $post);

        $post = Post::find($id);

        if(!$post->id=$id){
            $request->session()->flash('error', 'You can not edit this post');
            return redirect(route('user.posts.index'));
        }

        $validatedData = $request->validate([
            'title' => 'required|max:255',
            'description' => 'required|min:8|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ]);

            // Get filename with the extension
            $filenameWithExt = $request->file('image')->hashName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('image')->extension();
            // Filename to store
            $fileNameToStore= $filename.'_'.time().'.'.$extension;


            try{
                // Upload Image
                $path = $request->file('image')->storePubliclyAs('images', $fileNameToStore, 'public');
            } catch (Exception $e) {
                $request->session()->flash('error', $e->getMessage());
            }

        $validatedData['image'] = $fileNameToStore;


        $post->update($validatedData);
        $post->users()->sync($request->users);

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
