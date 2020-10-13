<?php
#app/Models/Banner.php
namespace App\Models;

use App\Models\BannerType;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    public $table = 'banner';
    /**
     * [getImage description]
     * @return [type] [description]
     */
    public function getImage()
    {
        $path_file = config('filesystems.disks.path_file', '');
        return $path_file . '/' . $this->image;

    }
//Scort
    public function scopeSort($query, $column = null)
    {
        $column = $column ?? 'sort';
        return $query->orderBy($column, 'asc')->orderBy('id', 'desc');
    }

    public function type() {
       return $this->belongsTo(BannerType::class, 'type_id', 'id');
    }
    

}
