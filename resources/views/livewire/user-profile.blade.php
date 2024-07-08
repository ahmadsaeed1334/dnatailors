
<div class="row">
    @foreach($users as $user)
        <div class="col-lg-4">
            <div class="card mt-3">
                <div class="card-body">
                    <h2 class="card-title">{{ $user->name }}</h2>
                    <p class="card-text">{{ $user->email }}</p>
                    <div class="d-flex justify-content-between align-items-center">
                        @if($user->user_type == 1)
                            <span class="badge bg-success">Teacher</span>
                        @elseif($user->user_type == 2)
                            <span class="badge bg-primary">User</span>
                        @endif
                        <div class="btn-group">
                            <button class="btn btn-outline-primary" wire:click="loginAsUser({{ $user->id }})">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-login" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                    <path d="M14 20h-8a1 1 0 0 1 -1-1v-6a2 2 0 0 1 2-2h5l3-3v2" />
                                    <path d="M20 14v-2l-3-3h-5a2 2 0 0 0 -2 2v6" />
                                    <path d="M14 20l-2 2l-2 -2" />
                                </svg>
                            </button>
                            <button class="btn btn-outline-danger" wire:click="deleteUser({{ $user->id }})">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                    <path d="M4 7h16" />
                                    <path d="M10 11v6" />
                                    <path d="M14 11v6" />
                                    <path d="M5 7l1 -4h12l1 4" />
                                    <path d="M18 7v12a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2v-12" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
</div>
