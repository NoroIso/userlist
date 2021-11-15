<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config("app.name", 'User Management System') }}</title>

    

        <!-- Styles -->
        
        <link rel="stylesheet"  href="{{ asset('css/app.css') }}">
        <link rel="stylesheet"  href="{{ asset('css/style.css') }}">

        <!-- JS -->
        <script type="text/javascript" src="{{ asset('js/app.js') }}" defer></script>

    </head>
    <body>

        <nav class="navbar navbar-expand" aria-label="Second navbar example">
            <div class="container">
              <a class="navbar-brand" href="#">{{ config("app.name", 'User Management System') }}</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

                <div class="form-inline my-2 my-lg-0">
                  @if (Route::has('login'))
                    <div>
                        @auth
                            <a href="{{ route('user.users.index') }}">Users</a>
                            <a href="{{ route('user.posts.index') }}">Posts</a>
                            <a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Logout</a>

                            <form id="logout-form" action="{{ route('logout') }}" method="post" style="display: none">
                                @csrf
                            </form>
                        @else
                            <a href="{{ route('login') }}">Login</a>

                            @if (Route::has('register'))
                                <a href="{{ route('register') }}">Register</a>
                            @endif
                        @endauth
                    </div>
                  @endif
              </div>
            </div>
        </nav>
        @can('logged-in')
        @can('is-admin')
        <nav class="navbar sub-nav navbar-expand" aria-label="Second navbar example">
            <div class="container">

              <div class="collapse navbar-collapse" id="navbarsExample02">
                <ul class="navbar-nav me-auto">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                  </li>
                  <!-- @can('is-admin') -->
                  <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.users.index') }}">Users</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.posts.index') }}">Posts</a>
                  </li>
                  <!-- @endcan -->
                </ul>
              </div>
            </div>
        </nav>
        @endcan
        @endcan
        

        <main class="container">
            @include('partials.alerts')
            @yield('content')
        </main>
    </body>
</html>