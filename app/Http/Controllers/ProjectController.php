<?php

namespace App\Http\Controllers;

use App\Project;
use App\Http\Requests\CreateProjectRequest;
use Illuminate\Support\Facades\Auth;
use App\Events\ProjectCreatedEvent;
use App\Http\Requests\UpdateProjectRequest;
use App\Http\Requests\SearchOpenProjectsRequest;

class ProjectController extends Controller
{
    public function showCreateProject()
    {
        $type = "create";
        return view('client.project', compact(['type']));
    }
    
    public function createProject(CreateProjectRequest $request) {
        $project = new Project();
        $project->title = $request->title;
        $project->description = $request->description;
        $project->owner_id = Auth::id();
        $project->skills = $request->skills;
        $project->save();
        
        event(new ProjectCreatedEvent($project));
        
        return response()->json([
            'redirect' => route('home'),
        ]);
    }
    
    public function updateProject(UpdateProjectRequest $request) {
        Project::where('owner_id', Auth::id())->where('id', $request->id)->update([
            'title'         => $request->title,
            'description'   => $request->description,
            'skills'        => $request->skills,
        ]);
        
        return response()->json([
            'redirect' => route('home'),
        ]);
    }
    
    public function showUpdateProject(int $id)
    {
        $type = "update";
        return view('client.project', compact(['type', 'id']));
    }
    
    public function getProject(int $id) {
        $project = Auth::user()->projects()->find($id);
        if ($project === null) {
            abort(403);
        }
        
        return response()->json($project);
    }
    
    public function listProjects()
    {
        return view('freelancer.list-projects');
    }
    
    public function listOpenProjects() {
        $projects = Project::openProjects()->get();
        return response()->json($projects);
    }
    
    public function searchOpenProjects(SearchOpenProjectsRequest $request) {
        $projects = Project::search($request->term)->where('contractor_id', 0)->get();
        return response()->json($projects);
    }
    
    public function showProject(int $id)
    {
        $project = Project::find($id);
        if ($project === null) {
            abort(404);
        }
        
        $claimable = ($project->is_active && $project->owner_id !== Auth::id() && $project->contractor_id === null);
        return view('freelancer.project', compact(['project', 'claimable']));
    }
    
    public function listOwned() {
        $user = Auth::user();
        $projects = $user->projects()->orderBy('updated_at', 'DESC')->get();
        return response()->json($projects);
    }
    
    public function toggleActive(int $id) {
        $user = Auth::user();
        $project = $user->projects()->find($id);
        if ($project === null) {
            abort(403);
        }
        
        $project->is_active = !$project->is_active;
        $project->save();
        
        return response()->json($project);
    }
    
    public function deleteProject(int $id) {
        Project::where('owner_id', Auth::id())->where('id', $id)->delete();
    }
    
    public function claimProject(int $id) {
        $project = Project::where('id', $id)
            ->where('is_active', true)
            ->where('contractor_id', null)
            ->where('owner_id', '<>', Auth::id())
            ->first();
        
        if ($project === null) {
            abort(403);
        }
        
        $project->contractor_id = Auth::id();
        $project->save();
        
        return response()->json([
            'redirect' => route('home'),
        ]);
    }
    
    public function listClaimed() {
        $projects = Project::where('is_active', true)
            ->where('contractor_id', Auth::id())
            ->orderBy('updated_at', 'DESC')
            ->get();
        
        return response()->json($projects);
    }
    
    public function endProject(int $id) {
        Project::where('id', $id)
            ->where('contractor_id', Auth::id())
            ->update([
                'contractor_id' => null,
                'is_active' => false,
            ]);
    }
}
