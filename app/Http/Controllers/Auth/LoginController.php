<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\GeneralController as GeneralController;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
     */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = '/';
    protected function redirectTo()
    {
        return '/';
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    protected function validateLogin(Request $request)
    {
        $this->validate($request, [
            'email'    => 'required|string|email',
            'password' => 'required|string',
        ]);
    }
    public function showProfileForm()
    { dd(888);
      return view((new GeneralController)->theme . '.shop_profile_main',
          array(
              'title' => trans('language.Profile_main'),
          )
      );
    }
    public function showLoginForm()
    {
        if (Auth::user()) {
           
            return redirect()->route('home');
        }
        return view((new GeneralController)->theme . '.shop_login',
            array(
                'title' => trans('language.login'),
            )
        );
    }

    public function logout(Request $request)
    {
        $this->guard()->logout();
        $request->session()->invalidate();
        Session::flush();
       // Redirect::back();
        return $this->loggedOut($request) ?: redirect()->route('login');
    }
  //  protected function guard()
   // {
     //   return Auth::guard();
   // }
}
