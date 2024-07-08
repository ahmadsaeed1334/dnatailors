<?php

namespace App\Livewire;

use App\Models\Teacher;
use App\Models\Students;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;
use Livewire\Attributes\Layout;
#[Layout('layouts.app')]
class RegisterForm extends Component
{
    use LivewireAlert;
    public $name;
    public $email;
    public $password;
    public $password_confirmation;
    protected $rules = [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
    ];
    public function submit()
    {
        $this->validate();

        User::create([
            'name' => $this->name,
            'email' => $this->email,
            'password' => Hash::make($this->password),
            'user_type' =>1, 
        ]);
        $this->alert('success', 'Teacher created successfully.');
        // Reset the form fields
        $this->reset(['name', 'email', 'password', 'password_confirmation']);
    }
    public function render()
    {
        return view('livewire.register-form');
    }
  
    
}
