@extends('templates.main')

@section('content')
  <h1>Edit post</h1>

  <div class="card">
  <form method="post" action="{{ route('user.posts.update', $post->id) }}" enctype="multipart/form-data">
  	@method('PATCH')
  	@include('user.posts.partials.form')
  </form>
  </div>

@endsection