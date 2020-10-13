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
            <img src="{{ asset($theme_asset.'/images/home/googleplay.png') }}" style="width:100px;height:50px;" alt="googleplay"/>
            <img src="{{ asset($theme_asset.'/images/home/appstore.png') }}" style="width:100px;height:50px;" alt="appstore"/>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="single-widget">
              <h2>{{ trans('language.subscribe.title') }}</h2>
              <form action="{{ route('subscribe') }}" method="post" class="searchform">
                @csrf
                <p>{{ trans('language.subscribe.subscribe_des') }}</p>
                <input type="email" name="subscribe_email" placeholder="{{ trans('language.subscribe.subscribe_email') }}">
                <button value="male" class="btn btn-default">ذكر</button> &nbsp;
                <button value="female" class="btn btn-default">انثى</button>
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
          <div class="col-sm-4">

          </div>
          <div class="col-sm-2">
            <div class="single-widget">
              <h2> بيع على دكانى</h2>
              <a href="">كن بائعا معنا</>
            </div>
          </div>
          <div class="col-sm-2">
            <div class="single-widget">
              <h2>من نحن</h2>
              <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">من</a></li>
                    <li><a href="#">انضم الى دكانى</a></li>
                    <li><a href="#">الشروط والاحكام</a></li>
                    <li><a href="#">سياسة الخصوصية</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-2">
            <div class="single-widget">
              <h2>خدمة العملاء</h2>
              <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">مركز المساعدة</a></li>
                    <li><a href="#">اتصل بنا</a></li>
                    <li><a href="#">كيفية عمل طلب شراء</a></li>
                    <li><a href="#">سياسة الارجاع والاسترداد النقدى</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-2">
            &nbsp;
          </div>
          <div class="col-sm-6">
            &nbsp;
          </div>
          <div class="col-sm-2">
            <div class="single-widget">
              <h2>تواصل معنا</h2>
              <ul class="nav nav-pills nav-stacked">
                <li><a href="#">{{ trans('language.shop_info.address') }}: {{ $configsGlobal['address'] }}</a></li>
                <li><a href="#">{{ trans('language.shop_info.hotline') }}: {{ $configsGlobal['long_phone'] }}</a></li>
                <li><a href="#">{{ trans('language.shop_info.email') }}: {{ $configsGlobal['email'] }}</a></li>
            </ul>
            </div>
          </div>
          <div class="col-sm-2">
            <div class="single-widget">
              <h2>تابعونا على</h2>
              <img src="{{ asset($theme_asset.'/images/home/instagram.jpg') }}" style="width:30px;height:30px;" alt="instagram"/>
              <img src="{{ asset($theme_asset.'/images/home/youtube.png') }}" style="width:30px;height:30px;"alt="youtube"/>
              <img src="{{ asset($theme_asset.'/images/home/facebook.png') }}" style="width:30px;height:30px;" alt="facebook"/>

            </div>
          </div>
          <div class="col-sm-2">
            &nbsp;
          </div>

        </div>
      </div>
    </div>

    <div class="footer-bottom">
      <div class="container">
        <div class="row">
          <p class="pull-left">Copyright © 2019 <a href="{{ config('scart.homepage') }}">{{ config('scart.name') }} {{ config('scart.version') }}</a> Inc. All rights reserved.</p>
          <p class="pull-right">Hosted by  <span><a target="_blank" href="https://highcoder.com">highcoder</a></span></p>
        </div>
      </div>
    </div>
  </footer>
<!--//Footer-->
