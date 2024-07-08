<x-guest-layout>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <x-authentication-card>
        <x-slot name="logo">
            {{-- <x-authentication-card-logo /> --}}
            <img src="{{ asset('assets/images/logo1.png') }}" alt="Logo" style="height: 90px;width: 150px;">
        </x-slot>

        <x-validation-errors class="mb-4" />

        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif
<style>
    .form-control{
            border-radius: 50px;
            border: 1px solid #359381;

        }
        .form-label{
            color: #359381;
        }
</style>
        <form method="POST" action="{{ route('login') }}">
            @csrf

            <div class="mb-3">
                <label for="email" class="form-label">{{ __('Email') }}</label>
                <input id="email" class="form-control" type="email" name="email" :value="old('email')" required autofocus autocomplete="username" />
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">{{ __('Password') }}</label>
                <input id="password" class="form-control" type="password" name="password" required autocomplete="current-password" />
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="remember_me" name="remember" />
                <label class="form-check-label" for="remember_me">{{ __('Remember me') }}</label>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-success">{{ __('Log in') }}</button>
            </div>

            <div class="text-center mt-3">
                <a class="text-decoration-none" href="{{ route('register') }}">
                    {{ __('Register') }}
                </a>
            </div>

            @if (Route::has('password.request'))
                <div class="text-center mt-3">
                    <a class="text-decoration-none" href="{{ route('password.request') }}">
                        {{ __('Forgot your password?') }}
                    </a>
                </div>
            @endif
        </form>
    </x-authentication-card>
</x-guest-layout>
