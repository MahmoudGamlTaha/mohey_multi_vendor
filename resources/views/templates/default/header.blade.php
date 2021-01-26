<style>
    .select2-selection{
        border:none !important;
        background-color: #F1F1F1 !important;
        appearance: none !important;
        height: 35px !important;
    }
    .select2-selection__arrow{
        display: none;
    }
    .select2-dropdown--below , .select2-search--dropdown{
        background-color: #F1F1F1;
        border: 3px solid #F1F1F1;
        margin-top: 4px!important;
        border-radius: 10px!important;
        font-size:13px!important;
    }
    .select2-dropdown--below{
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.2), 0 2px 5px 0 rgba(0, 0, 0, 0.19);
    }
    .select2-selection--single{
        font-size:13px!important;
        outline: none;
        border-radius: 30px !important;
    }
    .select2-selection__placeholder{
        padding: 5px!important;
    }
    .select2-search--dropdown, .select2-search__field{
        outline: none;
        border: none !important;
        padding: 5px;
        background-color: #ffffff;
        color: #333333;
    }
    .select2-container--open {
        border-radius: 10px !important;
    }
    #double li {
        width: 50%;
    }
</style>
<!--====== Nav 1 ======-->
<nav class="primary-nav primary-nav-wrapper--border">
    <div class="container">

        <!--====== Primary Nav ======-->
        <div class="primary-nav">

            <!--====== Main Logo ======-->

            <a class="main-logo" href="{{route('home')}}">

                <img style="width:70px" src="{{ asset($theme_asset.'/images/brand.png')}}" alt=""></a>
            <!--====== End - Main Logo ======-->


            <!--====== Search Form ======-->
            <form class="main-form">

                <label for="main-search"></label>

                <select style="width:100%" class="js-example-placeholder-single input-text input-text--border-radius input-text--style-1" type="text" id="main-search" placeholder="Search"></select>
                <button class="btn btn--icon fas fa-search main-search-button" type="submit"></button></form>
            <!--====== End - Search Form ======-->


            <!--====== Dropdown Main plugin ======-->
            <div class="menu-init" id="navigation">

                <button class="btn btn--icon toggle-button toggle-button--secondary fas fa-cogs" type="button"></button>

                <!--====== Menu ======-->
                <div class="ah-lg-mode">

                    <span class="ah-close">✕ Close</span>

                    <!--====== List ======-->
                    <ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
                        <li class="has-dropdown" data-tooltip="tooltip" data-placement="left" title="Account">

                            <a><i class="far fa-user-circle"></i></a>

                            <!--====== Dropdown ======-->

                            <span class="js-menu-toggle"></span>
                            <ul style="width:120px">
                                @guest
                                    <li><a href="{{ route('login') }}"><i class="fa fa-lock"></i> {{ trans('language.login') }}</a></li>
                                    <li><a href="{{ route('registermerchant')}}" class="btn btn-yellow-white"><i class="fas fa-user-plus u-s-m-r-6"></i>{{ trans('language.signup') }}</a></li>
                                @else
                                    <li><a href="{{ route('profilePage') }}"><i class="fa fa-user"></i> {{ trans('language.account') }}</a></li>
                                    <li><a href="{{ route('logout') }}" rel="nofollow" onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i> {{ trans('language.logout') }}</a></li>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                @endguest
                            </ul>
                            <!--====== End - Dropdown ======-->
                        </li>
                        <li class="has-dropdown" data-tooltip="tooltip" data-placement="left" title="Settings">

                            <a><i class="fas fa-user-cog"></i></a>

                            <!--====== Dropdown ======-->

                            <span class="js-menu-toggle"></span>
                            <ul style="width:120px">
                                <li class="has-dropdown has-dropdown--ul-right-100">

                                    <a style="padding:0px 15px 0px 15px">{{ trans('language.language') }}<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                                    <!--====== Dropdown ======-->

                                    <span class="js-menu-toggle"></span>
                                    <ul style="width:120px">
                                        @if (count($languages)>1)
                                            @foreach ($languages as $key => $language)
                                                <li><a @if($languages[app()->getLocale()]['name'] == $language->name)class="u-c-brand"@endif style="text-transform: uppercase" href="{{ url('locale/'.$key) }}">
                                                <span>{{trans('language.'.$language->name)}} <span>
                                            @endforeach
                                    @endif
                                    </ul>
                                    <!--====== End - Dropdown ======-->
                                </li>
                                <li class="has-dropdown has-dropdown--ul-right-100">

                                    <a style="padding:0px 15px 0px 15px">{{ trans('language.currencies') }}<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                                    <!--====== Dropdown ======-->

                                    <span class="js-menu-toggle"></span>
                                    <ul style="width:225px">
                                        @if (count($currencies)>1)
                                            @foreach ($currencies as $key => $currency)
                                                <li><a @if(\Helper::getCurrency()['name'] == $currency->name)class="u-c-brand"@endif style="text-transform:uppercase" href="{{ url('currency/'.$currency->code) }}">{{ $currency->name }}</a></li>
                                            @endforeach
                                        @endif
                                    </ul>
                                    <!--====== End - Dropdown ======-->
                                </li>
                            </ul>
                            <!--====== End - Dropdown ======-->
                        </li>
                        @php
                            $contacts = \App\Models\ContactUs::all();
                            $n = 0;
                        @endphp
                        @foreach($contacts as $con)
                            @if($con->name == 'phone')
                            <li data-tooltip="tooltip" data-placement="left" title="Contact">

                                <a href="tel:{{$con->value}}"><i class="fas fa-phone-volume"></i></a></li>
                            @endif
                            @if($con->name == 'email')
                            <li data-tooltip="tooltip" data-placement="left" title="Mail">

                                <a href="mailto:{{$con->value}}"><i class="far fa-envelope"></i></a></li>
                            @endif
                        @endforeach
                    </ul>
                    <!--====== End - List ======-->
                </div>
                <!--====== End - Menu ======-->
            </div>
            <!--====== End - Dropdown Main plugin ======-->
        </div>
        <!--====== End - Primary Nav ======-->
    </div>
