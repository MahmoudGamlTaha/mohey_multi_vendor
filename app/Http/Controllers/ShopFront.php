<?php
#app/Http/Controller/ShopFront.php
namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\ShopAttributeGroup;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopOrder;
use App\Models\ShopOrderDetail;
use App\Models\ShopOrderStatus;
use App\Models\ShopPage;
use App\Models\ShopProduct;
use App\User;
use Cart;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Encore\Admin\Form\Field\Image;
use Illuminate\Support\Facades\Storage;
class ShopFront extends GeneralController
{
    public function __construct()
    {
        parent::__construct();
    }
/**
 * [index description]
 * @return [type] [description]
 */
    public function index(Request $request)
    {
      //  select count(order_id),product_id from shop_order_detail GROUP by product_id order by count(order_id) desc
     $mostSales = DB::table('shop_order_detail')
      ->select(DB::Raw('COUNT(order_id) numOrder, product_id'))
          ->groupBy('product_id')
          ->orderBy('numOrder', 'desc')
          ->limit(24)
          ->pluck('product_id', 'numOrder');
          $mostSalesProdIds = array();

          foreach($mostSales as $key=>$value) {
            array_push($mostSalesProdIds, $value);
         }
            $products_most = ShopProduct::whereIn('id', $mostSalesProdIds)->get(); // group by sold from product

            $brands = (new ShopBrand())->getBrandsList();
        return view($this->theme . '.shop_home',
            array(
                'title'        => $this->configsGlobal['title'],
                'description'  => $this->configsGlobal['description'],
                'keyword'      => $this->configsGlobal['keyword'],
                'products_most' => $products_most,
             //   'products_new' => (new ShopProduct)->getProducts($type = null, $limit = $this->configs['product_new'], $opt = null),
            //    'products_hot' => (new ShopProduct)->getProducts($type = 1, $limit = $this->configs['product_hot'], $opt = 'random'),
                'categories'   => (new ShopCategory)->getCategoriesAll(true),
                'layout_page'  => 'home',
                'brands'       => $brands 

            )
        );
    }

/**
 * [getCategories description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getCategories(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'sort_desc' => ['sort', 'desc'],
            'sort_asc'  => ['sort', 'asc'],
            'id_desc'   => ['id', 'desc'],
            'id_asc'    => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopCategory)->getCategories($parent = 0, $limit = $this->configs['item_list'], $opt = 'paginate', $sortBy, $sortOrder);
        return view($this->theme . '.shop_item_list',
            array(
                'title'       => trans('language.categories'),
                'itemsList'   => $itemsList,
                'keyword'     => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToCategory description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function productToCategory($name, $id)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $category = (new ShopCategory)->find($id);
        if ($category) {
            $products  = $category->getProductsToCategory($id = $category->id, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder);
            $itemsList = (new ShopCategory)->getCategories($parent = $id);
            return view($this->theme . '.shop_products_list',
                array(
                    'title'       => $category->name,
                    'description' => $category->description,
                    'keyword'     => $this->configsGlobal['keyword'],
                    'products'    => $products,
                    'itemsList'   => $itemsList,
                    'layout_page' => 'product_list',
                    'og_image'    => url($category->getImage()),
                    'filter_sort' => $filter_sort,
                )
            );
        } else {
            return $this->itemNotFound();
        }

    }

/**
 * All products
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function allProducts()
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }
//print_r($this->theme);
//die;
        $products = (new ShopProduct)->getProducts($type = null, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder);
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => trans('language.all_product'),
                'description' => $this->configsGlobal['description'],
                'keyword'     => $this->configsGlobal['keyword'],
                'products'    => $products,
                'layout_page' => 'product_list',
                'filter_sort' => $filter_sort,
            )
        );
    }

/**
 * [productDetail description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productDetail($name, $id)
    {
        $product = ShopProduct::find($id);
        if ($product && $product->status && ($this->configs['product_display_out_of_stock'] || $product->stock > 0)) {
            //Update last view
            $product->view += 1;
            $product->date_lastview = date('Y-m-d H:i:s');
            $product->save();
            //End last viewed
            $currUser = Auth::user();
            $paymentTerms = null;
            if($currUser != null){
                if($currUser->paymentTerm() != null){ 
                    $paymentTerms = $currUser->paymentTerm()->get();
                }
            }
            //Product last view
            if (!empty($this->configs['LastViewProduct'])) {
                $arrlastView      = empty(\Cookie::get('productsLastView')) ? array() : json_decode(\Cookie::get('productsLastView'), true);
                $arrlastView[$id] = date('Y-m-d H:i:s');
                arsort($arrlastView);
                \Cookie::queue('productsLastView', json_encode($arrlastView), (86400 * 30));
            }
            //End product last view

            $sortBy    = request('sortBy') ?? null;
            $sortOrder = request('sortOrder') ?? 'asc';

            //Check product available
            return view($this->theme . '.shop_product_detail',
                array(
                    'title'              => $product->name,
                    'description'        => $product->description,
                    'keyword'            => $this->configsGlobal['keyword'],
                    'product'            => $product,
                    'attributesGroup'    => ShopAttributeGroup::all()->keyBy('id'),
                    'productsToCategory' => (new ShopCategory)->getProductsToCategory($id = $product->category_id, $limit = $this->configs['product_relation'], $opt = 'random', $sortBy, $sortOrder),
                    'og_image'           => url($product->getImage()),
                    'layout_page'        => 'product_detail',
                    'paymentTerms'       => $paymentTerms
                )
            );
        } else {
            return $this->itemNotFound();
        }

    }
/**
 * [brands description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getBrands(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'name_desc' => ['name', 'desc'],
            'name_asc'  => ['name', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc'  => ['sort', 'asc'],
            'id_desc'   => ['id', 'desc'],
            'id_asc'    => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopBrand)->getBrands($limit = $this->configs['item_list'], $opt = 'paginate', $sortBy, $sortOrder);
        return view($this->theme . '.shop_item_list',
            array(
                'title'       => trans('language.brands'),
                'itemsList'   => $itemsList,
                'keyword'     => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToBrand description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productToBrand($name, $id)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $brand = ShopBrand::find($id);
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => $brand->name,
                'description' => '',
                'keyword'     => '',
                'layout_page' => 'product_list',
                'products'    => $brand->getProductsToBrand($id, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder),
                'filter_sort' => $filter_sort,
            )
        );
    }

/**
 * [vendors description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getVendors(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'name_desc' => ['name', 'desc'],
            'name_asc'  => ['name', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc'  => ['sort', 'asc'],
            'id_desc'   => ['id', 'desc'],
            'id_asc'    => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        //$itemsList = (new ShopVendor)->getVendors($limit = $this->configs['item_list'], $opt = 'paginate', $sortBy, $sortOrder);
        $itemsList = (new Company())->getVendors($limit = $this->configs['item_list'], $opt = 'paginate', $sortBy, $sortOrder);
    
        return view($this->theme . '.shop_item_list',
            array(
                'title'       => trans('language.companies'),
                'itemsList'   => $itemsList,
                'keyword'     => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToVendor description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productToVendor($name, $id)
    {
     //   try{
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $vendor = Company::find($id);
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => $vendor->name,
                'description' => '',
                'keyword'     => '',
                'layout_page' => 'product_list',
                'products'    => $vendor->getProductsForFront($id, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder),
                'filter_sort' => $filter_sort,
            )
        );
   // }catch(\Exception $ex){
      //   abort(404);
  //  }
    }

    /**
     * [profile description]
     * @return [type] [description]
     */
    public function profileData(Request $request){
        try{
            $user        = Auth::user();
        //return blank($user)?'true':'false';
            if(!Auth::check() && blank($user)){
                return redirect()->route('home');
            }
            $id          = $user->id;
           
            $prodLastIds = json_decode($request->cookie('productsLastView'));
            $wishlist = Cart::instance('wishlist')->content();
            $productIds = array();
            $wishlistIds = array();
            if($prodLastIds == null){
                $prodLastIds = array();
            }
            foreach($prodLastIds as $key => $value){
                array_push($productIds, $key);
            }
            foreach($wishlist as $key => $value){
                
                array_push($wishlistIds, $value->id);
            }
            $prodLastView = ShopProduct::whereIn('id', $productIds)->get()->take(3);
            $wishlist = ShopProduct::whereIn('id', $wishlistIds)->paginate(3,["*"],"wish_page");//->setPageName("wish_page");
            //$wishlist->setPageName("order_pagex");
            $prodPriceOffer = ShopProduct::select('id','sku','category_id','price','image')
                              ->groupBy('id','category_id','price','sku','image')
                              ->orderBy('price', 'desc')->get()->take(3);
            //$orders = null;
            //$order_ids = array();  
          //  $orderQtys = null;
           
            $totals =  DB::select(DB::raw("select count(o.id) ids ,sum(od.qty)  products,
            (select sum( d.balance) from shop_order d where d.user_id = ?) remaining ,sum(od.price * od.qty) total, sum(o.received) paid 
            from shop_order o inner join shop_order_detail od 
            on o.id = od.order_id
            where o.user_id = ?
            group by o.user_id "),[$id,$id]);
           // if($request->get('tab') == "userOrder"){
            $orders      = ShopOrder::where('user_id', $id)
                            ->pluck('id')
                            ->sort();
                          
            $productOrder = ShopOrderDetail::with('product')
                            ->whereIn('order_id', $orders)
                            ->paginate(3);                
                            //->paginate(3);
                         //   $productOrder->setPageName("product_Page");
                           // $orders->setPageName("order_page");
                         
        /*    foreach($orders as $key => $order){
                array_push($order_ids, $order->id);
            } 
            $orderQtys = DB::table('shop_order_detail')->select('order_id', DB::raw('sum(qty) as qtys'))
                          ->whereIn('order_id', $order_ids)
                          ->groupBy('order_id')
                          ->pluck('qtys', 'order_id');*/
    
            $statusOrder = ShopOrderStatus::pluck('name', 'id')->all();
            return view($this->theme . '.shop_profile_main')->with(array(
                'title'       => trans('language.my_profile'),
                'user'        => $user,
                'orders'      =>$productOrder,
                'statusOrder' => $statusOrder,
                'layout_page' => 'shop_profile',
                'lastViewProd'=> $prodLastView,
                'prodPriceOffer' => $prodPriceOffer,
                //'orderQtys'     => $orderQtys,
                'wishList'      => $wishlist,
                'totals'        => count($totals) > 0? (array)($totals[0]):array() 
            ))->render();
            }catch(\Exception $ex){
                return $ex->getMessage();
            }
    }
    public function fetchUserOrder(Request $request) // ajax 
    {
      return $this->profileData($request);
    } 
    public function profile(Request $request)
    {
        return $this->profileData($request);
    }
    // upload profile image
    public function imageUpload(Request $request){
        if(isset($request->profileImage)){
            $pofileImage = $request->profileImage;
           // return $pofileImage;
            $userSession        = Auth::user();
            if( $userSession  == null){
                return redirect()->route('home');
            }
               $user = User::findOrFail($userSession->id);
                $user->path =  Storage::disk(config('admin.upload.disk'))->url('');
                $uploadedImage = new Image($pofileImage) ;
                $uploadedImage->uniqueName();
                $uploadedImage->move('profileImageCustomer');
                $user->avatar = $uploadedImage->prepare($pofileImage);
                $user->save();
            }
    }

/**
 * [search description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function search(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }
        $keyword = request('keyword') ?? '';
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => trans('language.search') . ': ' . $keyword,
                'products'    => (new ShopProduct)->getSearch($keyword, $limit = $this->configs['product_list'], $sortBy, $sortOrder),
                'layout_page' => 'product_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [getContact description]
 * @return [type] [description]
 */
    public function getContact()
    {
        $page = $this->getPage('contact');
        return view($this->theme . '.shop_contact',
            array(
                'title'       => trans('language.contact'),
                'description' => '',
                'page'        => $page,
                'keyword'     => $this->configsGlobal['keyword'],
                'og_image'    => $this->logo,
            )
        );
    }

/**
 * [postContact description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function postContact(Request $request)
    {
        $validator = $request->validate([
            'name'    => 'required',
            'title'   => 'required',
            'content' => 'required',
            'email'   => 'required|email',
            'phone'   => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
        ], [
            'name.required'    => trans('validation.required'),
            'content.required' => trans('validation.required'),
            'title.required'   => trans('validation.required'),
            'email.required'   => trans('validation.required'),
            'email.email'      => trans('validation.email'),
            'phone.required'   => trans('validation.required'),
            'phone.regex'      => trans('validation.phone'),
        ]);
        //Send email
        try {
            $data            = $request->all();
            $data['content'] = str_replace("\n", "<br>", $data['content']);
            Mail::send('vendor.mail.contact', $data, function ($message) use ($data) {
                $message->to($this->configsGlobal['email'], $this->configsGlobal['title']);
                $message->replyTo($data['email'], $data['name']);
                $message->subject($data['title']);
            });
            return redirect()->route('contact')->with('message', trans('language.thank_contact'));

        } catch (\Exception $e) {
            echo $e->getMessage();
        } //

    }

/**
 * [pages description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function pages($key = null)
    {
        $page = $this->getPage($key);
        if ($page) {
            return view($this->theme . '.shop_page',
                array(
                    'title'       => $page->title,
                    'description' => '',
                    'keyword'     => $this->configsGlobal['keyword'],
                    'page'        => $page,
                ));
        } else {
            return $this->pageNotFound();
        }
    }

/**
 * [getPage description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function getPage($key = null)
    {
        return ShopPage::where('uniquekey', $key)->where('status', 1)->first();
    }

    public function showProfileMainPage()
    {
      return view((new GeneralController)->theme . '.shop_profile_main',
          array(
              'title' => trans('language.Profile_main'),
          )
      );
    }
    public function showProfileRequestsPage()
    {
      return view((new GeneralController)->theme . '.shop_profile_requests',
          array(
              'title' => trans('language.shop_profile_requests'),
          )
      );
    }
    public function showProfileFavouritePage()
    {
      return view((new GeneralController)->theme . '.shop_profile_favourite',
          array(
              'title' => trans('language.shop_profile_favourite'),
          )
      );
    }
    public function showProfileWalletPage()
    {
      return view((new GeneralController)->theme . '.shop_profile_wallet',
          array(
              'title' => trans('language.shop_profile_wallet'),
          )
      );
    }
    public function showProfileEditPage()
    {
      return view((new GeneralController)->theme . '.shop_profile_edit',
          array(
              'title' => trans('language.shop_profile_edit'),
          )
      );
    }
    function getCompanyName(Request $request,$code)
      {
          try
          {
              $name = Company::where('code','=',$code)->pluck('name');
              return $this->sendResponse($name, 200);    
          }
          catch(\Exception $e){
            return $this->sendError($e->getMessage(), 400);
          }
      }
}
