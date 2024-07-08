<?php

namespace App\Livewire;

use App\Models\PersonalDetail;
use Livewire\WithPagination;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;

use Livewire\Attributes\Layout;
#[Layout('layouts.app')]
class PersonalDetails extends Component
{
    use LivewireAlert, WithPagination;

    public $name, $email, $phone_no, $address, $date, $bust, $waist, $hips, $bicep, $thigh, $calf, $weight;
    public $search = '';
    public $updateMode = false;
    public $personalDetailId;
    public $perPage = 10;
    protected $rules = [
        'name' => 'required|string',
        'phone_no' => 'required|string',
        'address' => 'required|string',
        'date' => 'required|date',
        'bust' => 'required|numeric',
        'waist' => 'required|numeric',
        'hips' => 'required|numeric',
        'bicep' => 'required|numeric',
        'thigh' => 'required|numeric',
        'calf' => 'required|numeric',
        'weight' => 'required|numeric',
    ];
    public function render()
    {
        $search = '%' . $this->search . '%';
        $personalDetails = PersonalDetail::where('name', 'like', $search)
            ->orWhere('phone_no', 'like', $search)
            ->orWhere('address', 'like', $search)
   ->paginate($this->perPage) ;
    // $personalDetail = PersonalDetail::orderBy('created_at', 'desc')
    // ->paginate($this->perPage);
        return view('livewire.personal-details', compact('personalDetails'));
    }
    public function resetInputFields()
    {
        $this->name = '';
        $this->phone_no = '';
        $this->address = '';
        $this->date = '';
        $this->bust = '';
        $this->waist = '';
        $this->hips = '';
        $this->bicep = '';
        $this->thigh = '';
        $this->calf = '';
        $this->weight = '';
    }
    public function store()
    {
        $this->validate();

        PersonalDetail::create([
            'name' => $this->name,
            'phone_no' => $this->phone_no,
            'address' => $this->address,
            'date' => $this->date,
            'bust' => $this->bust,
            'waist' => $this->waist,
            'hips' => $this->hips,
            'bicep' => $this->bicep,
            'thigh' => $this->thigh,
            'calf' => $this->calf,
            'weight' => $this->weight,
        ]);

        $this->alert('success', 'Personal Detail Created Successfully.');
        $this->resetInputFields();
        $this->dispatch('personalDetailStore'); 
        $this->updateMode = false;

    }

    public function edit($id)
    {
        $personalDetail = PersonalDetail::findOrFail($id);
        $this->personalDetailId = $id;
        $this->name = $personalDetail->name;
        $this->phone_no = $personalDetail->phone_no;
        $this->address = $personalDetail->address;
        $this->date = $personalDetail->date;
        $this->bust = $personalDetail->bust;
        $this->waist = $personalDetail->waist;
        $this->hips = $personalDetail->hips;
        $this->bicep = $personalDetail->bicep;
        $this->thigh = $personalDetail->thigh;
        $this->calf = $personalDetail->calf;
        $this->weight = $personalDetail->weight;

        $this->updateMode = true;
    }

    public function cancel()
    {
        $this->updateMode = false;
        $this->resetInputFields();
    }

    public function update()
    {
        $this->validate([
            'name' => 'required|string',
            'phone_no' => 'required|string',
            'address' => 'required|string',
            'date' => 'required|date',
            'bust' => 'required|numeric',
            'waist' => 'required|numeric',
            'hips' => 'required|numeric',
            'bicep' => 'required|numeric',
            'thigh' => 'required|numeric',
            'calf' => 'required|numeric',
            'weight' => 'required|numeric',
        ]);

        if ($this->personalDetailId) {
            $personalDetail = PersonalDetail::find($this->personalDetailId);
            $personalDetail->update([
                'name' => $this->name,
                'phone_no' => $this->phone_no,
                'address' => $this->address,
                'date' => $this->date,
                'bust' => $this->bust,
                'waist' => $this->waist,
                'hips' => $this->hips,
                'bicep' => $this->bicep,
                'thigh' => $this->thigh,
                'calf' => $this->calf,
                'weight' => $this->weight,
            ]);

            $this->updateMode = false;
            $this->alert('success', 'Personal Detail Updated Successfully.');
            $this->resetInputFields();
        }
    }
    public function confirmDelete($id)
{
    $this->dispatch('confirm-delete', ['id' => $id]);
}

    public function delete($id)
    {
        $detail = PersonalDetail::find($id);
        if ($detail) {
            $detail->delete();
        $this->alert('success', 'Personal Detail Deleted Successfully.');
    }
    }
}
