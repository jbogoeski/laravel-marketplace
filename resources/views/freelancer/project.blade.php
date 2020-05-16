@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-dark text-white">
                	<h5 class="mb-0">{{ $project->title }}</h5>
                </div>

                <div class="card-body">

                    <p>{{ $project->description }}</p>

                    @if(!empty($project->skills))
                        <p><strong>Skills:</strong> {{ $project->skills }}</p>
                    @endif

                    @if($claimable)
					    <claim-project-button :project-id="{{ $project->id }}" />
                    @endif

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
