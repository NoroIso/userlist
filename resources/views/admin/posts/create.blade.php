@extends('templates.main')

@section('content')
  <h1>Create new post</h1>

  <div class="card">
  <form method="post" action="{{ route('admin.posts.store') }}"  enctype="multipart/form-data">
  	@include('admin.posts.partials.form', ['create' => true])
  </form>
  </div>

@endsection