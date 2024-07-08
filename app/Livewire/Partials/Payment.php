<?php

namespace App\Livewire\Partials;

use Livewire\Component;
use Livewire\Attributes\Layout;
#[Layout('layouts.app')]
class Payment extends Component
{
    public function render()
    {
        return view('livewire.partials.payment');
    }
}
