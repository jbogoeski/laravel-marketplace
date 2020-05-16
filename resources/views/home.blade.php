@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-dark text-white">
                	<h5 class="mb-0">Dashboard</h5>
                </div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="card">
                        <div class="card-header bg-dark text-white rounded-0">
                        	<div class="row">
								<div class="col-md-8 d-flex">
                        			<h5 class="mb-0 align-self-center">Projects I've Posted</h5>
								</div>
								<div class="col-md-4 text-right">
									<a class="btn btn-info text-white" href="{{ route('create-project') }}">New Project</a>
								</div>
                        	</div>
                        </div>

                        <div class="card-body">
                            <posted-projects />
                        </div>
                    </div>
					<hr />
                    <div class="card">
                        <div class="card-header bg-dark text-white rounded-0">
                        	<div class="row">
								<div class="col-md-8 d-flex">
                        			<h5 class="mb-0 align-self-center">Projects I'm Working on</h5>
								</div>
								<div class="col-md-4 text-right">
									<a class="btn btn-info text-white" href="{{ route('list-projects') }}">Find Work</a>
								</div>
                        	</div>
                        </div>

                        <div class="card-body">
                            <list-claimed-projects />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
