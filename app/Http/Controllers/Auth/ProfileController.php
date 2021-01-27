<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\GeneralController as GeneralController;
use App\Models\Company;
use App\Models\CompanyContact;
use App\User;
use Auth;
use http\Env\Response;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');

    }

    protected function validatorMerchant(array $data)
    {
        $messages = [
            'required'       => trans('language.errors.required'),
        ];
        return Validator::make($data, [
            'id'                => 'required|numeric',
            'email'             => 'required|string|email|max:255',
            'fullName'         => 'required|string|max:255',
            'phone'             => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'company'       => ['required','string','max:255'],

        ], $messages);
    }
    public function update(Request $request)
    {
        if (!Auth::user()) {
            return redirect()->route('home');
        }
        $data = $request->all();
        $validator = $this->validatorMerchant($data);
        if($validator->fails()){
            return response()->json([
                'error' => 1,
                 'key' => $validator->errors()->keys(),
                 'msg' => $validator->errors(),
            ]);
        }
        if($request['id'] != Auth::id())
        {
            return response()->json([
                'error' => 1,
                'msg' => 'error'
            ]);
        }
        $email = User::where(['email' => $data['email'], 'mobile' => $data['phone']])->where('id', '!=', $data['id'])->get();
        if($email->count() > 0)
        {
            return response()->json([
                'error' => 1,
                'msg' => 'this email already exists'
            ]);
        }
        $user = User::findOrFail($data['id']);
        $user->email = $data['email'];
        $user->name = $data['fullName'];
        $user->mobile = $data['phone'];
        $user->update();

        $companyContatc = Company::findOrFail($user->company_id);
        $companyContatc->name = $data['company'];
        $companyContatc->update();
        return response()->json([
            'error' => 0,
            'msg' => 'profile information updated successfully',
        ]);
    }


}