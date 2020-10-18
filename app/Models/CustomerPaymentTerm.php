<?php
namespace App\Models;

use App\User;
use Helper;
use Illuminate\Database\Eloquent\Model;

class CustomerPaymentTerm extends Model
{
   protected $table = 'customer_payment_term';

  public function paymentTerm(){
      
      return $this->belongsTo(paymentTerm::class, "payment_term_id", "id");
  }
  public function user(){
      return $this->belongsTo(User::class, "company_id", "id");
  }
}

