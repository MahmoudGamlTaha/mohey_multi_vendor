<?php
namespace App\Models;
use App\Models\Banner;
use Illuminate\Database\Eloquent\Model;

class BannerType extends Model
{
    protected $table = 'banner_type';

    public function images(){
        return $this->hasMany(Banner::class, "type", "id");
    }
}