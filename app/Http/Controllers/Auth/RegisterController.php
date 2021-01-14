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
        $user = Auth::user();
        if ($user && $user->seller_type == 1) {
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
            'firstname'   => 'required|string|max:255',
            'familyname'  => 'required|string|max:255',
            'email'       => 'required|string|email|max:255|unique:' . (new User)->getTable() . ',email',
            'password'    => ['required','confirmed','min:6','regex:/^[a-zA-Z0-9!$#%]+$/'],
            'mobile'      => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new User)->getTable() . ',mobile',
            'phone'       => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new CompanyContact)->getTable() . ',mobile_contact',
            'address'     => ['required', 'string', 'max:255'],
            'gov'         => ['required','string', 'max:255'],
            'authMobile'  => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new CompanyContact)->getTable() . ',phone_contact,mobile_contact',
            'authcompanyname' => ['required','string','max:255'],
            'companycode'     => ['required','string','max:255'],
        ]
        );
    }
    protected function validatorMerchant(array $data)
    {
        $messages = [
            'email.unique'   => trans('language.errors.email'),
            'image'          => trans('language.errors.image'),
            'required'       => trans('language.errors.required'),
            'phone.unique'   => trans('language.errors.mobile'),
            'mobile.unique'  => trans('language.errors.mobile'),

        ];
        return Validator::make($data, [
            'email'             => 'required|string|email|max:255|unique:'. (new User)->getTable().',email',
            'firstname'         => 'required|string|max:255',
            'familyname'        => 'required|string|max:255',
            'marketname'        => ['required','string','max:255'],
            'password'          => ['required','confirmed','min:6','regex:/^[a-zA-Z0-9!$#%]+$/'],
            'mobile'            => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new CompanyContact)->getTable() . ',phone_contact,mobile_contact',
            'phone'             => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new CompanyContact)->getTable() . ',phone_contact,mobile_contact',
            'address'           => ['required', 'string', 'max:255'],
            'sector'            => ['required', 'string', 'max:255'],
            'gov'               => ['required', 'string', 'max:255'],
            'owner'             => ['required', 'string', 'max:255'],
            'companyname'       => ['required','string','max:255'],
            'companycode'       => ['required','string','max:255','unique:'.(new Company)->getTable().',code'],
            'bankbranch'        => ['string', 'max:255'],
            'bank'              => ['string', 'max:255'],
            'bankid'            => ['unique:'.(new Company)->getTable().',iban'],
            'commercerecording' => ['image','mimes:jpeg,jpg,png,svg','max:10000'],
            'taxcard'           => ['image','mimes:jpeg,jpg,png,svg','max:10000'],
            'extrataxcard'      => ['image','mimes:jpeg,jpg,png,svg','max:10000'],

        ], $messages);
    }
    public function registerMerchand(Request $request) {

        $data      = $request->data;

        $validator = $this->validatorMerchant($data);
        if($validator->fails()){
            return redirect()->back()->withInput()->withErrors($validator->errors());
        }

        $userClass     = config('admin.database.users_model');
        $roleUserClass = config('admin.database.role_user');

        try {

            DB::beginTransaction();

            //company shop
            $company = $this->createCompany($data, 1);

            //company_contact
            $companyContact = $this->companyContact($data, $company->id);

            //user
            $createUser = $this->create($data, $company->id, 1);

            //user role
            $roleUser           = new $roleUserClass();
            $roleUser->user_id  = $createUser->id;
            $roleUser->role_id  = 6;
            $roleUser->save();

            //worktime
            $companyWorktime = $this->companyWorktime($request, $company->id);

            DB::Commit();
            return redirect('login')->with('message', trans('language.registerMerchant.success'));
        }
        catch(\Exception $e){
            DB::rollback();
            print_r($e->getMessage());
        }

    }

    public function registerCustomer(Request $request) {
        //dd($request);
        $messages = [
            'email.unique'   => trans('language.errors.email'),
            'image'          => trans('language.errors.image'),
            'required'       => trans('language.errors.required'),
            'phone.unique'   => trans('language.errors.mobile'),
            'mobile.unique'  => trans('language.errors.mobile'),

        ];

        $data = $request->data;
        $vCustomer = Validator::make($data, [
                'firstname'   => 'required|string|max:255',
                'familyname'  => 'required|string|max:255',
                'email'       => 'required|string|email|max:255|unique:' . (new User)->getTable() . ',email',
                'password'    => ['required','confirmed','min:6','regex:/^[a-zA-Z0-9!$#%]+$/'],
                'mobile'      => 'required|regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new User)->getTable() . ',mobile',
                'address'     => ['required', 'string', 'max:255'],
                'gov'         => ['required','string', 'max:255'],
                'companycode' => ['required','string','max:255'],
            ], $messages
        );
        if($vCustomer->fails())
        {
            return redirect()->back()->withInput()->withErrors($vCustomer->errors());
        }

        $userClass = config('admin.database.users_model');
        $roleUserClass = config('admin.database.role_user');
        try {

            DB::beginTransaction();

            $checkExist =  Company::where('code',$request->data['companycode'])->first();
            if(!$checkExist) {
                $vCompany = validator::make($request->data,
                    [
                        'authMobile'        => 'regex:/^0[^0][0-9\-]{7,13}$/|unique:' . (new CompanyContact)->getTable() . ',phone_contact,mobile_contact',
                        'companyname'       => ['required','string','max:255'],
                        'owner'             => ['required','string','max:255'],
                    ], $messages);
                if($vCompany->fails())
                {
                    return redirect()->back()->withInput()->withErrors($vCompany->errors());
                }
                //company
                $company = $this->createCompany($data, 0);
                //companyWorkTime
                $companyWorkTime = $this->companyWorktime($request, $company->id);

                //companyContact
                $companyContact = $this->companyContact($data, $company->id);

                //user
                $user = $this->create($data, $company->id, 0);
            }else{
                //user
                $user = $this->create($data, $checkExist->id, 0);
            }

            //user role
            $roleUser = new $roleUserClass();
            $roleUser->user_id = $user->id;
            $roleUser->role_id = 7 ;
            $roleUser->save();
            DB::Commit();
            return redirect('login')->with('message', trans('language.registerMerchant.success'));
        }
        catch(\Exception $e){
            DB::rollback();
            print_r($e->getMessage());
        }

    }

    /**
     * @param array $data
     * @param $company_id
     * @param $seller_type
     * @return mixed
     */
    protected function create(array $data, $company_id, $seller_type)
    {
        return User::create([
            'name'       => $data['firstname'],
            'lname'      => $data['familyname'],
            'username'   => $data['email'],
            'email'      => $data['email'],
            'password'   => bcrypt($data['password']),
            'mobile'     => $data['mobile'],
            'company_id' => $company_id,
            'city'       => $data['gov'],
            'street'     => $data['address'],
            'seller_type' => $seller_type,
            'Cmanager_mobile' => $data['authMobile'] ?? null,
        ]);
    }

    /**
     * create new company
     * @param $data
     * @param $seller_type
     * @return Company
     */
    private function createCompany($data, $seller_type)
    {
        $company                  = new Company();
        $company->name            = $data['companyname'];
        $company->code            = $data['companycode'];
        $company->iban            = $data['bankid'] ?? null;
        $company->seller          = $seller_type;
        $company->active          = 1;
        $company->activity_id     = 9;
        $company->manager         = trim($data['firstname'] .' '.$data['familyname']);
        $company->contracting_manager = $data['owner'] ?? null ;

        $company->save();
        return $company;
    }

    /**
     * @param $data
     * @param $company_id
     * @return CompanyContact
     */
    private function companyContact($data, $company_id)
    {
        $companyContact                 = new CompanyContact();
        $companyContact->company_id     = $company_id;
        $companyContact->mobile_contact = $data['mobile'];
        $companyContact->phone_contact  = $data['phone'];
        $companyContact->address        = $data['address'];
        if(isset($data['department']) || isset($data['floorNum']))
        {
            $companyContact->address    = $data['address'].'-F'.$data['floorNum'].'-D'.$data['department'];
        }
        $companyContact->bank           = $data['bank'] ?? null;
        $companyContact->bank_branch    = $data['bankbranch'] ?? null;
        $companyContact->street_number  = $data['sector'];
        $companyContact->city           = $data['gov'];
        $companyContact->email          = $data['email'];
        $companyContact->manager         = trim($data['firstname'] .' '.$data['familyname']);
        $companyContact->contracting_manager = $data['owner'] ?? null;

        //commercerecording
        if(isset($data['commercerecording'])){
            $uploadTaxExtra = new Image($data['commercerecording']);
            $uploadTaxExtra->uniqueName();
            $uploadTaxExtra->move('company_paper_'.$company_id);
            $companyContact->commercial_paper = $uploadTaxExtra->prepare($data['commercerecording']) ;
            $companyContact->path = Storage::disk(config('admin.upload.disk'))->url('');
        }

        //tax extra
        if(isset($data['extrataxcard'])){
            $uploadTaxExtra = new Image($data['extrataxcard']);
            $uploadTaxExtra->uniqueName();
            $uploadTaxExtra->move('company_paper_'.$company_id);
            $companyContact->tax_extra = $uploadTaxExtra->prepare($data['extrataxcard']) ;
            $companyContact->path = Storage::disk(config('admin.upload.disk'))->url('');
        }

        //// tax paper
        if(isset($data['taxcard'])){
            $uploadedTaxImage = new Image( $data['taxcard']) ;
            $uploadedTaxImage->uniqueName();
            $uploadedTaxImage->move('company_paper_'.$company_id);
            $companyContact->tax_paper = $uploadedTaxImage->prepare($data['taxcard']);
            $companyContact->path = Storage::disk(config('admin.upload.disk'))->url('');
        }
        $companyContact->save();
        return $companyContact;
    }

    private function companyWorktime($request, $company_id)
    {
        $companyWorktime             = new CompanyWorkTime();
        $companyWorktime->from_am    = $request->fromhour ?? 0;
        $companyWorktime->to_pm      = $request->tohour ?? 0;
        $companyWorktime->company_id = $company_id;
        $companyWorktime->sat        = $request->str ? 1 : 0 ;
        $companyWorktime->sun        = $request->sun ? 1 : 0;
        $companyWorktime->mon        = $request->mon ? 1 : 0 ;
        $companyWorktime->Tues       = $request->tue ? 1 : 0 ;
        $companyWorktime->Wednesday  = $request->wed ? 1 : 0;
        $companyWorktime->Thursday   = $request->thu ? 1 : 0;
        $companyWorktime->Friday     = $request->fri ? 1 : 0;
        $companyWorktime->save();
        return $companyWorktime;
    }



}
