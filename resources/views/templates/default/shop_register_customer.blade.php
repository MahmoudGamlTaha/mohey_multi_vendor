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
                <form action="{{route('newCustomer')}}" method="post" enctype="multipart/form-data" novalidate="novalidate">
                {!! csrf_field() !!}
                  <div class="col-sm-12">

                    <h3 style="text-align: center;color:#F68C31;">{{ trans('language.registerCustomer') }}</h3>
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
                    <div class="col-sm-6 form-group" >
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
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="sector">علامة مميزة</label> <span style="color:red;">*</span>
                      <input type="text" id="sector" name="data[sector]" required="required" class="form-control{{ $errors->has('sector') ? ' is-invalid' : '' }}"
                             value="{{ old('data.sector') }}" autofocus>
                      @if ($errors->has('sector'))
                          <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('sector') }}
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="address">العنوان </label> <span style="color:red;">*</span>
                      <input type="text" id="address" name="data[address]" required="required" class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}"
                             value="{{ old('data.address') }}" autofocus>
                      @if ($errors->has('address'))
                          <span class="invalid-feedback" style="color: red" role="alert">
                            {{ $errors->first('address') }}
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label"  for="marketname">اسم الشركة</label> <span style="color:#ff0000;"></span>
                      <input type="text" id="marketname" name="data[marketname]" disabled class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companycode">كود الشركة</label> <span style="color:red;">*</span>
                      <input type="text" id="regcompanycode"  onblur='checkCode()' name="data[companycode]" required="required" class="form-control{{ $errors->has('companycode') ? ' is-invalid' : '' }}"
                              value="{{ old('data.companycode') }}" autofocus>
                      @if ($errors->has('companycode'))
                          <span class="invalid-feedback" style="color: red"  role="alert">
                            {{ $errors->first('companycode') }}
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group" >
                  <a data-toggle="collapse" style="color:red" hidden id="regcoButton"  href="#companyDetails" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">الشركة غير مسجلة قم بتسجيل الشركة </a>
                  </div>
                  <div class="col-sm-6 form-group" >
                      &nbsp;
                  </div>
                  <div class="collapse multi-collapse"  id="companyDetails">
                      <div class="card card-body">
                   
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="authMobile">رقم موبايل مسؤل التعاقد</label> <span style="color:red;">*</span>
                      <input type="tel" id="authMobile"  name="data[authMobile]"  class="form-control{{ $errors->has('authMobile') ? ' is-invalid' : '' }}"
                             value="{{ old('data.authMobile') }}" autofocus>
                      @if ($errors->has('authMobile'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('authMobile') }}.</strong>
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="owner">اسم مسؤل التعاقد</label> <span style="color:red;">*</span>
                      <input type="text" id="owner" name="data[owner]"  class="form-control{{ $errors->has('owner') ? ' is-invalid' : '' }}"
                              value="{{ old('data.owner') }}" autofocus>
                      @if ($errors->has('owner'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('owner') }}.</strong>
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="authNumberIn">الرقم الداخلي</label> 
                      <input type="tel" id="authNumberIn"  name="data[authNumberin]"  class="form-control{{ $errors->has('authNumberin') ? ' is-invalid' : '' }}"
                              value="{{ old('data.authNumberin') }}" autofocus>
                      @if ($errors->has('authNumberin'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('authNumberin') }}.</strong>
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="phone">الرقم الارضي</label>
                      <input type="tel" id="phone"  name="data[phone]" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}"
                              value="{{ old('data.phone') }}" autofocus>
                      @if ($errors->has('phone'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('phone') }}.</strong>
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="authAddress">عنوان الشركة </label> <span style="color:red;">*</span>
                      <input type="text" id="authAddress"  name="data[authAddress]"  class="form-control{{ $errors->has('authAddress') ? ' is-invalid' : '' }}"
                              value="{{ old('data.authAddress') }}" autofocus>
                      @if ($errors->has('authAddress'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('authAddress') }}.</strong>
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companyname">اسم الشركة</label> <span style="color:red;">*</span>
                      <input type="text" id="companyname" name="data[companyname]"  class="form-control{{ $errors->has('companyname') ? ' is-invalid' : '' }}"
                             value="{{ old('data.companyname') }}" autofocus>
                      @if ($errors->has('companyname'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('companyname') }}.</strong>
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="authdepartment">رقم الشقة</label> <span style="color:red;">*</span>
                      <input type="text" id="authdepartment" name="data[department]"  class="form-control{{ $errors->has('authdepartment') ? ' is-invalid' : '' }}"
                             value="{{ old('authdepartment') }}" autofocus>
                      @if ($errors->has('authdepartment'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('authdepartment') }}.</strong>
                          </span>
                      @endif
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="authfloorNum">رقم الدور</label> <span style="color:red;">*</span>
                      <input type="text" id="authfloorNum" name="data[floorNum]"  class="form-control{{ $errors->has('authfloorNum') ? ' is-invalid' : '' }}"
                              value="{{ old('authfloorNum') }}" autofocus>
                      @if ($errors->has('authfloorNum'))
                          <span class="invalid feedback"role="alert">
                            <strong>{{ $errors->first('authfloorNum') }}.</strong>
                          </span>
                      @endif
                  </div>
                    </div>
                    </div>
                    <br/>
                    <br/>
                    <button class="btn form-control btn-yellow-white" style="margin-bottom: 30px;">إنشاء حساب</button>
                </form>
              </div>
            </div>
        </div>
    </section>
@endsection
