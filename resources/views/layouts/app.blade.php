
{{-- @php
    $userId = session('id');
@endphp --}}

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Abdul Razzaq') }}</title>
        @include('livewire.partials.styles')

{{-- <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script> --}}

        <style>

        </style>
    </head>
    <body class="font-sans antialiased">
        <x-banner />

        {{-- <div class="min-h-screen bg-gray-100"> --}}
            {{-- @livewire('navigation-menu') --}}
            {{-- @include('livewire.partials.navbar') --}}
            {{-- @include('layouts.navigation') --}}

            <div class="container-fluid">
                <div class="row">
                    {{-- @include('livewire.partials.header') --}}
                    {{-- @include('partials.sidebar') --}}
    
                    {{ $slot }}
                </div>
            </div>
           
            {{-- @auth --}}
            {{-- @else  --}}
            {{-- @include('layouts.gurestnavebar') --}}
            {{-- @endauth --}}

            <!-- Page Content -->
            <div class="container-scroller">
                <div class="container-fluid page-body-wrapper">
                   <div class="main-panel">
                    {{-- {{ $slot }} --}}
                  
                  </div>
                  </div>
                </div>
            {{-- </div> --}}
            @stack('modals')    
            {{-- @php
            $userId = session('id'); // replace with your actual session key
        @endphp --}}

        {{-- <livewire:checkout-form :userId="$userId" /> --}}

        {{-- @include('livewire.partials.footer') --}}
    @include('livewire.partials.scripts')

    </body>
</html>
