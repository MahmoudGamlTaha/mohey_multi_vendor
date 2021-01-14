<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
            $currentAction = \Route::currentRouteAction();
            list($controller, $method) = explode('@', $currentAction);
            $condition = $this->endsWith($controller, "RegisterController") && $method == "showRegisterMerchantForm";
            if($condition && Auth::user()->seller_type == 0){
                return $next($request);
            }
            return redirect('/');
        }

        return $next($request);
    }
    function endsWith( $haystack, $needle ) {
        $length = strlen( $needle );
        if( !$length ) {
            return true;
        }
        return substr( $haystack, -$length ) === $needle;
    }
}
