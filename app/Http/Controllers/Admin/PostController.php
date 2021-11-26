<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePostRequest;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.posts.index',['posts' => Post::paginate(10)]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.posts.create', ['users' => User::all()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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

        $post->users()->sync($request->users);

        $request->session()->flash('success', 'You have created the post');

        return redirect(route('admin.posts.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('admin.posts.edit', 
            [
                'users' => User::all(),
                'post' => Post::find($id)
            ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update( Request $request, $id)
    {

        $post = Post::find($id);

        if(!$post){
            $request->session()->flash('error', 'You can not edit this post');
            return redirect(route('admin.posts.index'));
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

        return redirect(route('admin.posts.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {
        Post::destroy($id);

        $request->session()->flash('success', 'You have deleted the post');

        return redirect(route('admin.posts.index'));
    }
}
