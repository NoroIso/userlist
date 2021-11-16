@extends('templates.main')

@section('content')
  <h1>Create new post</h1>

  <div class="card">
  <form method="post" action="{{ route('user.posts.store') }}" enctype="multipart/form-data">
  	@include('user.posts.partials.form', ['create' => true])
  </form>
  </div>

@endsection