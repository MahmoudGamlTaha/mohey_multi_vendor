<?php
#app/Http/Controller/ShopCart.php
namespace App\Http\Controllers;

use App\Models\CustomerPaymentTerm;
use App\Models\ShopAttributeGroup;
use App\Models\ShopOrder;
use App\Models\ShopOrderDetail;
use App\Models\ShopOrderHistory;
use App\Models\ShopOrderTotal;
use App\Models\ShopProduct;
use App\Models\UofmGroups;
use App\User;
use Cart;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;

class ShopCart extends GeneralController
{
    public function __construct()
    {
        parent::__construct();

    }
/**
 * [getCart description]
 * @return [type] [description]
 */
    public function getCart(Request $request)
    {
        session()->forget('paymentMethod'); //destroy paymentMethod
        session()->forget('shippingMethod'); //destroy shippingMethod
       $prodLastView = json_decode($request->cookie('productsLastView'));
       $productIds = array();
        if(is_array($prodLastView)) {
            foreach ($prodLastView as $key => $value) {
                array_push($productIds, $key);
            }
        }
        $lastviewed = ShopProduct::whereIn('id', $productIds)->get();
        //Shipping
        $moduleShipping  = \Helper::getExtensionsGroup('shipping');
        $sourcesShipping = \FindClass::classNames('Extensions', 'shipping');
        $shippingMethod  = array();
        foreach ($moduleShipping as $key => $module) {
            if (in_array($module['key'], $sourcesShipping)) {
                $moduleClass                    = '\App\Extensions\Shipping\Controllers\\' . $module['key'];
                $shippingMethod[$module['key']] = (new $moduleClass)->getData();
            }
        }
        //Payment
        $modulePayment  = \Helper::getExtensionsGroup('payment');
        $sourcesPayment = \FindClass::classNames('Extensions', 'payment');
        $paymentMethod  = array();
        foreach ($modulePayment as $key => $module) {
            if (in_array($module['key'], $sourcesPayment)) {
                $moduleClass                   = 'App\Extensions\Payment\Controllers\\' . $module['key'];
                $paymentMethod[$module['key']] = (new $moduleClass)->getData();
            }
        }
        //Total
        $moduleTotal  = \Helper::getExtensionsGroup('total');
        $sourcesTotal = \FindClass::classNames('Extensions', 'total');
        $totalMethod  = array();
        foreach ($moduleTotal as $key => $module) {
            if (in_array($module['key'], $sourcesTotal)) {
                $moduleClass                 = '\App\Extensions\Total\Controllers\\' . $module['key'];
                $totalMethod[$module['key']] = (new $moduleClass)->getData();
            }
        }

        //====================================================
        $objects           = array();
        $objects[]         = (new ShopOrderTotal)->getShipping();
        $objects[]         = (new ShopOrderTotal)->getDiscount();
        $objects[]         = (new ShopOrderTotal)->getReceived();
        $extensionDiscount = $totalMethod['Discount'] ?? '';
        if (!empty(session('Discount'))) {
            $hasCoupon = true;
        } else {
            $hasCoupon = false;
        }
        $user = auth()->user();
        if ($user) {
            $addressDefaul = [
                'toname'   => $user->name,
                'email'    => $user->email,
                'address1' => $user->address1,
                'address2' => $user->address2,
                'phone'    => $user->phone,
                'comment'  => '',
            ];
        } else {
            $addressDefaul = [
                'toname'   => '',
                'email'    => '',
                'address1' => '',
                'address2' => '',
                'phone'    => '',
                'comment'  => '',
            ];
        }
        $shippingAddress = session('shippingAddress') ? json_decode(session('shippingAddress'), true) : $addressDefaul;
        $wishlist = Cart::instance('wishlist')->content();
        $instance = request('instance') ?? 'default';
        $payment_id = request('payment') ?? null;
        $paymentTerm = null;
        $extra = 0;
        if($payment_id != null){
         $paymentTerm = CustomerPaymentTerm::find($payment_id);
         if($paymentTerm->user_id != auth()->user()->id){
           abort(404);
         } 
         session(['paymentTerm' => $paymentTerm]);
        }

        $cart = Cart::instance($instance)->content();
        //dd($cart);
        return view($this->theme . '.shop_cart',
            array(
                'title'             => trans('language.cart_title'),
                'description'       => '',
                'keyword'           => '',
                'cart'              => $cart,
                'attributesGroup'   => ShopAttributeGroup::all()->keyBy('id'),
                'shippingMethod'    => $shippingMethod,
                'paymentMethod'     => $paymentMethod,
                'totalMethod'       => $totalMethod,
                'dataTotal'         => ShopOrderTotal::processDataTotal($objects),
                'hasCoupon'         => $hasCoupon,
                'extensionDiscount' => $extensionDiscount,
                'shippingAddress'   => $shippingAddress,
                'uID'               => $user->id ?? 0,
                'wishlist'          => $wishlist,
                'layout_page'       => 'shop_cart',
                'lastViewed'         => $lastviewed,
                'payment_term'      => $paymentTerm,
                'units'             => UofmGroups::all(),
            )
        );
    }

/**
 * Process Cart
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function processCart(Request $request)
    {
        if (Cart::count() == 0) {
            return redirect()->route('cart');
        }
        //Not allow for guest
        if (!$this->configs['shop_allow_guest'] || auth()->user() == null) {
            return redirect()->route('login');
        } //
       
        $messages = [
            'max'      => trans('validation.max.string'),
            'required' => trans('validation.required'),
        ];
        $request['toname'] = auth()->user()->name;
        $request['address1'] = auth()->user()->country . '-' . auth()->user()->city . '-' . auth()->user()->street;
        $request['phone'] = auth()->user()->mobile;
        $request['email'] = auth()->user()->email;
        $request['comment'] = 'new Order from web';
       
        $v = Validator::make($request->all(), [
            'toname'         => 'required|max:100',
            'address1'       => 'required|max:100',
            //'address2'       => 'required|max:100',
            'phone'          => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'email'          => 'required|string|email|max:255'
            //'shippingMethod' => 'required',
            //'paymentMethod'  => 'required',
        ], $messages);
      
        if ($v->fails()) {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }
      
   //     session(['shippingMethod' => request('shippingMethod')]);
     //   session(['paymentMethod' => request('paymentMethod')]);
        session(['shippingAddress' => json_encode([
            'toname'   => $request->get('toname'),
            'email'    => $request->get('email'),
            'address1' => $request->get('address1'),
            'address2' => $request->get('address2'),
            'phone'    => $request->get('phone'),
            'comment'  => $request->get('comment'),
        ]
        )]);
        // dd(session()->all());
        return redirect()->route('checkout');
    }

/**
 * [getCheckout description]
 * @return [type] [description]
 */
    public function getCheckout()
    {//login 
       // if (!session('shippingMethod') || !session('paymentMethod') || !session('shippingAddress')) {
         //   return redirect()->route('cart');
       // }
        //====================================================
		try{
		if(auth()->user() == null){
		  return redirect()->route('login');
		}
        $payment             = session('paymentMethod')??'cash';
        $shipping            = session('shippingMethod')??'ShippingBasic';
        $paymentTerm         = session('paymentTerm')?? null;
        $paymentTerm  = CustomerPaymentTerm::where('user_id', auth()->user()->id)->get();
    
        $address = [
                    'toname'=> auth()->user()->name,
                    'phone' => auth()->user()->mobile,
                    'email' => auth()->user()->email,
                    'address1' =>  auth()->user()->country . '-' . auth()->user()->city . '-' . auth()->user()->street,
                    'address2' => '',
                    'comment' => ''
        ]; 
                     
        $classShippingMethod = '\App\Extensions\Shipping\Controllers\\' . $shipping;
        $shippingMethod      = (new $classShippingMethod)->getData();
        $classPaymentMethod  = '\App\Extensions\Payment\Controllers\\' . $payment;
        $paymentMethod       = (new $classPaymentMethod)->getData();
        $objects             = array();
        $objects[]           = (new ShopOrderTotal)->getShipping();
        $objects[]           = (new ShopOrderTotal)->getDiscount();
        $objects[]           = (new ShopOrderTotal)->getReceived();
        $dataTotal           = ShopOrderTotal::processDataTotal($objects);
        session()->forget('paymentMethod'); //destroy paymentMethod
        session()->forget('shippingMethod'); //destroy shippingMethod
        session()->forget('paymentTerm');
        dd(Cart::content());
        return view($this->theme . '.shop_checkout',
            array(
                'title'           => trans('language.checkout_title'),
                'description'     => '',
                'keyword'         => '',
                'cart'            => Cart::content(),
                'dataTotal'       => $dataTotal,
                'paymentMethod'   => $paymentMethod,
                'shippingMethod'  => $shippingMethod,
                'payment'         => $payment,
                'shipping'        => $shipping,
                'address'         => $address,
                'attributesGroup' => ShopAttributeGroup::all()->keyBy('id'),
                'payment_term'    => $paymentTerm
        )
        );
    }catch(\Exception $ex){
        return $this->sendError($ex->getMessage());
    }
    }

/**
 * [postCart description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function postCart(Request $request)
    {
        $instance = request('instance') ?? 'default';
        $cart     = \Cart::instance($instance);
        $data       = $request->all();
        $payment    = $request['payment']?? null;
        $product_id = $data['product_id'];
        $opt_sku    = $data['opt_sku'] ?? null;
        $attribute  = $data['attribute'] ?? null;
        $qty        = $data['qty'];
        if($payment != null){
            $payment = $payment[0];
        }

        $product    = ShopProduct::find($product_id);
        if ($product->allowSale()) {
            $options        = array();
            $options['opt'] = $opt_sku;
            $options['att'] = $attribute;
            $cart->addWithUofm(
                array(
                    'id'      => $product_id,
                    'name'    => $product->name,
                    'qty'     => $qty,
                    'price'   => (new ShopProduct)->getPrice($product_id, $opt_sku),
                    'uofm'    => 11,
                    'options' => $options,
                )
            );
            return redirect()->route('cart', ["payment" => $payment])
            ->with(
                ['message' => trans('language.cart.success', ['instance' => 'cart'])]
            );        
        } else {
            return redirect()->route('cart')
                ->with(
                    ['error' => trans('language.cart.dont_allow_sale')]
                );
        }

    }

/**
 * [storeOrder description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function storeOrder(Request $request)
    {
        if (Cart::count() == 0) {
            return redirect()->route('home');
        }
        //Not allow for guest
        if (!$this->configs['shop_allow_guest'] && !auth()->user()) {
            return redirect()->route('login');
        } //
        $user_id = auth()->user()->id;
        $data = request()->all();
        if (!$data) {
            return redirect()->route('cart');
        } else {
            $dataTotal = json_decode($data['dataTotal'], true);
            $address   = json_decode($data['address'], true);
            $payment   = $data['payment'];
            $shipping  = $data['shipping'];
        }
        try {
            //Process total
            //$subtotal       = (new ShopOrderTotal)->sumValueTotal('subtotal', $dataTotal);
            $shipping       = (new ShopOrderTotal)->sumValueTotal('shipping', $dataTotal); //sum shipping
            $discount       = (new ShopOrderTotal)->sumValueTotal('discount', $dataTotal); //sum discount
            $received       = (new ShopOrderTotal)->sumValueTotal('received', $dataTotal); //sum received
            //$total          = (new ShopOrderTotal)->sumValueTotal('total', $dataTotal);
            $payment_method = $payment;
            //end total
            DB::connection('mysql')->beginTransaction();
            $productCount = 0;
            $order = null;
            $set = array();
            foreach (Cart::content() as $value){
                if(!is_numeric($value->id) || !is_numeric($value->qty)){
                    return $this->sendError("data error",400);
                }
                $product = ShopProduct::findOrFail($value->id);
                $subtotal = $value->price * $value->qty;
                $total = $subtotal + $shipping;
                if($productCount == 0){
                    $order = $this->createOrder(null, $product->company_id, $address, $user_id, $subtotal, $shipping, $discount, $received, $total, $payment_method);

                } else {
                    $order = clone $this->createOrder($order->id, $product->company_id, $address, $user_id, $subtotal, $shipping, $discount, $received, $total, $payment_method);

                }//

                if(!in_array($order->id, $set)){
                    array_push($set, $order->id);
                }
                //dd($dataTotal);
                foreach ($dataTotal as $k => $v) {
                    $dataTotal[$k]['company_id'] = $product->company_id;
                    $dataTotal[$k]['order_id']   = $order->id;
                    $dataTotal[0]['value']      = $subtotal;
                    $dataTotal[1]['value']      = $discount;
                    $dataTotal[2]['value']      = $total;
                    $dataTotal[3]['value']      = $received;
                }
                //dd($dataTotal);
                ShopOrderTotal::insertTotal($dataTotal, $order->id);


                $arrDetail['company_id']  = $product->company_id;
                $arrDetail['order_id']    = $order->id;
                $arrDetail['product_id']  = $value->id;
                $arrDetail['name']        = $value->name;
                $arrDetail['price']       = $subtotal;
                $arrDetail['qty']         = $value->qty;
                $arrDetail['attribute']   = ($value->options->att) ? json_encode($value->options->att) : null;
                $arrDetail['sku']         = $product->sku;
                $arrDetail['total_price'] = \Helper::currencyValue($value->price) * $value->qty;
                $arrDetail['created_at']  = date('Y-m-d H:i:s');
                ShopOrderDetail::insert($arrDetail);
                //If product out of stock
                if (!$this->configs['product_buy_out_of_stock'] && $product->stock < $value->qty) {
                    return redirect()->route('home')->with('error', trans('language.cart.over', ['item' => $product->sku]));
                } //
                $product->stock -= $value->qty;
                $product->sold += $value->qty;
                $product->save();
                $productCount++;
            }

            //Add history
            $dataHistory = [
                'order_id' => $order->id,
                'content'  => 'New order',
                'user_id'  => auth()->user()->id ?? 0,
                'add_date' => date('Y-m-d H:i:s'),
            ];
            ShopOrderHistory::insert($dataHistory);

            //Process Discount
            $codeDiscount = session('Discount') ?? '';
            if ($codeDiscount) {
                if (!empty(\Helper::configs()['Discount'])) {
                    $moduleClass             = '\App\Extensions\Total\Controllers\Discount';
                    $uID                     = auth()->user()->id ?? 0;
                    $returnModuleDiscount    = (new $moduleClass)->apply($codeDiscount, $uID, $msg = 'Order #' . $order->id);
                    $arrReturnModuleDiscount = json_decode($returnModuleDiscount, true);
                    if ($arrReturnModuleDiscount['error'] == 1) {
                        if ($arrReturnModuleDiscount['msg'] == 'error_code_not_exist') {
                            $msg = trans('language.promotion.process.invalid');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_code_cant_use') {
                            $msg = trans('language.promotion.process.over');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_code_expired_disabled') {
                            $msg = trans('language.promotion.process.expire');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_user_used') {
                            $msg = trans('language.promotion.process.used');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_uID_input') {
                            $msg = trans('language.promotion.process.user_id_invalid');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_login') {
                            $msg = trans('language.promotion.process.must_login');
                        } else {
                            $msg = trans('language.promotion.process.undefined');
                        }
                        return redirect()->route('cart')->with(['error_discount' => $msg]);
                    }
                }
            }
            //End process Discount

            $dataItems = Cart::content();
            Cart::destroy(); // destroy cart

            //End discount
            DB::connection('mysql')->commit();

            //Process paypal
            if ($payment_method === 'Paypal') {
                $data_payment = [];
                foreach ($dataItems as $value) {
                    $product        = ShopProduct::find($value->id);
                    $data_payment[] =
                        [
                        'name'     => $value->name,
                        'quantity' => $value->qty,
                        'price'    => \Helper::currencyValue($value->price),
                        'sku'      => $product->sku,
                    ];
                }
                $data_payment[] =
                    [
                    'name'     => 'Shipping',
                    'quantity' => 1,
                    'price'    => $shipping,
                    'sku'      => 'shipping',
                ];
                $data_payment[] =
                    [
                    'name'     => 'Discount',
                    'quantity' => 1,
                    'price'    => $discount,
                    'sku'      => 'discount',
                ];
                $data_payment['order_id'] = $order->id;
                $data_payment['currency'] = \Helper::currencyCode();
                return redirect()->route('paypal')->with('data_payment', $data_payment);
            } else {
                return $this->completeOrder($order->id);
            }

        
        } catch (\Exception $e) {
            DB::connection('mysql')->rollBack();
            echo 'Caught exception: ', $e->getMessage(), "\n";

        }

    }

    private function createOrder($id, $company_id, $address, $user_id, $subtotal, $shipping, $discount, $received, $total, $payment_method){
        if($id != null){
            $shopOrder = ShopOrder::findOrFail($id);
            if($shopOrder->company_id == $company_id){
                return  $shopOrder;
            }
        }

        $shopOrder = new ShopOrder();
        $shopOrder->company_id       = $company_id;
        $shopOrder->user_id          = $user_id;
        $shopOrder->subtotal         = $subtotal;
        $shopOrder->shipping         = $shipping;
        $shopOrder->discount         = $discount;
        $shopOrder->received         = $received;
        $shopOrder->payment_status   = 0;
        $shopOrder->shipping_status  = 0;
        $shopOrder->status           = 0;
        $shopOrder->currency         = \Helper::currencyCode();
        $shopOrder->exchange_rate    = \Helper::currencyRate();
        $shopOrder->total            = $total;
        //$shopOrder->balance          = ;
        $shopOrder->toname           = $address['toname'];
        $shopOrder->email            = $address['email'];
        $shopOrder->address1         = $address['address1'];
        $shopOrder->address2         = $address['address2'];
        $shopOrder->phone            = $address['phone'];
        $shopOrder->payment_method   = $payment_method;
        $shopOrder->comment          = $address['comment'];
        $shopOrder->created_at       = date('Y-m-d H:i:s');
        $shopOrder->save();

        return $shopOrder;
    }


    /**
 * [addToCart description]
 * @param Request $request [description]
 */
    public function addToCart(Request $request)
    {
        $instance = request('instance') ?? 'default';
        $cart     = \Cart::instance($instance);
        if (!$request->ajax()) {
            return redirect()->route('cart');
        }
        $id             = request('id');
        $attribute      = request('attribute') ?? null;
        $opt_sku        = request('opt_sku') ?? null;
        $options        = [];
        $options['att'] = $attribute;
        $options['opt'] = $opt_sku;
        $product        = ShopProduct::find($id);
        $html           = '';
        switch ($instance) {
            case 'default':
                if ($product->allowSale()) {
                    $cart->addWithUofm(
                        array(
                            'id'      => $id,
                            'name'    => $product->name,
                            'qty'     => 1,
                            'price'   => $product->getPrice($id),
                            'uofm'    => 11,
                            'options' => $options,
                        )
                    );
                } else {
                    return response()->json(
                        [
                            'error' => 1,
                            'msg'   => trans('language.cart.dont_allow_sale'),
                        ]
                    );
                }
                break;

            default:
                //Wishlist or Compare...
                ${'arrID' . $instance} = array_keys($cart->content()->groupBy('id')->toArray());
                if (!in_array($id, ${'arrID' . $instance})) {
                    try {
                        $cart->addWithUofm(
                            array(
                                'id'    => $id,
                                'name'  => $product->name,
                                'qty'   => 1,
                                'price' => $product->getPrice($id),
                                'uofm'    => 11,
                            )
                        );
                    } catch (\Exception $e) {
                        return response()->json(
                            [
                                'error' => 1,
                                'msg'   => $e->getMessage(),
                            ]
                        );
                    }

                } else {
                    return response()->json(
                        [
                            'error' => 1,
                            'msg'   => trans('language.cart.exist', ['instance' => $instance]),
                        ]
                    );
                }
                break;
        }

        $carts = \Helper::getListCart($instance);
        if ($instance == 'default' && $carts['count']) {
            $html .= '<div><div class="shopping-cart-list">';
            foreach ($carts['items'] as $item) {
                $html .= '<div class="product product-widget"><div class="product-thumb">';
                $html .= '<img src="' . $item['image'] . '" alt="">';
                $html .= '</div>';
                $html .= '<div class="product-body">';
                $html .= '<h3 class="product-price">' . $item['price'] . ' <span class="qty">x' . $item['qty'] . '</span></h3>';
                $html .= '<h2 class="product-name"><a href="' . $item['url'] . '">' . $item['name'] . '</a></h2>';
                $html .= '</div>';
                $html .= '<a href="' . route("removeItem", ['id' => $item['rowId']]) . '"><button class="cancel-btn"><i class="fa fa-trash"></i></button></a>';
                $html .= '</div>';
            }
            $html .= '</div></div>';
            $html .= '<div class="shopping-cart-btns">
                    <a href="' . route('cart') . '"><button class="main-btn">' . trans('language.cart_title') . '</button></a>
                    <a href="' . route('checkout') . '"><button class="primary-btn">' . trans('language.checkout_title') . ' <i class="fa fa-arrow-circle-right"></i></button></a>
                  </div>';
        }
        return response()->json(
            [
                'error'      => 0,
                'count_cart' => $carts['count'],
                'instance'   => $instance,
                'subtotal'   => $carts['subtotal'],
                'html'       => $html,
                'msg'        => trans('language.cart.success', ['instance' => ($instance == 'default') ? 'cart' : $instance]),
            ]
        );

    }

/**
 * [updateToCart description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function updateToCart(Request $request)
    {
        if (!$request->ajax()) {
            return redirect()->route('cart');
        }
       //id =6
        $id      = $request->get('id');
        $rowId   = $request->get('rowId');
        $product = ShopProduct::find($id);
        $new_qty = $request->get('new_qty');
        $unitId    = $request->get('unitId');

        Cart::update($rowId, [
            'options' => [
                'unit' => $unitId
            ],
        ]);

        if ($product->stock < $new_qty && !$this->configs['product_buy_out_of_stock']) {
            return response()->json(
                [
                    'error' => 1,
                    'msg'   => trans('language.cart.over', ['item' => $product->sku]),
                ]);
        } else {
           try{
              Cart::update($rowId, ($new_qty) ? $new_qty : 0);
              return response()->json(
                ['error' => 0,
                ]);
           }
           catch(\Exception $e){
            return response()->json(
                ['error' => 1,
                 'data' => $e->getMessage()
                ]);
            }
        }

    }

/**
 * [wishlist description]
 * @return [type] [description]
 */
    public function wishlist()
    {

        $wishlist = Cart::instance('wishlist')->content();
        return view($this->theme . '.shop_wishlist',
            array(
                'title'       => trans('language.wishlist'),
                'description' => '',
                'keyword'     => '',
                'wishlist'    => $wishlist,
                'layout_page' => 'shop_wishlist',
            )
        );
    }

/**
 * [compare description]
 * @return [type] [description]
 */
    public function compare()
    {
        $compare = Cart::instance('compare')->content();
        return view($this->theme . '.shop_compare',
            array(
                'title'       => trans('language.compare'),
                'description' => '',
                'keyword'     => '',
                'compare'     => $compare,
                'layout_page' => 'product_compare',
            )
        );
    }

/**
 * [clearCart description]
 * @return [type] [description]
 */
    public function clearCart()
    {
        Cart::destroy();
        return redirect()->route('cart');
    }

/**
 * Remove item from cart
 * @author lanhktc
 */
    public function removeItem($id = null)
    {
        if ($id === null) {
            return redirect()->route('cart');
        }

        if (array_key_exists($id, Cart::content()->toArray())) {
            Cart::remove($id);
        }
        return redirect()->route('cart');
    }

/**
 * [removeItem_wishlist description]
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
    public function removeItemWishlist($id = null)
    {
        if ($id === null) {
            return redirect()->route('wishlist');
        }

        if (array_key_exists($id, Cart::instance('wishlist')->content()->toArray())) {
            Cart::instance('wishlist')->remove($id);
        }
        return redirect()->route('wishlist');
    }

/**
 * [removeItemCompare description]
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
    public function removeItemCompare($id = null)
    {
        if ($id === null) {
            return redirect()->route('compare');
        }

        if (array_key_exists($id, Cart::instance('compare')->content()->toArray())) {
            Cart::instance('compare')->remove($id);
        }
        return redirect()->route('compare');
    }

    public function completeOrder($orderId)
    {
        session()->forget('paymentMethod'); //destroy paymentMethod
        session()->forget('shippingMethod'); //destroy shippingMethod
        session()->forget('totalMethod'); //destroy totalMethod
        session()->forget('otherMethod'); //destroy otherMethod
        session()->forget('Discount'); //destroy Discount
        //Send email
        try {
            $data = ShopOrder::with('details')->find($orderId)->toArray();
            Mail::send('vendor.mail.order_new', $data, function ($message) use ($orderId) {
                $message->to($this->configsGlobal['email'], $this->configsGlobal['title']);
                $message->replyTo($this->configsGlobal['email'], $this->configsGlobal['title']);
                $message->subject(trans('language.order.email.new_title') . '#' . $orderId);
            });
        } catch (\Exception $e) {
            echo 'Error send mail';
        } //
        return redirect()->route('cart')->with('message', trans('language.order.success'));
    }
}