</nav>
<!--====== End - Nav 1 ======-->

<!--====== Nav 2 ======-->
<nav class="secondary-nav-wrapper">
    <div class="container">

        <!--====== Secondary Nav ======-->
        <div class="secondary-nav">

            <!--====== Dropdown Main plugin ======-->
            <div class="menu-init" id="navigation1">

                <button class="btn btn--icon toggle-mega-text toggle-button" type="button">M</button>

                <!--====== Menu ======-->
                <div class="ah-lg-mode">

                    <span class="ah-close">✕ Close</span>

                    <!--====== List ======-->
                    <ul class="ah-list">
                        <li class="has-dropdown">

                            <span class="mega-text">M</span>

                            <!--====== Mega Menu ======-->

                            <span class="js-menu-toggle"></span>
                            <div class="mega-menu">
                                <div class="mega-menu-wrap">
                                    <div class="mega-menu-list">
                                        <ul>
                                            @for($x = 0 ;$x < count($categoryTop);$x++)
                                            <li class="cat-{{$x}}">

                                                <a href="#">

                                                    <span>{{$categoryTop[$x]['name']}}</span></a>

                                                <span class="js-menu-toggle js-toggle-mark"></span></li>
                                            @endfor
                                        </ul>
                                    </div>
                                    @php
                                        $banners = \App\Models\Banner::where('status', 1)->where('type_id', 8)->get();
                                        $lastViewed = json_decode(Cookie::get('productsLastView'));
                                        $y = 0;
                                    @endphp
                                    @foreach($categoryTop as $key => $category)
                                    @php
                                        $y++
                                    @endphp
                                    <div class="mega-menu-content" id="cats-{{$y}}">
                                        @if($y == 4)
                                            <div class="row">
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:100px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[8]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:100px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[9]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:100px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[10]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                            </div>
                                        @endif
                                        @if($y == 3)
                                            <div class="row">
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[5]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[6]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[7]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                            </div>
                                        @endif
                                        <!--====== Mega Menu Row ======-->
                                        @if($y == 2)
                                            <div class="row">
                                                <div class="col-lg-6 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[1]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                                <div class="col-lg-6 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[2]['image'] ?? 0}}" alt=""></a></div>
                                                </div>
                                            </div>
                                        @endif
                                        <div class="row">
                                            @if (!empty($categoryList[$category->id]))
                                                @foreach($categoryList[$category->id] as $child)
                                                    @php
                                                        $products = \App\Models\ShopProduct::where('category_id', $child->id)->get();
                                                    @endphp

                                                    <div class="col-lg-3">
                                                        <ul @if(count($products) > 5) id="double" style="width: 760px;overflow: hidden;" @endif>
                                                            <li class="mega-list-title" style="display:flex">
                                                                <a style="font-size:16px;font-weight: 600" href="{{$child->getUrl()}}">{{$child->name}}</a>
                                                                @if(count($products) > 5)
                                                                <a style="font-size:16px;font-weight: 600; margin-left: 340px" href="{{$child->getUrl()}}">{{$child->name}}</a>
                                                                @endif
                                                            </li>
                                                            @for($i=0;$i<count($products);$i++)
                                                                <li style="line-height: .8em;float: left;display: inline;">

                                                                    <a style="font-size:12px;font-weight:600" href="{{route('product', ['name'=> $products[$i]['name'], 'id'=> $products[$i]['id']])}}">{{$products[$i]['name']}}</a></li>
                                                            @endfor
                                                        </ul>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                        <!--====== End - Mega Menu Row ======-->
                                        <br>
                                        <!--====== Mega Menu Row ======-->
                                        <div class="row">
                                            @if($y > 1)
                                            <div class="col-lg-3">
                                                <ul>
                                                    <li class="mega-list-title">

                                                        <a style="font-size:16px;font-weight: 600" href="{{$child->getUrl()}}">Categories</a></li>
                                                    @for($i=0;$i<4;$i++)
                                                        <li>

                                                            <a style="font-size:12px;font-weight:600">{{$categoryTop[$i]['name']}}</a></li>
                                                        <li>
                                                    @endfor
                                                </ul>
                                            </div>
                                            @endif
                                            <div class="col-lg-3">
                                                <ul>
                                                    <li class="mega-list-title">

                                                        <a href="#">LAST VIEWED PRODUCTS</a></li>
                                                    @if($lastViewed !== null)
                                                    @foreach($lastViewed as $key => $value)
                                                        @php
                                                            $value = \App\Models\ShopProduct::find($key);
                                                            $n++;
                                                        @endphp
                                                        <li>
                                                            <a style="line-height: 1em;font-size:12px;font-weight:600" href="{{$value->getUrl() }}">{{$value->name}}</a></li>
                                                        @if($n > 5)
                                                            @php
                                                                $n = 0;
                                                            @endphp
                                                            @break;
                                                        @endif
                                                    @endforeach
                                                    @endif
                                                </ul>
                                            </div>
                                            @if($y == 1)
                                            <div class="col-lg-9 mega-image">
                                                <div class="mega-banner">

                                                    <a class="u-d-block" href="shop-side-version-2.html">

                                                        <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[0]['image'] ?? 0}}" alt=""></a></div>
                                            </div>
                                            @endif
                                            @if($y == 2)
                                                <div class="row">
                                                    <div class="col-lg-9 mega-image">
                                                        <div class="mega-banner">

                                                            <a class="u-d-block" href="shop-side-version-2.html">

                                                                <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[3]['image'] ?? 0}}" alt=""></a></div>
                                                    </div>
                                                    <div class="col-lg-3 mega-image">
                                                        <div class="mega-banner">

                                                            <a class="u-d-block" href="shop-side-version-2.html">

                                                                <img style="height:150px" class="u-img-fluid u-d-block" src="{{ asset($path_file.'') }}/{{ $banners[4]['image'] ?? 0}}" alt=""></a></div>
                                                    </div>
                                                </div>
                                            @endif
                                        </div>
                                        <div class="row">

                                        </div>
                                        <!--====== End - Mega Menu Row ======-->
                                    </div>
                                @endforeach
                                </div>
                            </div>
                            <!--====== End - Mega Menu ======-->
                        </li>
                    </ul>
                    <!--====== End - List ======-->
                </div>
                <!--====== End - Menu ======-->
            </div>
            <!--====== End - Dropdown Main plugin ======-->


            <!--====== Dropdown Main plugin ======-->
            <div class="menu-init" id="navigation2">

                <button class="btn btn--icon toggle-button toggle-button--secondary fas fa-cog" type="button"></button>

                <!--====== Menu ======-->
                <div class="ah-lg-mode">

                    <span class="ah-close">✕ Close</span>

                    <!--====== List ======-->
                    <ul class="ah-list ah-list--design2 ah-list--link-color-secondary">
                        <li>

                            <a href="{{route('newArrivals')}}">NEW ARRIVALS</a></li>
                        <li class="has-dropdown">

                            <a>PAGES<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                            <!--====== Dropdown ======-->

                            <span class="js-menu-toggle"></span>
                            <ul style="width:170px">
                                <li class="has-dropdown has-dropdown--ul-left-100">

                                    <a href="index.html">Home</a>
                                </li>
                                <li>

                                    <a href="{{route('ProductsGrid')}}">Shop Grid Layout</a>
                                </li>
                                <li>

                                    <a href="{{route('cart')}}">Cart</a></li>
                                <li>

                                    <a href="{{route('wishlist')}}">Wishlist</a></li>
                                <li>

                                    <a href="{{route('checkout')}}">Checkout</a></li>
                                <li>

                                    <a href="contact.html">Contact</a></li>
                            </ul>
                            <!--====== End - Dropdown ======-->
                        </li>
                        <li>

                            <a href="{{route('ProductsGrid')}}">PRODUCTS</a>
                        </li>
                        <li>

                            <a href="about.html">ABOUT US</a></li>

                    </ul>
                    <!--====== End - List ======-->
                </div>
                <!--====== End - Menu ======-->
            </div>
            <!--====== End - Dropdown Main plugin ======-->


            <!--====== Dropdown Main plugin ======-->
            <div class="menu-init" id="navigation3">

                <button class="btn btn--icon toggle-button toggle-button--secondary fas fa-shopping-bag toggle-button-shop" type="button"></button>

                <span class="total-item-round">2</span>

                <!--====== Menu ======-->
                <div class="ah-lg-mode">

                    <span class="ah-close">✕ Close</span>

                    <!--====== List ======-->
                    <ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
                        <li>

                            <a href="{{ route('home') }}"><i class="home fas fa-home"></i></a></li>
                        <li>

                            <a href="{{ route('wishlist') }}" title="{{ trans('language.wishlist') }}"><i class="wishlist far fa-heart"></i></a></li>
                        <li class="has-dropdown">

                            <a href="{{ route('cart') }}" class="mini-cart-shop-link"><i class="cart fas fa-shopping-bag"></i></a>
                                @php
                                    $cart = Cart::content();
                                    $total_price = 0;
                                @endphp
                                <span class="total-item-round">{{isset($cart) ? $carts['count'] : 0}}</span>

                            <!--====== Dropdown ======-->

                            <span class="js-menu-toggle"></span>
                            <div class="mini-cart">

                                <!--====== Mini Product Container ======-->
                                <div class="mini-product-container gl-scroll u-s-m-b-15">
                                    @isset($cart)
                                        @foreach($cart as $item)
                                            @php
                                                $product = App\Models\ShopProduct::find($item->id);
                                                $total_price += $item->price * $item->qty;
                                            @endphp
                                            <div class="card-mini-product">
                                                <div class="mini-product">
                                                    <div class="mini-product__image-wrapper">

                                                        <a class="mini-product__link" href="{{route('cart')}}">

                                                            <img class="u-img-fluid" src="{{asset($product->getImage())}}" alt=""></a></div>
                                                    <div class="mini-product__info-wrapper">

                                                                    <span class="mini-product__category">

                                                                        <a href="shop-side-version-2.html">{{$item->sku}}</a></span>

                                                        <span class="mini-product__name">

                                                                        <a href="{{$product->getUrl()}}">{{$item->name}}</a></span>

                                                        <span class="mini-product__quantity">{{$item->qty}} x</span>

                                                        <span class="mini-product__price">${{$item->price}}</span></div>
                                                </div>

                                                <a href="{{route("removeItem",['id'=>$item->rowId])}}" class="mini-product__delete-link far fa-trash-alt"></a>
                                            </div>
                                        @endforeach
                                    @endisset
                                    <!--====== End - Card for mini cart ======-->
                                </div>
                                <!--====== End - Mini Product Container ======-->


                                <!--====== Mini Product Statistics ======-->
                                <div class="mini-product-stat">
                                    <div class="mini-total">

                                        <span class="subtotal-text">SUBTOTAL</span>

                                        <span class="subtotal-value">${{$total_price}}</span></div>
                                    <div class="mini-action">

                                        <a class="mini-link btn--e-brand-b-2" href="{{ route('checkout') }}" title=" {{ trans('language.cart_title') }}">PROCEED TO CHECKOUT</a>

                                        <a class="mini-link btn--e-transparent-secondary-b-2" href="{{ route('cart') }}" title=" {{ trans('language.cart_title') }}">VIEW CART</a></div>
                                </div>
                                <!--====== End - Mini Product Statistics ======-->
                            </div>
                            <!--====== End - Dropdown ======-->
                        </li>
                    </ul>
                    <!--====== End - List ======-->
                </div>
                <!--====== End - Menu ======-->
            </div>
            <!--====== End - Dropdown Main plugin ======-->
        </div>
        <!--====== End - Secondary Nav ======-->
    </div>
</nav>
<!--====== End - Nav 2 ======-->