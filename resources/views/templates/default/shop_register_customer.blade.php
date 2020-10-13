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
                <form action="{{route('newCustomer')}}" method="post" enctype="multipart/form-data">
                {!! csrf_field() !!}
                  <div class="col-sm-12">

                    <h3 style="text-align: center;color:#F68C31;">{{ trans('language.registerCustomer') }}</h3>
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
                      <label class="control-label" for="mobile">رقم الموبايل</label> <span style="color:red;">*</span>
                      <input type="text" id="mobile" name="data[mobile]" required="required" class="form-control" >
                  </div>
                <div class="col-sm-12 form-group">
                    <label class="control-label" for="phone">رقم الهاتف</label> <span style="color:red;">*</span>
                    <input type="text" id="phone" name="data[phone]" required="required" class="form-control" >
                </div>
                  <div class="col-sm-6 form-group">
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="gov">المحافظة</label> <span style="color:red;">*</span>
                      <input type="text" id="gov" name="data[gov]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="sector">علامة مميزة</label> <span style="color:red;">*</span>
                      <input type="text" id="sector" name="data[sector]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="address">العنوان </label> <span style="color:red;">*</span>
                      <input type="text" id="address" name="data[address]" required="required" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label"  for="companyname">اسم الشركة</label> <span style="color:red;"></span>
                      <input type="text" id="marketname" name="data[marketname]" disabled class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companycode">كود الشركة</label> <span style="color:red;">*</span>
                      <input type="text" id="regcompanycode"  onblur='checkCode()' name="data[companycode]" required="required" class="form-control" >
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
                      <label class="control-label" for="companycode">رقم موبايل مسؤل التعاقد</label> <span style="color:red;">*</span>
                      <input type="tel"  name="data[authMobile]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companyname">اسم مسؤل التعاقد</label> <span style="color:red;">*</span>
                      <input type="text" id="authname" name="data[authName]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="authNumberIn">الرقم الداخلي</label> 
                      <input type="tel"  name="data[authNumberin]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companycode">الرقم الارضي</label> 
                      <input type="tel"  name="data[authLandNumber]" class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="gov">المحافظة</label> <span style="color:red;">*</span>
                      <input type="text" id="authgov" name="data[gov]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="sector">علامة مميزة</label> <span style="color:red;">*</span>
                      <input type="text" id="authSector"  name="data[authSector]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="address">عنوان الشركة </label> <span style="color:red;">*</span>
                      <input type="text" id="auttAddress"  name="data[auttAddress]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companyname">اسم الشركة</label> <span style="color:red;">*</span>
                      <input type="text" id="authcompanyname" name="data[authcompanyname]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companyname">رقم الشقة</label> <span style="color:red;">*</span>
                      <input type="text" id="authdepartment" name="data[department]"  class="form-control" >
                  </div>
                  <div class="col-sm-6 form-group">
                      <label class="control-label" for="companycode">رقم الدور</label> <span style="color:red;">*</span>
                      <input type="text" id="authfloorNum" name="data[floorNum]"  class="form-control" >
                  </div>
                    </div>
                  </div>
                  <br/>
<br/>
                </div>
                <div class="col-md-12">
                      <br/>
                 </div>
                   <div class="col-md-12">
                      <button class="btn form-control btn-yellow-white">إنشاء حساب</button>
                      <br/>
                 </div>
                 <div class="col-md-12">
                      <br/>
                 </div>
                    
                </form>
              </div>
            </div>
        </div>
        
    </section><!--/form-->
   
@endsection
