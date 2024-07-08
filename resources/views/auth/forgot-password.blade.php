<x-guest-layout>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <x-authentication-card>
        <x-slot name="logo">
            {{-- <x-authentication-card-logo /> --}}
            <img src="{{ asset('assets/images/logo1.png') }}" alt="Logo" style="height: 90px;width: 150px;">

        </x-slot>

        <div class="mb-4 text-sm text-gray-600">
            {{ __('Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.') }}
        </div>
        <style>
            .form-control{
                    border-radius: 50px;
                    border: 1px solid #359381;

                }
                .form-label{
                    color: #359381;
                }
        </style>
        @if (session('status'))
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ session('status') }}
            </div>
        @endif

        <x-validation-errors class="mb-4" />

        <form method="POST" action="{{ route('password.email') }}">
            @csrf
        
            <div class="mb-3">
                <label for="email" class="form-label">{{ __('Email') }}</label>
                <input id="email" class="form-control" type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="username">
            </div>
        
            <div class="d-flex justify-content-end mt-4">
                <button type="submit" class="btn btn-success">
                    {{ __('Email Password Reset Link') }}
                </button>
            </div>
        </form>
        
    </x-authentication-card>
</x-guest-layout>
