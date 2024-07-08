<div>
    <div class=" mt-5">
        <h1 class="text-center text-black" style="color: black">DHA TAILORS</h1>
        <div class="row">
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Search by name, phone or house address" wire:model.live="search">
            </div>
            <div class="col-md-6">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Add Customer Detail
                </button>
            </div>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12">

            <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Phone No</th>
                    <th>House Address</th>
                    <th>Date</th>
                    <th>Bust</th>
                    <th>Waist</th>
                    <th>Hips</th>
                    <th>Bicep</th>
                    <th>Thigh</th>
                    <th>Calf</th>
                    <th>Weight</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($personalDetails as $detail)
                <tr>
                    <td>{{ $detail->name }}</td>
                    <td>{{ $detail->phone_no }}</td>
                    <td>{{ $detail->address }}</td>
                    <td>{{ \Carbon\Carbon::parse($detail->date)->format('d-m-Y') }}</td>
                    <td>{{ $detail->bust }}</td>
                    <td>{{ $detail->waist }}</td>
                    <td>{{ $detail->hips }}</td>
                    <td>{{ $detail->bicep }}</td>
                    <td>{{ $detail->thigh }}</td>
                    <td>{{ $detail->calf }}</td>
                    <td>{{ $detail->weight }}</td>
                    <td>
                        <button wire:click="edit({{ $detail->id }})" class="btn btn-primary btn-sm resource-update-btn" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-pencil"></i></button>
                        <button   onclick="confirmDelete(event, {{ $detail->id }})" class="btn btn-danger btn-sm resource-delete-btn" ><i class="fa fa-trash"></i></button>
               
                        {{-- <button wire:click="edit({{ $detail->id }})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">Edit</button>
                        <button wire:click="delete({{ $detail->id }})" class="btn btn-danger btn-sm">Delete</button> --}}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        {{-- {{ $personalDetails->Links() }} --}}
        @if ($personalDetails->hasPages())
        <nav>
            <ul class="pagination">
                {{-- Previous Page Link --}}
                @if ($personalDetails->onFirstPage())
                    <li class="page-item disabled" aria-disabled="true" aria-label="@lang('pagination.previous')">
                        <span class="page-link" aria-hidden="true">&laquo;</span>
                    </li>
                @else
                    <li class="page-item">
                        <button type="button" class="page-link" wire:click="previousPage" wire:loading.attr="disabled" rel="prev" aria-label="@lang('pagination.previous')">&laquo;</button>
                    </li>
                @endif
    
                {{-- Pagination Elements --}}
                @foreach ($personalDetails->links()->elements as $element)
                    {{-- "Three Dots" Separator --}}
                    @if (is_string($element))
                        <li class="page-item disabled" aria-disabled="true"><span class="page-link">{{ $element }}</span></li>
                    @endif
    
                    {{-- Array Of Links --}}
                    @if (is_array($element))
                        @foreach ($element as $page => $url)
                            @if ($page == $personalDetails->currentPage())
                                <li class="page-item active" aria-current="page"><span class="page-link">{{ $page }}</span></li>
                            @else
                                <li class="page-item"><button type="button" class="page-link" wire:click="gotoPage({{ $page }})">{{ $page }}</button></li>
                            @endif
                        @endforeach
                    @endif
                @endforeach
    
                {{-- Next Page Link --}}
                @if ($personalDetails->hasMorePages())
                    <li class="page-item">
                        <button type="button" class="page-link" wire:click="nextPage" wire:loading.attr="disabled" rel="next" aria-label="@lang('pagination.next')">&raquo;</button>
                    </li>
                @else
                    <li class="page-item disabled" aria-disabled="true" aria-label="@lang('pagination.next')">
                        <span class="page-link" aria-hidden="true">&raquo;</span>
                    </li>
                @endif
            </ul>
        </nav>
    @endif
    
    <script>
        function confirmDelete(event, id) {
            if (confirm('Are you sure you want to delete this record?')) {
                // If user confirms, manually trigger the Livewire delete method
                @this.call('delete', id);
            } else {
                // Prevent the default action if the user cancels
                event.preventDefault();
            }
        }
    </script>
    
    </div>
    </div>

    <!-- Modal -->
    <div wire:ignore.self class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ $updateMode ? 'Update' : 'Add' }} Personal Detail</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        
                        <div class="form-group row">
                        <div class="col-lg-12 col-md-12 col-sm-12 ">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" wire:model="name">
                            @error('name') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 ">

                        {{-- <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" wire:model="email">
                            @error('email') <span class="text-danger">{{ $message }}</span> @enderror
                        </div> --}}
                        </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="form-group">
                            <label>Phone No</label>
                            <input type="number" class="form-control" wire:model="phone_no">
                            @error('phone_no') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 ">

                        <div class="form-group">
                            <label>Date</label>
                            <input type="date" class="form-control" wire:model="date">
                            @error('date') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                       
                        
                        </div>
                        <div class="form-group">
                            <label>House Address</label>
                            <textarea type="text" class="form-control" wire:model="address"> </textarea>
                            @error('address') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="form-group">
                            <label>Bust</label>
                            <input type="number" step="0.01" class="form-control" wire:model="bust">
                            @error('bust') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="form-group">
                            <label>Waist</label>
                            <input type="number" step="0.01" class="form-control" wire:model="waist">
                            @error('waist') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="form-group">
                            <label>Hips</label>
                            <input type="number" step="0.01" class="form-control" wire:model="hips">
                            @error('hips') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="form-group">
                            <label>Bicep</label>
                            <input type="number" step="0.01" class="form-control" wire:model="bicep">
                            @error('bicep') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="form-group">
                            <label>Thigh</label>
                            <input type="number" step="0.01" class="form-control" wire:model="thigh">
                            @error('thigh') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="form-group">
                            <label>Calf</label>
                            <input type="number" step="0.01" class="form-control" wire:model="calf">
                            @error('calf') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 ">
                        <div class="form-group">
                            <label>Weight</label>
                            <input type="number" step="0.01" class="form-control" wire:model="weight">
                            @error('weight') <span class="text-danger">{{ $message }}</span> @enderror
                        </div>
                        </div>
                        </div>
                        <button type="button"  wire:click.prevent="{{ $updateMode ? 'update' : 'store' }}" class="btn btn-primary mt-3">{{ $updateMode ? 'Update' : 'Save' }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    window.livewire.on('personalDetailStore', () => {
        $('#exampleModal').modal('hide');
    });
</script>
