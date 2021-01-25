@extends($theme.'.shop_layout')

@section('main')
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-y-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="breadcrumb">
                        <div class="breadcrumb__wrap">
                            <ul class="breadcrumb__list">
                                <li class="has-separator">

                                    <a href="{{route('home')}}">Home</a></li>
                                <li class="is-marked">

                                    <a href="signup.html">Signup</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section 1 ======-->


        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary">{{ trans('language.registerMerchant.account') }}</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row row--center">
                        <div class="col-lg-6 col-md-8 u-s-m-b-30">
                            <div class="l-f-o">
                                <div class="l-f-o__pad-box">
                                    <h1 class="gl-h1">PERSONAL INFORMATION</h1>
                                    <form class="l-f-o__form" action="{{route('newMerchant')}}" method="post" enctype="multipart/form-data">
                                        {!! csrf_field() !!}
                                        <div class="gl-inline">
                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-fname">FIRST NAME *</label>

                                            <input class="input-text input-text--primary-style {{ $errors->has('firstname') ? ' is-invalid' : '' }}" type="text" id="firstname" name="data[firstname]" required="required" placeholder="First Name" value="{{ old('data.firstname') }}">
                                            @if ($errors->has('firstname'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('firstname') }}
                                                </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-lname">{{ trans('language.registerMerchant.last_name') }} *</label>

                                            <input class="input-text input-text--primary-style {{ $errors->has('familyname') ? ' is-invalid' : '' }}" type="text" id="familyname" name="data[familyname]" required="required" placeholder="Last Name" value="{{ old('data.familyname') }}">
                                            @if ($errors->has('familyname'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('familyname') }}
                                                </span>
                                            @endif
                                        </div>
                                        </div>
                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-email">E-MAIL *</label>

                                            <input class="input-text input-text--primary-style {{ $errors->has('email') ? ' is-invalid' : '' }}" type="text" id="email" name="data[email]" required="required" placeholder="Enter E-mail" value="{{ old('data.email') }}">
                                            @if ($errors->has('email'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('email') }}
                                                </span>
                                            @endif
                                        </div>
                                        <div class="gl-inline">
                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-password">PASSWORD *</label>

                                            <input class="input-text input-text--primary-style {{ $errors->has('password') ? ' is-invalid' : '' }}" type="password" id="password" name="data[password]" required="required" placeholder="Enter Password">
                                            @if ($errors->has('password'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('password') }}
                                                </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">

                                            <label class="gl-label" for="reg-password">PASSWORD CONFIRMATION *</label>

                                            <input class="input-text input-text--primary-style {{ $errors->has('password_confirmation') ? ' is-invalid' : '' }}" type="password" id="password_confirmation" name="data[password_confirmation]" required="required" placeholder="Enter Password">
                                            @if ($errors->has('password_confirmation'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('password_confirmation') }}
                                                </span>
                                            @endif
                                        </div>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="mobile">رقم الموبايل</label>
                                            <input type="text" id="mobile" name="data[mobile]" required="required" class="input-text input-text--primary-style {{ $errors->has('mobile') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.mobile') }}" autofocus>
                                            @if ($errors->has('mobile'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('mobile') }}
                                                </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="phone">رقم الهاتف</label>
                                            <input type="text" id="phone" name="data[phone]" required="required" class="input-text input-text--primary-style {{ $errors->has('phone') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.phone') }}" autofocus>
                                            @if ($errors->has('phone'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('phone') }}
                                                </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="marketname">اسم المتجر</label>
                                            <input type="text" id="marketname" name="data[marketname]" required="required" class="input-text input-text--primary-style {{ $errors->has('marketname') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.marketname') }}" autofocus>
                                            @if ($errors->has('marketname'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('marketname') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="gl-inline">
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="gov">المحافظة</label>
                                            <input type="text" id="gov" name="data[gov]" required="required" class="input-text input-text--primary-style {{ $errors->has('gov') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.gov') }}" autofocus>
                                            @if ($errors->has('gov'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                {{ $errors->first('gov') }}
                                              </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="sector">رقم الحى</label>
                                            <input type="text" id="sector" name="data[sector]" required="required" class="input-text input-text--primary-style {{ $errors->has('sector') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.sector') }}" autofocus>
                                            @if ($errors->has('sector'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                {{ $errors->first('sector') }}
                                              </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="address">عنوان المتجر</label>
                                            <input type="text" id="address" name="data[address]" required="required" class="input-text input-text--primary-style {{ $errors->has('address') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.address') }}" autofocus>
                                            @if ($errors->has('address'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('address') }}
                                                  </span>
                                            @endif
                                        </div>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="commercerecord">السجل التجارى</label>
                                            <input type="file" id="commercerecording" name="data[commercerecording]" accept="image/*" class="{{ $errors->has('commercerecording') ? ' is-invalid' : '' }}"
                                                   name="commercerecording" value="{{ old('commercerecording') }}" autofocus>
                                            @if ($errors->has('commercerecording'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('commercerecording') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="taxcard">البطاقة الضريبية</label>
                                            <input type="file" id="taxcard" name="data[taxcard]" accept="image/*" class="{{ $errors->has('taxcard') ? ' is-invalid' : '' }}"
                                                   name="taxcard" value="{{ old('taxcard') }}" autofocus>
                                            @if ($errors->has('taxcard'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('taxcard') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30" style="margin-bottom: 30px;">
                                            <label class="gl-label" for="extrataxcard">بطاقة الضريبة المضافة</label>
                                            <input type="file" id="extrataxcard" name="data[extrataxcard]" accept="image/*" class=" {{ $errors->has('extrataxcard') ? ' is-invalid' : '' }}"
                                                   name="extrataxcard" value="{{ old('extrataxcard') }}" autofocus>
                                            @if ($errors->has('extrataxcard'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('extrataxcard') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="bank">اسم البنك</label>
                                            <input type="text" id="bank" name="data[bank]" required="required" class="input-text input-text--primary-style {{ $errors->has('bank') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.bank') }}" autofocus>
                                            @if ($errors->has('bank'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                {{ $errors->first('bank') }}
                                              </span>
                                            @endif
                                        </div>
                                        <div class="gl-inline">
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="bankbranch">اسم الفرع</label>
                                            <input type="text" id="bankbranch" name="data[bankbranch]" class="input-text input-text--primary-style {{ $errors->has('bankbranch') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.bankbranch') }}" autofocus>
                                            @if ($errors->has('bankbranch'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('bankbranch') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="bankid">رقم الحساب البنكى</label>
                                            <input type="text" id="bankid" name="data[bankid]" class="input-text input-text--primary-style {{ $errors->has('bankid') ? ' is-invalid' : '' }}"
                                                   value="{{ old('data.bankid') }}" autofocus>
                                            @if ($errors->has('bankid'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('bankid') }}
                                                  </span>
                                            @endif
                                        </div>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="owner">اسم المستفيد</label>
                                            <input type="text" id="owner" name="data[owner]" required="required" class="input-text input-text--primary-style {{ $errors->has('owner') ? ' is-invalid' : '' }}"
                                                   name="owner" value="{{ old('data.owner') }}" autofocus>
                                            @if ($errors->has('owner'))
                                                <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('owner') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="companyname">اسم الشركة</label>
                                            <input type="text" id="companyname" name="data[companyname]" required="required" class="input-text input-text--primary-style {{ $errors->has('companyname') ? ' is-invalid' : '' }}"
                                                   name="companyname" value="{{ old('data.companyname') }}" autofocus>
                                            @if ($errors->has('companyname'))
                                                <span class="invalid-feedback" style="color: red"  role="alert">
                                                    {{ $errors->first('companyname') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="companycode">كود الشركة</label>
                                            <input type="text" id="companycode" name="data[companycode]" required="required" class="input-text input-text--primary-style {{ $errors->has('companycode') ? ' is-invalid' : '' }}"
                                                   name="companycode" value="{{ old('data.companycode') }}" autofocus>
                                            @if ($errors->has('companycode'))
                                                <span class="invalid-feedback" style="color: red"  role="alert">
                                                    {{ $errors->first('companycode') }}
                                                  </span>
                                            @endif
                                        </div>
                                        <div class="u-s-m-b-30" style="text-align: right">
                                            <h3>مواعيد العمل</h3>
                                            <label>من</label> <input type="text" id="fromhour" name="fromhour" style="width:50px;outline:none;background-color:#F1F1F1;border:1px solid #FF4500;border-radius: 3px"/> <label>صباحا</label>
                                            &nbsp;&nbsp;<label>إلى</label> <input type="text" id="tohour" name="tohour" style="width:50px;outline:none;background-color:#F1F1F1;border:1px solid #FF4500;border-radius: 3px"/> <label>مساء</label>
                                            <br>
                                            <span>خلال فترة الاجازة، ستكون منتجاتك غير متصلة بالانترنت، لكن لا يزال امكانك معالجة الطلبات المعلقةاو عرض بيانات حسابك. تشمل فترة العطلة تواريخ البدء والانتهاء</span>
                                        </div>
                                        <div class="u-s-m-b-30" style="text-align: right">
                                            <h4> ايام العطلة</h4>
                                            <div style="column-count: 2">
                                                <div>
                                                    <input type="checkbox" id="day5" name="day5"/>
                                                    <label for="day5"> الاربعاء</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" id="day7" name="day2"/>
                                                    <label for="day2">  الجمعة </label>
                                                </div>
                                                <div >
                                                    <input type="checkbox" id="day6" name="day6"/>
                                                    <label for="day6">  الخميس </label>
                                                </div>

                                                <div >
                                                    <input type="checkbox" id="day2" name="day2"/>
                                                    <label for="day2"> الاحد</label>
                                                </div>

                                                <div>
                                                    <input type="checkbox" id="day1" name="day1"/>
                                                    <label for="day1">  السبت </label>
                                                </div>

                                                <div>
                                                    <input type="checkbox" id="day3" name="day3"/>
                                                    <label for="day3">الاثنين</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" id="day4" name="day4"/>
                                                    <label for="day4">الثلاثاء</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" id="vac" name="vac"/>
                                                    <label for="vac">أيام الاجازات الرسمية</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="u-s-m-b-15">

                                            <button class="btn btn--e-transparent-brand-b-2" type="submit">CREATE</button></div>

                                        <a class="gl-link" href="{{route('home')}}">Return to Store</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 2 ======-->
    </div>
    <!--====== End - App Content ======-->
@endsection
