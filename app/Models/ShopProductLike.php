<?php
#App\Models\ShopProductLike.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ShopProductLike extends Model
{
    const UPDATED_AT      = null;
    public $incrementing  = false;
    protected $primaryKey = null;
    public $table         = 'shop_product_like';
    protected $guarded    = [];

    public function getRate($product_id)
    {
        $productLikes = ShopProductLike::select(DB::raw("rate, count(users_id) as user_count"))->where('product_id', $product_id)->groupBy('rate')->get();
        for($i=0;$i<count($productLikes);$i++)
        {
            $rate_arr[$i] = $productLikes[$i]['rate']* $productLikes[$i]['user_count'];
            $user_arr[$i] = $productLikes[$i]['user_count'];
        }
        $rateSum  = array_sum($rate_arr ?? [0]);
        $userCount = array_sum($user_arr ?? [0]);
        if($rateSum > 0) {
            $percent = round( $rateSum/$userCount , 1);
            $ratePercentage = round(100 * $rateSum/($userCount * 5), 1);
        }

        return ['userCount'          => $userCount,
                'rateSum'            => $rateSum,
                'ratePercentage'     => $ratePercentage ?? 'لا يوجد تقييم',
                'percent'            => $percent?? 'لا يوجد تقييم',
                'productLikes'       => $productLikes ];
    }
}
