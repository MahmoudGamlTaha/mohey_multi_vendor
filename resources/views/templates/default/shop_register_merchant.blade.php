@extends($theme.'.shop_layout')

@section('main')

    <section id="form-login"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-1">
                </div>
                <div class="col-sm-2">

                </div>
                <div class="col-sm-6">
                    <form action="{{route('newMerchant')}}" method="post" enctype="multipart/form-data" novalidate="novalidate">
                        {!! csrf_field() !!}
                        <div class="col-sm-12">

                            <h3 style="text-align: center;color:#F68C31;">{{ trans('language.registerMerchant.account') }}</h3>
                            <br/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="familyname">{{ trans('language.registerMerchant.last_name') }}</label> <span style="color:red;">*</span>
                            <input type="text" id="familyname" name="data[familyname]" required="required" class="form-control{{ $errors->has('familyname') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.familyname') }}" autofocus>
                            @if ($errors->has('familyname'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('familyname') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="firstname">الاسم الاول</label> <span style="color:red;">*</span>
                            <input type="text" id="firstname" name="data[firstname]" required="required" class="form-control{{ $errors->has('firstname') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.firstname') }}" autofocus>
                            @if ($errors->has('firstname'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('firstname') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="email">البريد الالكترونى</label> <span style="color:red;">*</span>
                            <input type="text" id="email" name="data[email]" required="required" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.email') }}" autofocus>
                            @if ($errors->has('email'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('email') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="password_confirmation">تأكيد كلمة المرور</label> <span style="color:red;">*</span>
                            <input type="password" id="password_confirmation" name="data[password_confirmation]" required="required" class="form-control{{ $errors->has('password_confirmation') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.password_confirmation') }}" autofocus>
                            @if ($errors->has('password_confirmation'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('password_confirmation') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="password">كلمة المرور</label> <span style="color:red;">*</span>
                            <input type="password" id="password" name="data[password]" required="required" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" autofocus>
                            @if ($errors->has('password'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                        {{ $errors->first('password') }}
                      </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="mobile">رقم الموبايل</label> <span style="color:red;">*</span>
                            <input type="text" id="mobile" name="data[mobile]" required="required" class="form-control{{ $errors->has('mobile') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.mobile') }}" autofocus>
                            @if ($errors->has('mobile'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('mobile') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="phone">رقم الهاتف</label> <span style="color:red;">*</span>
                            <input type="text" id="phone" name="data[phone]" required="required" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.phone') }}" autofocus>
                            @if ($errors->has('phone'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('phone') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="marketname">اسم المتجر</label> <span style="color:red;">*</span>
                            <input type="text" id="marketname" name="data[marketname]" required="required" class="form-control{{ $errors->has('marketname') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.marketname') }}" autofocus>
                            @if ($errors->has('marketname'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('marketname') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="address">عنوان المتجر</label> <span style="color:red;">*</span>
                            <input type="text" id="address" name="data[address]" required="required" class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.address') }}" autofocus>
                            @if ($errors->has('address'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('address') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="sector">رقم الحى</label> <span style="color:red;">*</span>
                            <input type="text" id="sector" name="data[sector]" required="required" class="form-control{{ $errors->has('sector') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.sector') }}" autofocus>
                            @if ($errors->has('sector'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('sector') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="gov">المحافظة</label> <span style="color:red;">*</span>
                            <input type="text" id="gov" name="data[gov]" required="required" class="form-control{{ $errors->has('gov') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.gov') }}" autofocus>
                            @if ($errors->has('gov'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('gov') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="commercerecord">السجل التجارى</label> <span style="color:red;">*</span>
                            <input type="file" id="commercerecording" name="data[commercerecording]" required="required" accept="image/*" class="form-control{{ $errors->has('commercerecording') ? ' is-invalid' : '' }}"
                                   name="commercerecording" value="{{ old('commercerecording') }}" autofocus>
                            @if ($errors->has('commercerecording'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('commercerecording') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="taxcard">البطاقة الضريبية</label> <span style="color:red;">*</span>
                            <input type="file" id="taxcard" name="data[taxcard]" required="required" accept="image/*" class="form-control{{ $errors->has('taxcard') ? ' is-invalid' : '' }}"
                                   name="taxcard" value="{{ old('taxcard') }}" autofocus>
                            @if ($errors->has('taxcard'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('taxcard') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="extrataxcard">بطاقة الضريبة المضافة</label> <span style="color:red;"></span>
                            <input type="file" id="extrataxcard" name="data[extrataxcard]" accept="image/*" class="form-control{{ $errors->has('extrataxcard') ? ' is-invalid' : '' }}"
                                   name="extrataxcard" value="{{ old('extrataxcard') }}" autofocus>
                            @if ($errors->has('extrataxcard'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('extrataxcard') }}
                          </span>
                            @endif
                        </div>

                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="bankbranch">اسم الفرع</label> <span style="color:red;">*</span>
                            <input type="text" id="bankbranch" name="data[bankbranch]" required="required" class="form-control{{ $errors->has('bankbranch') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.bankbranch') }}" autofocus>
                            @if ($errors->has('bankbranch'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('bankbranch') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="bank">اسم البنك</label> <span style="color:red;">*</span>
                            <input type="text" id="bank" name="data[bank]" required="required" class="form-control{{ $errors->has('bank') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.bank') }}" autofocus>
                            @if ($errors->has('bank'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('bank') }}
                          </span>
                            @endif
                        </div>


                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="bankid">رقم الحساب البنكى</label> <span style="color:red;">*</span>
                            <input type="text" id="bankid" name="data[bankid]" required="required" class="form-control{{ $errors->has('bankid') ? ' is-invalid' : '' }}"
                                   value="{{ old('data.bankid') }}" autofocus>
                            @if ($errors->has('bankid'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('bankid') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="control-label" for="owner">اسم المستفيد</label> <span style="color:red;">*</span>
                            <input type="text" id="owner" name="data[owner]" required="required" class="form-control{{ $errors->has('owner') ? ' is-invalid' : '' }}"
                                   name="owner" value="{{ old('data.owner') }}" autofocus>
                            @if ($errors->has('owner'))
                                <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('owner') }}
                          </span>
                            @endif
                        </div>

                        <div class="col-sm-12 form-group">
                            <br/>
                            <br/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="companyname">اسم الشركة</label> <span style="color:red;">*</span>
                            <input type="text" id="companyname" name="data[companyname]" required="required" class="form-control{{ $errors->has('companyname') ? ' is-invalid' : '' }}"
                                   name="companyname" value="{{ old('data.companyname') }}" autofocus>
                            @if ($errors->has('companyname'))
                                <span class="invalid-feedback" style="color: red"  role="alert">
                            {{ $errors->first('companyname') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-6 form-group">
                            <label class="control-label" for="companycode">كود الشركة</label> <span style="color:red;">*</span>
                            <input type="text" id="companycode" name="data[companycode]" required="required" class="form-control{{ $errors->has('companycode') ? ' is-invalid' : '' }}"
                                   name="companycode" value="{{ old('data.companycode') }}" autofocus>
                            @if ($errors->has('companycode'))
                                <span class="invalid-feedback" style="color: red"  role="alert">
                            {{ $errors->first('companycode') }}
                          </span>
                            @endif
                        </div>
                        <div class="col-sm-12 form-group">
                            <h3>مواعيد العمل</h3>
                            <span>خلال فترة الاجازة، ستكون منتجاتك غير متصلة بالانترنت، لكن لا يزال امكانك معالجة الطلبات المعلقةاو عرض بيانات حسابك. تشمل فترة العطلةتواريخ البدء والانتهاء</span>
                        </div>
                        <div class="col-sm-7 form-group" style="text-align:center;padding:0px;">
                            <h3>مواعيد ساعات العمل<span style="color:red;">*</span></h3>
                            <label>من</label> <input type="text" id="fromhour" name="fromhour" style="width:50px;"/> <label>صباحا</label>
                            &nbsp;&nbsp;<label>إلى</label> <input type="text" id="tohour" name="tohour" style="width:50px;"/> <label>مساءا</label>
                        </div>
                        <div class="col-sm-5 form-group" name="weekend" style="padding:0px;">
                            <h3 style="text-align:center;">أختر ايام العطلة<span style="color:red;">*</span></h3>
                            <label style="text-align:center;width:100%;">أيام الاسبوع</label>

                            <div class="col-sm-6 form-group"style="padding:0px;">
                                <input type="checkbox" id="day1" name="str"/>
                                <label for="day1">السبت</label>
                            </div>
                            <div class="col-sm-6 form-group" style="padding:0px;">
                                <input type="checkbox" id="day2" name="sun"/>
                                <label for="day2">الاحد</label>
                            </div>
                            <div class="col-sm-6 form-group"style="padding:0px;">
                                <input type="checkbox" id="day3" name="mon"/>
                                <label for="day3">الاثنين</label>
                            </div>
                            <div class="col-sm-6 form-group"style="padding:0px;">
                                <input type="checkbox" id="day4" name="tue"/>
                                <label for="day2">الثلاثاء</label>
                            </div>
                            <div class="col-sm-6 form-group"style="padding:0px;">
                                <input type="checkbox" id="day5" name="wed"/>
                                <label for="day5">الاربعاء</label>
                            </div>
                            <div class="col-sm-6 form-group"style="padding:0px;">
                                <input type="checkbox" id="day6" name="thu"/>
                                <label for="day6">الخميس</label>
                            </div>
                            <div class="col-sm-6 form-group"style="padding:0px;">
                                <input type="checkbox" id="day7" name="fri"/>
                                <label for="day7">الجمعة</label>
                            </div>
                            <div class="col-sm-6 form-group"style="padding:0px;">
                                <input type="checkbox" id="vac" name="vac"/>
                                <label for="vac">أيام الاجازات الرسمية</label>
                            </div>
                        </div>

                        <div class="col-sm-12 form-group">
                            <br/>
                            <br/>
                        </div>

                        <button class="btn form-control btn-yellow-white">إنشاء حساب</button>

                        <br/>
                        <br/>
                    </form>
                </div>
            </div>
        </div>
    </section><!--/form-->
@endsection
