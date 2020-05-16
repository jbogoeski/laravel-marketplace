<?php

namespace App;

use App\User;
use Laravel\Scout\Searchable;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;

class Project extends Model {

    use Searchable;

    protected $hidden = [
        'ownner_id',
        'contractor_id',
    ];
    
    protected $casts = [
        'is_active' => 'boolean',
    ];
    
    public function owner() {
        return $this->belongsTo(User::class, 'owner_id');
    }
    
    public static function openProjects() {
        return static::where('contractor_id', null)
        ->where('owner_id', '<>', Auth::id())
        ->where('is_active', true);
    }

    public function toSearchableArray() {
        return $array = array_merge($this->toArray(), [
            'owner_id' => $this->owner_id === null ? 0 : $this->owner_id,
            'contractor_id' => $this->contractor_id === null ? 0 : $this->contractor_id,
        ]);
    }
}
