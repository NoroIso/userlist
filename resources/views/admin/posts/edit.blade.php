@extends('templates.main')

@section('content')
  <h1>Edit post</h1>

  <div class="card">
  <form method="post" action="{{ route('admin.posts.update', $post->id) }}" enctype="multipart/form-data">
  	@method('PATCH')
  	@include('admin.posts.partials.form')
  </form>
  </div>

@endsection