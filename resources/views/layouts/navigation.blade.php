<x-app-layout>
    <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom border-gray-100">
      <div class="container-fluid">
        <a class="navbar-brand" href="/">TimelyGenius</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="{{ route('rooms') }}">Imformation</a>
            </li>
            {{-- <li class="nav-item">
              <a class="nav-link" href="{{ route('rooms') }}">Rooms</a>
            </li> --}}
            <li class="nav-item">
              <a class="nav-link" href="{{ route('subjects') }}">Subjects</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('teachers') }}">Teachers</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('schedules') }}">Schedules</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('semesters') }}">Semesters</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('departments') }}">Departments</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('register-form') }}">Register</a>
            </li>
            @if(Auth::user()->id == 1)
              <li class="nav-item">
                <a class="nav-link" href="{{ route('user.profile') }}">User Profile</a>
              </li>
            @endif
          </ul>
          <div class="d-flex align-items-center">
            <div wire:poll.1000ms>
              <livewire:cartcounter />
            </div>
            @if (Laravel\Jetstream\Jetstream::hasTeamFeatures())
              <div class="dropdown me-3">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="teamDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                  {{ Auth::user()->currentTeam->name }}
                </button>
                <ul class="dropdown-menu" aria-labelledby="teamDropdown">
                  <li class="dropdown-header">{{ __('Manage Team') }}</li>
                  <li><a class="dropdown-item" href="{{ route('teams.show', Auth::user()->currentTeam->id) }}">{{ __('Team Settings') }}</a></li>
                  @can('create', Laravel\Jetstream\Jetstream::newTeamModel())
                    <li><a class="dropdown-item" href="{{ route('teams.create') }}">{{ __('Create New Team') }}</a></li>
                  @endcan
                  @if (Auth::user()->allTeams()->count() > 1)
                    <li><hr class="dropdown-divider"></li>
                    <li class="dropdown-header">{{ __('Switch Teams') }}</li>
                    @foreach (Auth::user()->allTeams() as $team)
                      <li><a class="dropdown-item" href="#">{{ $team->name }}</a></li>
                    @endforeach
                  @endif
                </ul>
              </div>
            @endif
            <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                  <img class="rounded-circle" src="{{ Auth::user()->profile_photo_url }}" alt="{{ Auth::user()->name }}" style="height: 30px; width: 30px;">
                @else
                  {{ Auth::user()->name }}
                @endif
              </button>
              <ul class="dropdown-menu" aria-labelledby="userDropdown">
                <li class="dropdown-header">{{ __('Manage Account') }}</li>
                <li><a class="dropdown-item" href="{{ route('profile.show') }}">{{ __('Profile') }}</a></li>
                @if (Laravel\Jetstream\Jetstream::hasApiFeatures())
                  <li><a class="dropdown-item" href="{{ route('api-tokens.index') }}">{{ __('API Tokens') }}</a></li>
                @endif
                <li><hr class="dropdown-divider"></li>
                <li>
                  <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" class="dropdown-item">{{ __('Log Out') }}</button>
                  </form>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </x-app-layout>