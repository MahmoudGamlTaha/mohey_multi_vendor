  <style>
  @import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);

.navbar-nav>li>.dropdown-menu {
  margin-top: 20px;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
}
.navbar-default .navbar-nav>li>a {
  font-weight: bold;
}

.mega-dropdown {
  position: static !important;
}

.mega-dropdown-menu {
  padding: 20px 0px;
  width: 100%;
  box-shadow: none;
  -webkit-box-shadow: none;
}

.mega-dropdown-menu:before {
  content: "";
  border-bottom: 15px solid #fff;
  border-right: 17px solid transparent;
  border-left: 17px solid transparent;
  position: absolute;
  top: -15px;
  right: 10%;
  z-index: 10;
}

.mega-dropdown-menu:after {
  content: "";
  border-bottom: 17px solid #ccc;
  border-right: 19px solid transparent;
  border-left: 19px solid transparent;
  position: absolute;
  top: -17px;
  right: 10%;
  z-index: 8;
}

.mega-dropdown-menu > li > ul {
  padding: 0;
  margin: 0;
}

.mega-dropdown-menu > li > ul > li {
  list-style: none;
}

.mega-dropdown-menu > li > ul > li > a {
  display: block;
  padding: 3px 20px;
  clear: both;
  font-weight: normal;
  line-height: 1.428571429;
  color: #999;
  white-space: normal;
}

.mega-dropdown-menu > li ul > li > a:hover,
.mega-dropdown-menu > li ul > li > a:focus {
  text-decoration: none;
  color: #444;
  background-color: #f5f5f5;
}
.top-head-backcolor{
  background: none repeat scroll 0 0 black !important;
}
.top-head-forecolor{
  color: white !important;
}
.has-search {
  position: relative;
  width: 100% !important;
  padding-left: 2.375rem;
  left: 54%;
  top:-30px;
  margin-bottom: -60px;
}
.radius22{
  border-radius: 22px !important;
}
.zindex2{
  position: relative;
  z-index: 2;
  right: 88%;
  top:-36px;
  margin-top: 2px;
  background-color: #ffb52ce6;
  border-bottom-left-radius: 22px !important;
  border-top-left-radius: 22px !important;
  width: 12%;
  text-align: center;
}
.mega-dropdown-menu .dropdown-header {
  color: #428bca;
  font-size: 18px;
  font-weight: bold;
}

.mega-dropdown-menu form {
  margin: 3px 20px;
}

