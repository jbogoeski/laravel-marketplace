@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-dark text-white">
                	<h5 class="mb-0">Open Projects</h5>
                </div>

                <div class="card-body">

					<list-projects />

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
