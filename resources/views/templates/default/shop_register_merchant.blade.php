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
                <form action="{{route('newMerchant')}}" method="post" enctype="multipart/form-data">
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
                      <input type="text" id="username" name="data[email]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="userpassc">تأكيد كلمة المرور</label> <span style="color:red;">*</span>
                      <input type="password" id="userpassc" name="data[password]" required="required" class="form-control">
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="userpass">كلمة المرور</label> <span style="color:red;">*</span>
                      <input type="password" id="userpass" name="data[passwordConfirmed]" required="required" class="form-control">
                  </div>
                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="marketname">اسم المتجر</label> <span style="color:red;">*</span>
                      <input type="text" id="marketname" name="data[marketname]" required="required" class="form-control" >
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
                  </div>
                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="address">عنوان المتجر</label> <span style="color:red;">*</span>
                      <input type="text" id="address" name="data[address]" required="required" class="form-control" >
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
                      <label class="control-label" for="commercerecord">السجل التجارى</label> <span style="color:red;">*</span>
                      <input type="file" id="commercerecordimg" name="data[commercerecordimg]" required="required" class="form-control" accept="image/*">
                  </div>
                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="taxcard">البطاقة الضريبية</label> <span style="color:red;">*</span>
                      <input type="file" id="taxcard" name="data[taxcard]" required="required" class="form-control" accept="image/*">
                  </div>
                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="extrataxcard">بطاقة الضريبة المضافة</label> <span style="color:red;"></span>
                      <input type="file" id="extrataxcard" name="data[extrataxcard]"   class="form-control" accept="image/*">
                  </div>

                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="bankbranch">اسم الفرع</label> <span style="color:red;">*</span>
                      <input type="text" id="bankbranch" name="data[bankbranch]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="bank">اسم البنك</label> <span style="color:red;">*</span>
                      <input type="text" id="bank" name="data[bank]" required="required" class="form-control" >
                  </div>


                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="bankid">رقم الحساب البنكى</label> <span style="color:red;">*</span>
                      <input type="text" id="bankid" name="data[bankid]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-12 form-group">
                      <label class="control-label" for="floor">اسم المستفيد</label> <span style="color:red;">*</span>
                      <input type="text" id="floor" name="data[floor]" required="required" class="form-control" >
                  </div>

                  <div class="col-sm-12 form-group">
                    <br/>
                    <br/>
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companyname">اسم الشركة</label> <span style="color:red;">*</span>
                      <input type="text" id="companyname" name="data[companyname]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companycode">كود الشركة</label> <span style="color:red;">*</span>
                      <input type="text" id="companycode" name="data[companycode]" required="required" class="form-control" >
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
                  <div class="col-sm-5 form-group" style="padding:0px;">
                    <h3 style="text-align:center;">أختر ايام العطلة<span style="color:red;">*</span></h3>
                    <label style="text-align:center;width:100%;">أيام الاسبوع</label>

                    <div class="col-sm-6 form-group"style="padding:0px;">
                      <input type="checkbox" id="day1" name="day1"/>
                      <label for="day1">السبت</label>
                    </div>
                    <div class="col-sm-6 form-group" style="padding:0px;">
                      <input type="checkbox" id="day2" name="day2"/>
                      <label for="day2">الاحد</label>
                    </div>
                    <div class="col-sm-6 form-group"style="padding:0px;">
                      <input type="checkbox" id="day3" name="day3"/>
                      <label for="day3">الاثنين</label>
                    </div>
                    <div class="col-sm-6 form-group"style="padding:0px;">
                      <input type="checkbox" id="day4" name="day4"/>
                      <label for="day2">الثلاثاء</label>
                    </div>
                    <div class="col-sm-6 form-group"style="padding:0px;">
                      <input type="checkbox" id="day5" name="day5"/>
                      <label for="day5">الاربعاء</label>
                    </div>
                    <div class="col-sm-6 form-group"style="padding:0px;">
                      <input type="checkbox" id="day6" name="day6"/>
                      <label for="day6">الخميس</label>
                    </div>
                    <div class="col-sm-6 form-group"style="padding:0px;">
                      <input type="checkbox" id="day7" name="day7"/>
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
