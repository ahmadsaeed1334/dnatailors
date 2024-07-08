<?php

namespace App\Livewire\Partials;

use App\Models\Professor;
use App\Models\Subject;
use App\Models\User;
use App\Models\Room;
use Livewire\Component;
use Livewire\Attributes\Layout;
#[Layout('layouts.app')]
class Dashboard extends Component
{
    public $totalUsers;
    public $totalProfessors;
    public $totalSubjects;
    public $totalRooms;

    public function mount()
    {
        // Fetch the counts from your database
        $this->totalUsers = User::count();
        $this->totalProfessors = Professor::count();
        $this->totalSubjects = Subject::count();
        $this->totalRooms = Room::count();
    }
    public function render()
    {
        return view('livewire.partials.dashboard');
    }
}
