@csrf
	  <div class="mb-3">
	    <label for="title" class="form-label">Title</label>
	    <input name="title" type="text" class="form-control @error('title') is-invalid @enderror" id="title" aria-describedby="title" value="{{old('title')}} @isset($post) {{ $post->title }} @endisset" >
	    @error('title')
	      <span class="invalid-feedback" role="alert">
	      	{{ $message }}
	      </span>
	    @enderror
	  </div>
	  <div class="mb-3">
	    <label for="description" class="form-label">Description</label>
	    <input name="description" type="text" class="form-control @error('description') is-invalid @enderror" id="description" aria-describedby="description" value="{{old('description')}} @isset($post) {{ $post->description }} @endisset" >
	    @error('description')
	      <span class="invalid-feedback" role="alert">
	      	{{ $message }}
	      </span>
	    @enderror
	  </div>
	  <div class="mb-3">
	  	<label for="image" class="form-label">Image</label>
	  	<input type="file" name="image" class="form-control" id="image">
	  </div>
	  
	  <button type="submit" class="btn btn-primary">Submit</button>