.mega-dropdown-menu .form-group {
  margin-bottom: 3px;
}
.topbar
{
    background-color: #10243F;
}

  </style>

  <header id="header"><!--header-->
    <div class="first_header">
      <div class="container" >
      <div class="row">
        {{-- <div class="col-sm-6">
          <div class="social">
            <a class="twitter" href="#" title="twitter"> <span class="fa fa-twitter"><span></a>
            <a class="google"  href="#" title="google"> <span class="fa fa-google-plus"><span></a>
            <a class="youtube"  href="#" title="youtube"> <span class="fa fa-youtube"><span></a>
            <a class="facebook" href="#" title="facebook"> <span class="fa fa-facebook"><span></a>
          </div>
        </div> --}}
        {{-- <div class="col-sm-6" id="lang">
            <div class="btn-group pull-right">
              <div class="btn-group locale">
                @if (count($languages)>1)
                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                  <span class="caret" style="margin-left: 3px" ></span>
                  <span>Arabic  <span>
                    <img src="{{ asset($path_file.'/'.$languages[app()->getLocale()]['icon']) }}" style="height: 12px; margin: 5px;">
                </button>
                <ul class="dropdown-menu">
                  @foreach ($languages as $key => $language)
                    <li><a href="{{ url('locale/'.$key) }}">
                      <span>{{$key}} <span>
                        <img src="{{ asset($path_file.'/'.$language['icon']) }}" style="height: 12px; margin: 5px;"></a></li>
                  @endforeach
                </ul>
                @endif
              </div>
              @if (count($currencies)>1)
               <div class="btn-group locale">
                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                  <span class="caret"></span>
                  {{ \Helper::getCurrency()['name'] }}
                </button>
                <ul class="dropdown-menu">
                  @foreach ($currencies as $key => $currency)
                    <li><a href="{{ url('currency/'.$currency->code) }}">{{ $currency->name }}</a></li>
                  @endforeach
                </ul>
              </div>
              @endif
            </div>


        </div> --}}
      </div>
      </div>
    </div>

    <div class="header_top topbar" style="height: 50px ; padding: 10px"><!--header_top-->
      <div class="container">
        <div class="row">



          <div class="col-sm-3">
            <div class="contactinfo">
              <ul class="nav nav-pills">

                <h4 style="color: white;float: left; width:-3px">{{ "EGP " . $carts['count'] }}</h4>

                <li>
                  <a  style="margin-left: 15px" href="{{ route('cart') }}" title=" {{ trans('language.cart_title') }}">
                  <i class="fa fa-shopping-cart">
                    <span  class=" badge " id="shopping-cart" >{{ $carts['count'] }}</span>
                  </i></a>

                 </li>

                <li><a href="{{ route('wishlist') }}" title=" {{ trans('language.wishlist') }}">
                  <i class="fa fa-heart">
                    <span  class="badge" id="shopping-wishlist">{{ Cart::instance('wishlist')->count() }}</span>
                  </i>
                </a></li>


                <li><a href="{{ route('compare') }}" title="">
                  <i class="fa fa-refresh">
                  </i>
                </a></li>



              {{-- <li><a href="{{ route('wishlist') }}">
                <span  class="cart-qty shopping-wishlist top-head-forecolor" id="shopping-wishlist">{{ Cart::instance('wishlist')->count() }}</span>
                <i class="glyphicon glyphicon-heart"></i> {{ trans('language.wishlist') }}
              </a></li> --}}
            <!--  <li><a href="{{ route('compare') }}"><span  class="cart-qty shopping-compare" id="shopping-compare">{{ Cart::instance('compare')->count() }}</span><i class="fa fa-crosshairs"></i> {{ trans('language.compare') }}</a></li> -->
              {{-- <li><a href="{{ route('cart') }}"><span class="cart-qty shopping-cart" id="shopping-cart">
                {{ $carts['count'] }}</span><i class="fa fa-shopping-cart"></i> {{ trans('language.cart_title') }}</a> </li> --}}
              </ul>
            </div>
          </div>




          <div class="col-sm-6">
                  <div class="dropdown ">

                    <select class="js-example-placeholder-single js-states form-control">
                      <option></option>
                      @foreach($categoryTop as $key => $category)
                      <option>{{$category->name}}</option>
                      @endforeach
                    </select>
                          <button class="btn btn-secondary zindex" type="button" >
                              <i class="fa fa-search"></i>
                          </button>
                    </div>

          </div>



          <div class="col-sm-3">


            <div class="btn-group pull-right" style="margin-top: -10px; ">
              <div class="btn-group locale">
                @if (count($languages)>1)
                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown" style="background: #ffffff;color: #10243f;">
                  <span class="caret" style="margin-left: 3px" ></span>
                  <span>Arabic  <span>
                    <img src="{{ asset($path_file.'/'.$languages[app()->getLocale()]['icon']) }}" style="height: 12px; margin: 5px;">
                </button>
                <ul class="dropdown-menu">
                  @foreach ($languages as $key => $language)
                    <li><a href="{{ url('locale/'.$key) }}">
                      <span>{{$key}} <span>
                        <img src="{{ asset($path_file.'/'.$language['icon']) }}" style="height: 12px; margin: 5px;"></a></li>
                  @endforeach
                </ul>
                @endif
              </div>
              @if (count($currencies)>1)
               <div class="btn-group locale">
                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown"  style="background: #ffffff;color: #10243f;">
                  <span class="caret"></span>
                  {{ \Helper::getCurrency()['name'] }}
                </button>
                <ul class="dropdown-menu">
                  @foreach ($currencies as $key => $currency)
                    <li><a href="{{ url('currency/'.$currency->code) }}">{{ $currency->name }}</a></li>
                  @endforeach
                </ul>
              </div>
              @endif
            </div>

          </div>








        </div>
      </div>
    </div><!--/header_top-->
    <div class="header-middle"><!--header-middle-->
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="logo  pull-right">
              <a href="{{ route('home') }}"><img style="width: 200px;" src="{{ asset($logo) }}" alt="" /></a>
            </div>
          </div>
          <div class="col-sm-8">
            <div class="shop-menu pull-right">

              <ul class="nav navbar-nav">
             <!--   <li><a href="{{ route('compare') }}"><span  class="cart-qty shopping-compare" id="shopping-compare">{{ Cart::instance('compare')->count() }}</span><i class="fa fa-crosshairs"></i> {{ trans('language.compare') }}</a></li>
                <li><a href="{{ route('cart') }}"><span class="cart-qty shopping-cart" id="shopping-cart">{{ $carts['count'] }}</span><i class="fa fa-shopping-cart"></i> {{ trans('language.cart_title') }}</a> -->
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div><!--/header-middle-->

    <div class=""><!--header-bottom-->
      <div class="container">
  <nav class="navbar navbar-default">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" style="background-color:#10243F;" href="{{ route('home') }}">{{ trans('language.home') }}</a>
    </div>


    <div class="collapse navbar-collapse js-navbar-collapse">
      <ul class="nav navbar-nav">
      <li class="dropdown mega-dropdown">
          <a href="#" class="dropdown-toggle orange-bk" data-toggle="dropdown"  style="color:#10243f">&nbsp;{{ trans('language.all_categories') }}<span class="fa fa-bars pull-right" style="color:#10243f ; margin-top:3px"></span></a>
          <ul class="dropdown-menu mega-dropdown-menu row">
            <li class="col-sm-3">
              <ul>
                <li class="dropdown-header">New in Stores</li>

                <!-- /.carousel -->
                <li class="divider"></li>
                <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
              </ul>
            </li>
			 @foreach($categoryTop as $key => $category)
			 <li class="col-sm-3">
			   <ul>
           <li class="dropdown-header">{{$category->name}}</li>
           @if (!empty($categoryList[$category->id]))
				     @foreach($categoryList[$category->id] as $child)
                        <li> <a href="{{$child->getUrl()}}">{{$child->name}}</a></li>
                        @endforeach
            @endif
				 </ul>
						</li>
                        @endforeach

            <li class="col-sm-3">
              <ul>
                <li class="dropdown-header">Other</li>
                <li><a href="{{ route('products') }}">{{ trans('language.all_product') }}</a></li>
                 <!--       <li><a href="{{ route('cart') }}">{{ trans('language.cart_title') }}</a></li>-->
                        <li><a href="{{ route('brands') }}">{{ trans('language.brands') }}</a></li>

              </ul>
            </li>
                    </ul>
        </li>

      <li class="dropdown">
		<a href="{{ route('categories') }}">{{ trans('language.categories2') }}</a>
		</li>
      <!--   <li class="dropdown"><a href="{{ route('compare') }}">{{ trans('language.compare') }}</a></li> -->
         @guest
                <li><a href="{{ route('login') }}"><i class="fa fa-lock"></i> {{ trans('language.login') }}</a></li>
                @else
                <li><a href="{{ route('profilePage') }}"><i class="fa fa-user"></i> {{ trans('language.account') }}</a></li>
                <li><a href="{{ route('logout') }}" rel="nofollow" onclick="event.preventDefault();
                   document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i> {{ trans('language.logout') }}</a></li>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
                </form>
                @endguest
                @if (!empty($configs['News']))
                <li class="dropdown"><a href="{{ route('news') }}">{{ trans('language.blog') }}</a></li>
                @endif
         @if (!empty($configs['Content']))
                <li class="dropdown"><a href="#">{{ trans('language.cms_category') }}<i class="fa fa-angle-down"></i></a>
                    <ul role="menu" class="sub-menu">
                      @php
                        $cmsCategories = (new \App\Modules\Cms\Models\CmsCategory)->where('status',1)->get();
                      @endphp
                      @foreach ($cmsCategories as $cmsCategory)
                        <li><a href="{{ $cmsCategory->getUrl() }}">{{ $cmsCategory->title }}</a></li>
                      @endforeach
                    </ul>
                </li>
                @endif

                @if (!empty($layoutsUrl['menu']))
                    @foreach ($layoutsUrl['menu'] as $url)
                      <li><a {{ ($url->target =='_blank')?'target=_blank':''  }} href="{{ url($url->url) }}">{{ trans($url->name) }}</a></li>
                    @endforeach
                  @endif

      </ul>

    </div>
    <!-- /.nav-collapse -->
  </nav>
      </div>
    </div><!--/header-bottom-->
  </header><!--/header-->


