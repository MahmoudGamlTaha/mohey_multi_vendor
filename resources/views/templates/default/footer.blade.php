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
              <h4 style="color: white"> بيع على دكانى</h4>
              <a href="<?php echo route('registermerchant')?>" style="font-size: 18px;">كن بائعا معنا</a>
            </div>
          </div>
          @php
            $lang = App\Models\Language::where('code', app()->getLocale())->first();
            $columns = \App\Models\ShopPageDescription::where('lang_id', $lang->id)->get();
          @endphp
          <div class="col-sm-3">
            <div class="single-widget">
              <h4 style="color: white">{{trans('language.aboutUs')}}</h4>
              <ul class="nav nav-pills nav-stacked">
                @for($i = 0; $i < 3; $i++)
                    <li><a href="{{$columns[$i]['keyword'].'.html'}}">{{$columns[$i]['title']}}</a></li>
                @endfor
                <li><a href="/login">{{trans('language.joinUs')}}</a>
              </ul>
            </div>
          </div>
          @if($columns->count() > 4)
          <div class="col-sm-3">
            <div class="single-widget">
              <h4 style="color: white">{{trans('language.clientService')}}</h4>
              <ul class="nav nav-pills nav-stacked">
            @for($i = 3; $i < $columns->count(); $i++)
                    <li><a href="{{$columns[$i]['keyword'].'.html'}}">{{$columns[$i]['title']}}</a></li>
            @endfor
                </ul>
            </div>
          </div>
          @endif
          <div class="col-sm-1">
          </div>
        </div>
<hr  style="margin-top: 20px; margin-bottom: 0px; border: 0; border-top: 1px solid #908a8a;">
      <div class="row">
          <div class="col-sm-1">
          </div>
          <div class="col-sm-6">
            <div class="single-widget">
              <h2 style="font-size: 20px">تواصل معنا</h2>
              @php
                $contacts = \App\Models\ContactUs::all();
              @endphp
              <ul class="nav nav-pills nav-stacked contact">
              @foreach($contacts as $contact)
                  <li><a href="#">{{trans('language.admin.'.$contact->name)}} : {{ $contact->value }}</a></li>
              @endforeach
            </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="single-widget">
              <h2 style="font-size: 20px">تابعونا على</h2>
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
