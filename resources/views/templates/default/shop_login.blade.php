@extends($theme.'.shop_layout')

@section('main')

    <section id="form-login"><!--form-->
        <div class="container">
            <div class="row">
              <div class="col-sm-1">
              </div>
              <div class="col-sm-5">
                <br/>
                <h3>حساب البائع</h3>
                <span>لتتمكن من البدء فى البيع اليوم- قم بإنشاء حساب البيع الخاص بك</span>
                <br/>
                <br/>
                <a href="{{ route('registermerchant')}}" class="btn btn-yellow-white">تسجيل حساب البائع</a>
                <br/>
                <br/>
              </div>
              <div class="col-sm-5" style="background: #f9f8f8;padding: 15px; border-radius: 10px;">
                <form action="{{ route('postLogin')}}" method="post">
                  @csrf
                  <h4>تسجيل الدخول</h4>
                  <div class="form-group">
                      <label class="control-label" for="username">اسم المستخدم او البريد الالكترونى</label> <span style="color:red;">*</span>
                      <input type="text" id="username" name="username" required="required" class="form-control" placeholder="اسم المستخدم او البريد الالكترونى">
                  </div>
                  <div class="form-group">
                      <label class="control-label" for="username">كلمة المرور</label> <span style="color:red;">*</span><a href="">نسيت كلمة المرور؟</a>
                      <input type="password" id="password" name="password" required="required" class="form-control" placeholder="كلمة المرور">
                  </div>
                      <button class="btn btn-blue-white">تسجيل الدخول</button>
                      <a class="btn btn-blue-white" href="{{ route('routeCustomer') }}">إنشاء حساب جديد</a>
                      <input type="checkbox" id="rememberme" name="rememberme" value="1"/>
                      <label for="rememberme">تذكرنى</label>
                      <br/>
                      <br/>
                </form>
              </div>
            </div>
        </div>
    </section><!--/form-->

    <br><br><br>
@endsection
