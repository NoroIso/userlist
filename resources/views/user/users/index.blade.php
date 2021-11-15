@extends('templates.main')

@section('content')

  <div class='card'>
  	<table class='table'>
  		<thead>
  		<tr>
  			<th scope='col'>#Id</th>
  			<th scope='col'>Name</th>
  			<th scope='col'>Email</th>
  			<th scope='col'>Actions</th>
  		</tr>
  		</thead>
  		<tbody>
  		@foreach($users as $user)
  		<tr>
  			<th scope='col'>{{ $user->id }}</th>
  			<td>{{ $user->name }}</td>
  			<td>{{ $user->email }}</td>
  			<td>
          <a class="btn btn-sm btn-warning" href="{{ route('user.users.show',$user->id) }}" role="button">Show</a>  
  			</td>
  		</tr>
  		@endforeach	
  		</tbody>
  	</table>
  	{{ $users->links() }}
  </div>
@endsection