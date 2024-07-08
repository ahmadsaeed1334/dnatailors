<?php

namespace App\Livewire;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\Attributes\Layout;
#[Layout('layouts.app')]
class UserProfile extends Component
{
    public $users;

    public function mount()
    {
        $currentUser = Auth::user();

        if ($currentUser->user_type > 0) {
            abort(403, 'Unauthorized action.');
        }

        $this->users = User::where('id', '!=', $currentUser->id)->get();
    }
    public function loginAsUser($userId)
    {
        $user = User::find($userId);
        if ($user) {
            Auth::login($user);
            return redirect()->route('teacher-timetable'); 
        }
    }
    public function deleteUser($userId)
    {
        $user = User::find($userId);
        if ($user) {
            $user->delete();
            $this->users = User::where('id', '!=', Auth::id())->get(); 
        }
    }
    public function render()
    {
        return view('livewire.user-profile');
    }
}
