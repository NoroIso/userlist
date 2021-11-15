@extends('templates.main')

@section('content')

  <div class="row">
  	<div class="col-12">
  	   <h1 class="float-start">Posts</h1>
  	   <a class="btn btn-sm btn-success float-end" href="{{ route('user.posts.create') }}" role="button">Create</a>	
  	</div>
  </div>

  <div class='card'>
  	<table class='table'>
  		<thead>
  		<tr>
  			<th scope='col'>#Id</th>
  			<th scope='col'>Title</th>
  			<th scope='col'>Description</th>
  			<!-- <th scope='col' width="30%">Image</th> -->
  			<th scope='col'>Actions</th>
  		</tr>
  		</thead>
  		<tbody>
  		@foreach($posts as $post)
  		<tr>
  			<th scope='col'>{{ $post->id }}</th>
  			<td>{{ $post->title }}</td>
  			<td>{{ $post->description }}</td>
  			<!-- <td>{{ $post->file_path }}</td> -->
  			<td>
           <a class="btn btn-sm btn-warning" href="{{ route('user.posts.show', $post->id) }}" role="button">Show</a>
  			  <a class="btn btn-sm btn-primary" href="{{ route('user.posts.edit', $post->id) }}" role="button">Edit</a>
  			  <button type="button" class="btn btn-sm btn-danger" onclick="event.preventDefault();document.getElementById('delete-post-form-{{ $post->id }}').submit()"> 
  			   Delete 
  			 </button>
  			 <form id="delete-post-form-{{$post->id}}" action="{{ route('user.posts.destroy', $post->id)}}" method='post' style="display: none">
  			 	@csrf
  			 	@method("DELETE")
  			 </form>
  			</td>
  		</tr>
  		@endforeach	
  		</tbody>
  	</table>
  	{{ $posts->links() }}
  </div>
@endsection