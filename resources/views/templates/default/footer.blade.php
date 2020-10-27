<!--Footer-->

<!--Module top footer -->
  @isset ($layouts['footer'])
      @foreach ( $layouts['footer']  as $layout)
        @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
          @if ($layout->type =='html')
            {!! $layout->text !!}
          @elseif($layout->type =='view')
            @if (view()->exists('blockView.'.$layout->text))
             @include('blockView.'.$layout->text)
            @endif
          @elseif($layout->type =='module')
            {!! (new $layout->text)->render() !!}
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module top footer -->

  <footer id="footer"><!--Footer-->
    <div class="footer-widget" style="background-color:#282828">
      <div class="container">
        <div class="row" >

          <div class="col-sm-4">
            <div class="single-widget">
            <h2>لتنزيل تطبيق دكانى</h2>
            <p>احصل على العديد من العروض الحصرية</p>
            <img src="{{ asset($theme_asset.'/images/home/googleplay.png') }}" style="width:auto;height:50px;" alt="googleplay"/>
            <img src="{{ asset($theme_asset.'/images/home/appstore.png') }}" style="width:auto;height:50px;" alt="appstore"/>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="single-widget">
              <h2>{{ trans('language.subscribe.title') }}</h2>
              <form action="{{ route('subscribe') }}" method="post" class="searchform">
                @csrf
                <p>{{ trans('language.subscribe.subscribe_des') }}</p>
                <div>
                  <span id="icon-mail" class="fa fa-envelope-o" ></span>
                  <input type="email" name="subscribe_email" placeholder="{{ trans('language.subscribe.subscribe_email') }}"> 
                  <button value="male" class="btn btn-default">ذكر</button> &nbsp;
                  <button value="female" class="btn btn-default">انثى</button>
                </div>
               
                <br/>
                <br/>
              </form>
            </div>
          </div>
          <div class="col-sm-3">

          </div>
        </div>
      </div>
    </div>
    <div class="footer-widget" style="background-color:#323232;">
      <div class="container">
        <div class="row">
          <div class="col-sm-1">
          </div>
          <div class="col-sm-3">
            <div class="single-widget">
              <h3 style="color: white"> بيع على دكانى</h3>
              <a href="" style="font-size: 18px;">كن بائعا معنا</>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="single-widget">
              <h3 style="color: white"> من نحن</h3>
              <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">من</a></li>
                    <li><a href="#">انضم الى دكانى</a></li>
                    <li><a href="#">الشروط والاحكام</a></li>
                    <li><a href="#">سياسة الخصوصية</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="single-widget">
              <h3 style="color: white"> خدمة العملاء</h3>
              <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">مركز المساعدة</a></li>
                    <li><a href="#">اتصل بنا</a></li>
                    <li><a href="#">كيفية عمل طلب شراء</a></li>
                    <li><a href="#">سياسة الارجاع والاسترداد النقدى</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-1">
          </div>
        </div>
<hr  style="margin-top: 20px; margin-bottom: 0px; border: 0; border-top: 1px solid #908a8a;">
      <div class="row">
          <div class="col-sm-1">
          </div>
          <div class="col-sm-6">
            <div class="single-widget">
              <h2>تواصل معنا</h2>
              <ul class="nav nav-pills nav-stacked contact">
                <li><i class="fa fa-map-marker"></i><a href="#">{{ trans('language.shop_info.address') }}: {{ $configsGlobal['address'] }}</a></li>
                <li><i class="fa fa-phone"></i><a href="#">{{ trans('language.shop_info.hotline') }}: {{ $configsGlobal['long_phone'] }}</a></li>
                <li><i class="fa fa-envelope-o"></i><a href="#">{{ trans('language.shop_info.email') }}: {{ $configsGlobal['email'] }}</a></li>
            </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="single-widget">
              <h2>تابعونا على</h2>
              <img src="{{ asset($theme_asset.'/images/home/instagram.png') }}" style="width:45px;" alt="instagram"/>
              <img src="{{ asset($theme_asset.'/images/home/youtube.png') }}" style="width:30px;"alt="youtube"/>
              <img src="{{ asset($theme_asset.'/images/home/facebook.png') }}" style="width:30px;margin-right: 10px;" alt="facebook"/>

            </div>
          </div>

        </div><br>
      </div>
    </div>

    <div class="footer-bottom" style="background-color: #10243f">
      <div class="container">
        <div class="row">
          <p class="pull-left"> Copyright © 2019 
            <a href="{{ config('scart.homepage') }}" style="color: #f69620;">{{ config('scart.name') }} {{ config('scart.version') }}</a> 
            Inc. All rights reserved</p>
          <p class="pull-right">Hosted by  <span><a target="_blank" href="https://highcoder.com" >highcoder</a></span></p>
        </div>
      </div>
    </div>
  </footer>
<!--//Footer-->
