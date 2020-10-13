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
                <form action="post" >
                  {!! csrf_field() !!}
                  <div class="col-sm-12">

                    <h3 style="text-align: center;color:#F68C31;">{{ trans('language.registerMerchant.account') }}</h3>
                    <br/>
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="familyname">{{ trans('language.registerMerchant.last_name') }}</label> <span style="color:red;">*</span>
                      <input type="text" id="familyname" name="data[familyname]" required="required" class="form-control">
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="firstname">الاسم الاول</label> <span style="color:red;">*</span>
                      <input type="text" id="firstname" name="data[firstname]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="username">البريد الالكترونى</label> <span style="color:red;">*</span>
                      <input type="text" id="username" name="data[username]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="userpassc">تأكيد كلمة المرور</label> <span style="color:red;">*</span>
                      <input type="password" id="userpassc" name="data[userpassc]" required="required" class="form-control">
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="userpass">كلمة المرور</label> <span style="color:red;">*</span>
                      <input type="password" id="userpass" name="data[userpass]" required="required" class="form-control">
                  </div>
                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="mobile">رقم الموبايل</label> <span style="color:red;">*</span>
                      <input type="text" id="mobile" name="data[mobile]" required="required" class="form-control" >
                  </div>
                <div class="col-sm-12 form-group">
                    <label class="control-label" for="phone">رقم الهاتف</label> <span style="color:red;">*</span>
                    <input type="text" id="phone" name="data[phone]" required="required" class="form-control" >
                </div>

                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="sector">رقم الحى</label> <span style="color:red;">*</span>
                      <input type="text" id="sector" name="data[sector]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="gov">المحافظة</label> <span style="color:red;">*</span>
                      <input type="text" id="gov" name="data[gov]" required="required" class="form-control" >
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
