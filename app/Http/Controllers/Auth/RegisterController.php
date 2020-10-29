<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
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
        return Validator::make($data, [
            'firstname' => 'required|string|max:255',
            'familyname' => 'required|string|max:255',
            'email'    => 'required|string|email|max:255|unique:' . (new User)->getTable() . ',email',
            'password' => 'required|string|min:6|confirmed',
            'phone'    => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new User)->getTable() . ',phone',
            'reg_address1' => 'required|string|max:255',
            'reg_address2' => 'required|string|max:255',
        ]
        );
    }
    public function registerMerchand(Request $request) {
        $company = new Company();
        $userClass = config('admin.database.users_model');
        $roleUserClass = config('admin.database.role_user');
        $userModel = new $userClass();
     try {
        DB::beginTransaction();
        if(!$this->validatorMerchant($request->data)) {
            return;
        }
    //    print_r($request->data);
        //company shop
        $company->name = $request->data['marketname'];
        $company->code = $request->data['companycode'];
        $company->active = 1;
        $company->seller = 1;
        $company->activity_id = 9;
        $company->general_manger = trim($request->data['firstname'] .' '.$request->data['familyname']);
        $company->iban = $request->data['bankid'];
        $company->save();
        //company_contact
        $companyContact = new CompanyContact();
        $companyContact->company_id = $company->id;
        $companyContact->mobile_contact = $request->data['mobile'];
        $companyContact->bank = $request->data['bank'];
        $companyContact->bank_branch = $request->data['bankbranch'];
        $companyContact->city = $request->data['gov'];
       //company contact
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
        $userModel->name = $request->data['firstname'];
        $userModel->lname = $request->data['familyname'];
        $userModel->username = $request->data['email']; 
        $userModel->seller_type = 1;
        $userModel->email = $request->data['email'];
        $userModel->password = bcrypt($request->data['password']);
        $userModel->mobile = $request['mobile'];
        $userModel->company_id = $company->id;
        $userModel->save();
        //user role
        $roleUser = new $roleUserClass();
        $roleUser->user_id = $userModel->id;
        $roleUser->role_id = 1;
        $roleUser->save();
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
    public function registerCustomer(Request $request) {
        $company = new Company();
        $userClass = config('admin.database.users_model');
        $roleUserClass = config('admin.database.role_user');
        $userModel = new $userClass();
     try {
        DB::beginTransaction();
        //dd($request->data);
        if(!$this->validatorMerchant($request->data)) {
            return;
        }
    //    print_r($request->data);
        //company shop
        $checkExist =  Company::where('code',$request->data['companycode'])->first();
        if(!$checkExist) {
            //dd($request->data);
        $company->name = $request->data['marketname'];
        $company->code = $request->data['companycode'];
        $company->active = 1;
        $company->seller = 0;
        $company->activity_id = 9;
        $company->general_manger = trim($request->data['firstname'] .' '.$request->data['familyname']);
        $company->save();
        }
        //dd(10);
        //user   
        $userModel->name = $request->data['firstname'];
        $userModel->lname = $request->data['familyname'];
        $userModel->username = $request->data['email']; 
        $userModel->seller_type = 0;
        $userModel->email = $request->data['email'];
        $userModel->password = bcrypt($request->data['password']);
        $userModel->mobile = $request['mobile'];
        $userModel->company_id = $company->id;
        $userModel->save();
        //user role
        $roleUser = new $roleUserClass();
        $roleUser->user_id = $userModel->id;
        $roleUser->role_id = 3;
        $roleUser->save();
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
