<?php

namespace App\Livewire\Partials;

use Livewire\Component;
use Livewire\Attributes\Layout;
#[Layout('layouts.app')]
class Contact extends Component
{
    public function render()
    {
        return view('livewire.partials.contact');
    }
}
