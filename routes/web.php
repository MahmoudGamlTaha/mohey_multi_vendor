<?php

use App\Models\ShopProduct;
use Illuminate\Http\Request;

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
Auth::routes();
//============================

//--Auth
Route::group(['namespace' => 'Auth', 'prefix' => 'member'], function ($router) {
   // $router->get('/login.html', 'LoginController@showLoginForm')->name('login');
    $router->post('/login.html', 'LoginController@login')->name('postLogin');
   // $router->get('/profile', 'LoginController@showProfileForm')->name('profilePage');
    $router->get('/register.html', 'RegisterController@showRegisterForm')->name('register');
    $router->get('/registerMerchant.html', 'RegisterController@showRegisterMerchantForm')->name('registermerchant');
    $router->get('/registerMerchantl', 'RegisterController@showRegisterMerchantForm')->name('registermerchantl');
    $router->post('/registerMerchant', 'RegisterController@registerMerchand')->name('newMerchant');
    $router->get('/registerMerchant', 'RegisterController@registerMerchand')->name('newMerchant');
    $router->post('/registerCustomer', 'RegisterController@registerCustomer')->name('newCustomer');
    $router->post('/register.html', 'RegisterController@register')->name('postRegister');
    $router->redirect('/login', '/login.html', 301);
    $router->post('/logout', 'LoginController@logout')->name('logout');
    $router->post('/password/email', 'ForgotPasswordController@sendResetLinkEmail')->name('password.email');
    $router->post('/password/reset', 'ResetPasswordController@reset');
    $router->get('/password/reset/{token}', 'ResetPasswordController@showResetForm')->name('password.reset');
    $router->get('/forgot.html', 'ForgotPasswordController@showLinkRequestForm')->name('forgot');
    $router->get('/member/customer.html',[
        'uses'       => 'RegisterController@showRegisterCustomerForm'
    ])->name('routeCustomer');
});
$router->get('member/profile.html', [
      'middleware' => 'web',
      'uses'       => 'ShopFront@profile',
  ])->name('profilePage');

//End Auth
//Route::get('/member/profile.html', [
  //  'middleware' => 'web',
  //  'uses'       => 'ShopFront@profile',
//])->name('profilePage');

Route::get('/member/fetchUserOrder', [
    //  'middleware' => 'web',
      'uses'       => 'ShopFront@fetchUserOrder',
  ]);
  Route::post('profile/upload',[
   'uses'      => 'ShopFront@imageUpload'
  ]);
  
//Language
Route::get('locale/{code}', function ($code) {
    session(['locale' => $code]);
    return back();
})->name('locale');

//Currency
Route::get('currency/{code}', function ($code) {
    session(['currency' => $code]);
    return back();
});
Route::get('/getcompanybyCode/{code}','ShopFront@getCompanyName');
//========Cart
Route::get('/wishlist.html', 'ShopCart@wishlist')->name('wishlist');
Route::get('/compare', 'ShopCart@compare')->name('compare');
Route::get('/cart', 'ShopCart@getCart')->name('cart');
Route::post('/cart.html', 'ShopCart@postCart')->name('postCart');
Route::get('/checkout.html', 'ShopCart@getCheckout')->name('checkout');
Route::post('/checkout', 'ShopCart@processCart')->name('processCart');
Route::get('/removeItem/{id}', 'ShopCart@removeItem')->name('removeItem');
Route::get('/removeItemWishlist/{id}', 'ShopCart@removeItemWishlist')->name('removeItemWishlist');
Route::get('/removeItemCompare/{id}', 'ShopCart@removeItemCompare')->name('removeItemCompare');
Route::get('/clearCart', 'ShopCart@clearCart')->name('clearCart');
Route::post('/addToCart', 'ShopCart@addToCart')->name('addToCart');
Route::post('/updateToCart', 'ShopCart@updateToCart')->name('updateToCart');
Route::post('/storeOrder', 'ShopCart@storeOrder')->name('storeOrder');
//========End cart

//========Front
//profile
Route::get('/profilemain', 'ShopFront@showProfileMainPage')->name('profilemain');

//========End profile

//Home
Route::get('/', 'ShopFront@index')->name('home');
Route::get('index.html', 'ShopFront@index');
//End home

//Category
Route::get('/categories', 'ShopFront@getCategories')->name('categories');
Route::get('/category/{name}_{id}', 'ShopFront@productToCategory')
    ->where(['id' => '[0-9]+'])->name('category');
//End category

//Brand
Route::get('/brands', 'ShopFront@getBrands')->name('brands');
Route::get('/brand/{name}_{id}', 'ShopFront@productToBrand')
    ->where(['id' => '[0-9]+'])->name('brand');
//End brand

//Vendor
//Route::get('/vendors', 'ShopFront@getVendors')->name('vendors');
//Route::get('/vendor/{name}_{id}', 'ShopFront@productToVendor')
//    ->where(['id' => '[0-9]+'])->name('vendor');
//End vendor

//Product
Route::get('/products.html', 'ShopFront@allProducts')->name('products');
Route::get('/product/{name}_{id}', 'ShopFront@productDetail')
    ->where(['id' => '[0-9]+'])->name('product');
Route::post('/productRate', 'ShopFront@productRate')->name('productRate');
//End product

Route::get('/search.html', 'ShopFront@search')->name('search');
Route::post('/search', 'ShopFront@getSearch')->name('getSearch');
Route::get('/contact.html', 'ShopFront@getContact')->name('contact');
Route::post('/contact.html', 'ShopFront@postContact')->name('postContact');
Route::post('/subscribe', 'ShopFront@emailSubscribe')->name('subscribe');

//--Please keep 2 lines route (pages + pageNotFound) at the bottom
Route::get('/{key}.html', 'ShopFront@pages')->name('pages');
Route::fallback('ShopFront@pageNotFound')->name('pageNotFound');
//Route::get('fetch_data', 'PaginationController@fetch_data');
//--end keep
//=======End Front
