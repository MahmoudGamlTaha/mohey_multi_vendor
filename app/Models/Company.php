<?php
namespace App\Models;
use Helper;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
   protected $table = 'companies';
   protected $fillable = ['id', 'name', 'activity_id', 'notes'];

   public function getContact(){
      return $this->hasMany(\App\Models\CompanyContact::class, 'company_id', 'id');
   }
   public function products(){
      return $this->hasMany(ShopProduct::class,'company_id','id');
   }
   public function activity(){
       return $this->belongsTo(ShopActivity::class, 'activity_id', 'id');
   }
   public function companyContact(){
    return $this->hasMany(\App\Models\CompanyContact::class, 'company_id', 'id');
 }
//    public function name() sprint 1
//     {
//       //  return $this->name;
//     }
    
    public function local()
    {
        $lang = Language::pluck('id', 'code')->all();
        return ShopCategoryDescription::where('shop_category_id', $this->id)
            ->where('lang_id', $lang[app()->getLocale()])
            ->first();
    }

    public function configs(){
        return $this->hasMany(Config::class, 'company_id', 'id');
    }

    public function globalConfigs() {
        return $this->hasMany(ConfigGlobal::class, 'company_id', 'id');
    }
    public function getVendors($limit = null, $opt = null, $sortBy = null, $sortOrder = 'asc')
    {
        $sortBy = isset($sortBy)?$sortBy : 'id';
        $query = $this->orderBy($sortBy, $sortOrder);
        if (!(int) $limit) {
            return $query->get();
        } else
        if ($opt == 'paginate') {
            return $query->paginate((int) $limit);
        } else
        if ($opt == 'random') {
            return $query->inRandomOrder()->limit($limit)->get();
        } else {
            return $query->limit($limit)->get();
        }

    }
    public function getProductsForFront($id, $limit = null, $opt = null, $sortBy = null, $sortOrder = 'asc'){
        $query = (new ShopProduct)->where('status', 1)->where('company_id', $id);
         //Hidden product out of stock
         if (empty(\Helper::configs()['product_display_out_of_stock'])) {
            $query = $query->where('stock', '>', 0);
        }
        $sortBy = isset($sortBy)?$sortBy : 'id';
        $query = $query->orderBy($sortBy, $sortOrder);
        if (!(int) $limit) {
            return $query->get();
        } else
        if ($opt == 'paginate') {
            return $query->paginate((int) $limit);
        } else
        if ($opt == 'random') {
            return $query->inRandomOrder()->limit($limit)->get();
        } else {
            return $query->limit($limit)->get();
        }
     }
    public function scopeSort($query, $sortBy = null, $sortOrder = 'asc') //search scope sort on colmumn laravel  
    {
        $sortBy = $sortBy ?? 'sort';
        return $query->orderBy($sortBy, $sortOrder);
    }
    public function getUrl()
    {
        return route('vendor', ['name' => Helper::strToUrl($this->name), 'id' => $this->id]);
    }
    public function getImage()
    {
        $path_file = config('filesystems.disks.path_file', '');
        
        return $path_file . '/' . $this->logo;

    }
    
}