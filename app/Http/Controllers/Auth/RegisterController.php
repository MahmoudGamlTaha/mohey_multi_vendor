<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\CompanyWorkTime;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\GeneralController as GeneralController;
use App\Models\Company;
use App\Models\CompanyContact;
use Auth;
use Encore\Admin\Form\Field\Image;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use DB;
use Encore\Admin\company as AdminCompany;
use Illuminate\Support\Facades\Storage;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
     */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    // protected $redirectTo = '/home';
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function showRegisterMerchantForm()
    {
        if (Auth::user()) {
            return redirect()->route('home');
        }
        return view((new GeneralController)->theme . '.shop_register_merchant',
            array(
                'title' => trans('language.registermerchant'),
            )
        );
    }
    public function showRegisterCustomerForm()
    {
        if (Auth::user()) {
            return redirect()->route('home');
        }
        return view((new GeneralController)->theme . '.shop_register_customer',
            array(
                'title' => trans('language.registerCustomer'),
            )
        );
    }
    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'reg_name'     => 'required|string|max:255',
            'reg_email'    => 'required|string|email|max:255|unique:' . (new User)->getTable() . ',email',
            'reg_password' => 'required|string|min:6|confirmed',
            'reg_phone'    => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'reg_address1' => 'required|string|max:255',
            'reg_address2' => 'required|string|max:255',
        ]
        );
    }
    protected function validatorMerchant(array $data)
    {
        $messages = [
            'email.unique'   => trans('language.errors.email'),
            'image'          => trans('language.errors.image'),
            'password.regex' => 'password must contain at least one uppercase letter one lowercase letter',
            'required'       => trans('language.errors.required'),
            'phone.unique'   => trans('language.errors.mobile'),
            'mobile.unique'   => trans('language.errors.mobile'),
        ];
        return Validator::make($data, [
            'email'             => 'required|string|email|max:255|unique:'. (new User)->getTable().',email',
            'firstname'         => 'required|string|max:255',
            'familyname'        => 'required|string|max:255',
            'marketname'        => ['required','string','max:255','unique:'.(new Company)->getTable().',name'],
            'password'          => ['required','confirmed','min:6','regex:/^[a-zA-Z0-9!$#%]+$/'],
            'mobile'            => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new User)->getTable() . ',mobile',
            'phone'             => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new CompanyContact)->getTable() . ',mobile_contact',
            'address'           => ['required', 'string', 'max:255'],
            'sector'            => ['required', 'string', 'max:255'],
            'gov'               => ['required', 'string', 'max:255'],
            'owner'             => ['required', 'string', 'max:255'],
            'companyname'       => ['required','string','max:255','unique:'.(new Company)->getTable().',name'],
            'companycode'       => ['required','string','max:255','unique:'.(new Company)->getTable().',code'],
            'bankbranch'        => ['required', 'string', 'max:255'],
            'bank'              => ['required', 'string', 'max:255'],
            'bankid'            => ['required', 'unique:'.(new Company)->getTable().',iban'],
            'commercerecording' => ['image','mimes:jpeg,jpg,png,svg','required','max:10000'],
            'taxcard'           => ['image','mimes:jpeg,jpg,png,svg','required','max:10000'],
            'extrataxcard'      => ['image','mimes:jpeg,jpg,png,svg','required','max:10000'],

        ], $messages);
    }
    public function registerMerchand(Request $request) {

        $data = $request->data;
        $validator = $this->validatorMerchant($data);
        if($validator->fails()){
            return redirect()->back()->withInput()->withErrors($validator->errors());
        }

        $userClass = config('admin.database.users_model');
        $roleUserClass = config('admin.database.role_user');
        $userModel = new $userClass();

        try {
            DB::beginTransaction();

            //company shop
            $company                  = new Company();
            $company->name            = $data['companyname'];
            $company->code            = $data['companycode'];
            $company->activity_id     = 9;
            $company->seller          = 1;
            $company->iban            = $data['bankid'];
            $company->active          = 1;
            $company->general_manger  = $data['owner'];
            $company->general_manger  = trim($request->data['firstname'] .' '.$request->data['familyname']);
            $company->save();

            //company_contact
            $companyContact                 = new CompanyContact();
            $companyContact->company_id     = $company->id;
            $companyContact->mobile_contact = $data['mobile'];
            $companyContact->phone_contact  = $data['phone'];
            $companyContact->address        = $data['address'];
            $companyContact->bank           = $data['bank'];
            $companyContact->bank_branch    = $data['bankbranch'];
            $companyContact->street_number  = $data['sector'];
            $companyContact->city           = $data['gov'];
            $companyContact->email          = $data['email'];
            $company->general_manger  = $data['owner'];
            $company->general_manger  = trim($request->data['firstname'] .' '.$request->data['familyname']);

            //commercerecording
            if(isset($request->data['commercerecording'])){
                $uploadTaxExtra = new Image($request->data['commercerecording']);
                $uploadTaxExtra->uniqueName();
                $uploadTaxExtra->move('company_paper_'.$company->id);
                $companyContact->commercial_paper = $uploadTaxExtra->prepare($request->data['commercerecording']) ;
                $companyContact->path = Storage::disk(config('admin.upload.disk'))->url('');
            }

            //tax extra
            if(isset($request->data['extrataxcard'])){
                $uploadTaxExtra = new Image($request->data['extrataxcard']);
                $uploadTaxExtra->uniqueName();
                $uploadTaxExtra->move('company_paper_'.$company->id);
                $companyContact->tax_extra = $uploadTaxExtra->prepare($request->data['extrataxcard']) ;
                $companyContact->path = Storage::disk(config('admin.upload.disk'))->url('');
            }

            //// tax paper
            $uploadedTaxImage = new Image( $request->data['taxcard']) ;
            $uploadedTaxImage->uniqueName();
            $uploadedTaxImage->move('company_paper_'.$company->id);
            $companyContact->tax_paper = $uploadedTaxImage->prepare($request->data['taxcard']);

            $companyContact->save();

            //user
            $userModel->name         = $request->data['firstname'];
            $userModel->lname        = $request->data['familyname'];
            $userModel->username     = $request->data['email'];
            $userModel->seller_type  = 1;
            $userModel->email        = $request->data['email'];
            $userModel->password     = bcrypt($request->data['password']);
            $userModel->mobile       = $request->data['mobile'];
            $userModel->city         = $request->data['gov'];
            $userModel->street       = $request->data['sector'];
            $userModel->company_id   = $company->id;
            $userModel->save();

            //user role
            $roleUser           = new $roleUserClass();
            $roleUser->user_id  = $userModel->id;
            $roleUser->role_id  = 1;
            $roleUser->save();

            //worktime
            $companyWorktime          = new CompanyWorkTime();
            $companyWorktime->from_am = $request->fromhour ?? 0;
            $companyWorktime->to_pm   = $request->tohour ?? 0;
            $companyWorktime->company_id = $company->id;

            $companyWorktime->sat        = $request->str ? 1 : 0 ;
            $companyWorktime->sun        = $request->sun ? 1 : 0;
            $companyWorktime->mon        = $request->mon ? 1 : 0 ;
            $companyWorktime->Tues        = $request->tue ? 1 : 0 ;
            $companyWorktime->Wednesday   = $request->wed ? 1 : 0;
            $companyWorktime->Thursday    = $request->thu ? 1 : 0;
            $companyWorktime->Friday      = $request->fri ? 1 : 0;
            $companyWorktime->save();

            DB::Commit();
            return view((new GeneralController)->theme . '.shop_login',
                array(
                    'title' => trans('language.login'),
                )
            );
        }
        catch(\Exception $e){
            print_r($e->getMessage());
            DB::rollback();
        }

    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name'     => $data['reg_name'],
            'email'    => $data['reg_email'],
            'password' => bcrypt($data['reg_password']),
            'phone'    => $data['reg_phone'],
            'address1' => $data['reg_address1'],
            'address2' => $data['reg_address2'],
        ]);
    }

}
