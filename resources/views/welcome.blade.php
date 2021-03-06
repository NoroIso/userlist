<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config("app.name", 'User Management System') }}</title>

    

        <!-- Styles -->
        
        <link rel="stylesheet"  href="{{ asset('css/app.css') }}">

        <!-- JS -->
        <script type="text/javascript" src="{{ asset('js/app.js') }}" defer></script>

    </head>
    <body class="antialiased">
        <div>
            @if (Route::has('login'))
                <div>
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Log in</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>
            @endif
        </div>

        <main>
            @yield('content')
        </main>
    </body>
</html>
