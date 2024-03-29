<?php

namespace App;

use App\Models\CustomerPaymentTerm;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table    = 'admin_users';
   /* protected $fillable = [
        'username', 'email', 'password', 'phone',
    ];*/
    protected $guarded = [];
    protected $appends = [
        'order_total',
        'order_amount',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function orders()
    {
        return $this->hasMany('App\Models\ShopOrder', 'user_id', 'id');
    }

    public function ordersAmount()
    {
        $amount = 0;
        foreach ($this->orders as $order) {
            $amount += $order->total;
        }
        return $amount;
    }

    public function likes()
    {
        return $this->hasMany('App\Models\ShopProductLike', 'users_id', 'id');
    }

    public function getOrderTotalAttribute()
    {
        return $this->orders->count();
    }
    public function getOrderAmountAttribute()
    {
        return $this->ordersAmount();
    }
    public function company()// : BelongsToMany
    {
        $relatedModel = config('admin.database.company_model');
        $pivotTable = config('admin.database.users_table');

        return $this->belongsToMany( $relatedModel, $pivotTable, 'id', 'company_id');
    }
    public function getImage()
    {
        $path_file = config('filesystems.disks.path_file', '');
        if ($this->avatar) {
            if (!file_exists($path_file . '/' . $this->avatar)) {
                return $path_file.'/profile/profile.png';
            } else {
                return $path_file . '/' . $this->avatar;
            }
        } else {
            return $path_file.'/profile/profile.png';
        }

    }
    public function paymentTerm()
    {
        return $this->hasMany(CustomerPaymentTerm::class, "user_id", "id");
    }
    
}
