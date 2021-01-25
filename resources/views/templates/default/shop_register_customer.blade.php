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
                                <h1 class="section__heading u-c-secondary">{{ trans('language.registerCustomer') }}</h1>
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
                                    <form class="l-f-o__form" action="{{route('newCustomer')}}" method="post" enctype="multipart/form-data" novalidate="novalidate">
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
                                                <label class="gl-label" for="sector">علامة مميزة</label>
                                                <input type="text" id="sector" name="data[sector]" required="required" class="input-text input-text--primary-style {{ $errors->has('sector') ? ' is-invalid' : '' }}"
                                                       value="{{ old('data.sector') }}" autofocus>
                                                @if ($errors->has('sector'))
                                                    <span class="invalid-feedback" style="color: red" role="alert">
                                                {{ $errors->first('sector') }}
                                              </span>
                                                @endif
                                            </div>
                                            <div class="u-s-m-b-30">
                                                <label class="gl-label" for="address">العنوان</label>
                                                <input type="text" id="address" name="data[address]" required="required" class="input-text input-text--primary-style {{ $errors->has('address') ? ' is-invalid' : '' }}"
                                                       value="{{ old('data.address') }}" autofocus>
                                                @if ($errors->has('address'))
                                                    <span class="invalid-feedback" style="color: red" role="alert">
                                                    {{ $errors->first('address') }}
                                                  </span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="gl-inline">
                                            <div class="u-s-m-b-30">
                                                <label class="gl-label"  for="marketname">اسم الشركة</label>
                                                <input type="text" id="marketname" name="data[marketname]" disabled class="input-text input-text--primary-style" >
                                            </div>
                                            <div class="u-s-m-b-30">
                                                <label class="gl-label" for="companycode">كود الشركة</label>
                                                <input type="text" id="regcompanycode"  onblur='checkCode()' name="data[companycode]" required="required" class="input-text input-text--primary-style {{ $errors->has('companycode') ? ' is-invalid' : '' }}"
                                                       value="{{ old('data.companycode') }}" autofocus>
                                                @if ($errors->has('companycode'))
                                                    <span class="invalid-feedback" style="color: red"  role="alert">
                                                        {{ $errors->first('companycode') }}
                                                      </span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <a data-toggle="collapse" style="color:red" hidden id="regcoButton"  href="#companyDetails" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">الشركة غير مسجلة قم بتسجيل الشركة </a>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            &nbsp;
                                        </div>
                                        <div class="collapse multi-collapse"  id="companyDetails">
                                            <div class="card card-body">

                                                <div class="u-s-m-b-30">
                                                    <label class="gl-label" for="authMobile">رقم موبايل مسؤل التعاقد</label>
                                                    <input type="tel" id="authMobile"  name="data[authMobile]"  class="input-text input-text--primary-style {{ $errors->has('authMobile') ? ' is-invalid' : '' }}"
                                                           value="{{ old('data.authMobile') }}" autofocus>
                                                    @if ($errors->has('authMobile'))
                                                        <span class="invalid feedback"role="alert">
                                                            <strong>{{ $errors->first('authMobile') }}.</strong>
                                                          </span>
                                                    @endif
                                                </div>
                                                <div class="u-s-m-b-30">
                                                    <label class="gl-label" for="owner">اسم مسؤل التعاقد</label>
                                                    <input type="text" id="owner" name="data[owner]"  class="input-text input-text--primary-style {{ $errors->has('owner') ? ' is-invalid' : '' }}"
                                                           value="{{ old('data.owner') }}" autofocus>
                                                    @if ($errors->has('owner'))
                                                        <span class="invalid feedback"role="alert">
                                                            <strong>{{ $errors->first('owner') }}.</strong>
                                                          </span>
                                                    @endif
                                                </div>
                                                <div class="u-s-m-b-30">
                                                    <label class="gl-label" for="authNumberIn">الرقم الداخلي</label>
                                                    <input type="tel" id="authNumberIn"  name="data[authNumberin]"  class="input-text input-text--primary-style {{ $errors->has('authNumberin') ? ' is-invalid' : '' }}"
                                                           value="{{ old('data.authNumberin') }}" autofocus>
                                                    @if ($errors->has('authNumberin'))
                                                        <span class="invalid feedback"role="alert">
                                                            <strong>{{ $errors->first('authNumberin') }}.</strong>
                                                          </span>
                                                    @endif
                                                </div>
                                                <div class="u-s-m-b-30">
                                                    <label class="gl-label" for="phone">الرقم الارضي</label>
                                                    <input type="tel" id="phone"  name="data[phone]" class="input-text input-text--primary-style {{ $errors->has('phone') ? ' is-invalid' : '' }}"
                                                           value="{{ old('data.phone') }}" autofocus>
                                                    @if ($errors->has('phone'))
                                                        <span class="invalid feedback"role="alert">
                                                            <strong>{{ $errors->first('phone') }}.</strong>
                                                          </span>
                                                    @endif
                                                </div>
                                                <div class="u-s-m-b-30">
                                                    <label class="gl-label" for="authAddress">عنوان الشركة </label>
                                                    <input type="text" id="authAddress"  name="data[authAddress]"  class="input-text input-text--primary-style {{ $errors->has('authAddress') ? ' is-invalid' : '' }}"
                                                           value="{{ old('data.authAddress') }}" autofocus>
                                                    @if ($errors->has('authAddress'))
                                                        <span class="invalid feedback"role="alert">
                                                            <strong>{{ $errors->first('authAddress') }}.</strong>
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
                                                    <label class="gl-label" for="authdepartment">رقم الشقة</label>
                                                    <input type="text" id="authdepartment" name="data[department]"  class="input-text input-text--primary-style {{ $errors->has('authdepartment') ? ' is-invalid' : '' }}"
                                                           value="{{ old('authdepartment') }}" autofocus>
                                                    @if ($errors->has('authdepartment'))
                                                        <span class="invalid feedback"role="alert">
                                                            <strong>{{ $errors->first('authdepartment') }}.</strong>
                                                          </span>
                                                    @endif
                                                </div>
                                                <div class="u-s-m-b-30">
                                                    <label class="gl-label" for="authfloorNum">رقم الدور</label>
                                                    <input type="text" id="authfloorNum" name="data[floorNum]"  class="input-text input-text--primary-style {{ $errors->has('authfloorNum') ? ' is-invalid' : '' }}"
                                                           value="{{ old('authfloorNum') }}" autofocus>
                                                    @if ($errors->has('authfloorNum'))
                                                        <span class="invalid feedback"role="alert">
                                                            <strong>{{ $errors->first('authfloorNum') }}.</strong>
                                                          </span>
                                                    @endif
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