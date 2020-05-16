<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Routing\Router;
use App\Models\User;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => 'web'], function (Router $router) {
    
    Auth::routes();
    $router->get('/', 'WelcomeController@index')->name('welcome');
    
    $router->group(['middleware' => 'auth'], function (Router $router) {
        
        $router->get('/home', 'HomeController@index')->name('home');
        $router->get('/projects/owned', 'ProjectController@listOwned');
        $router->get('/projects/claimed', 'ProjectController@listClaimed');
        $router->put('/projects/{id}/toggle-active', 'ProjectController@toggleActive');
        $router->put('/projects/{id}/end-project', 'ProjectController@endProject');
        
        $router->get('/projects/create', 'ProjectController@showCreateProject')->name('create-project');
        $router->post('/projects/create', 'ProjectController@createProject');
        
        $router->get('/projects/{id}/update', 'ProjectController@showUpdateProject');
        $router->put('/projects/update', 'ProjectController@updateProject');
        $router->get('/projects/{id}/details', 'ProjectController@getProject');
        
        $router->delete('/projects/{id}/delete', 'ProjectController@deleteProject');
        
        $router->get('/projects/list', 'ProjectController@listProjects')->name('list-projects');
        $router->get('/projects/list/open', 'ProjectController@listOpenProjects')->name('list-open-projects');
        $router->post('/projects/search-open', 'ProjectController@searchOpenProjects');
        
        $router->get('/projects/{id}/show', 'ProjectController@showProject')->name('show-project');
        $router->put('/projects/{id}/claim', 'ProjectController@claimProject');
        
    });
    
});
