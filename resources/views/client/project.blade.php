@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-dark text-white">
                	<h5 class="mb-0">{{ $type === 'create' ? __('Add a Project') : __('Update Project') }}</h5>
                </div>

                <div class="card-body">
                    <client-project mode="{{ $type }}" :project-id="{{ empty($id) ? 0 : $id }}" />
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
