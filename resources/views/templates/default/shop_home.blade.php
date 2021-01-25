@extends($theme.'.shop_layout')
@php
    $banners = \App\Models\Banner::where('status', 1)->where('type_id', 1)->sort()->get();
    $top3Images = \App\Models\Banner::where('status', 1)->where('type_id', 2)->sort()->get();
    $sideImage = \App\Models\Banner::where('status',1)->where('type_id',4)->sort()->first();
    $x = -1;
@endphp
@section('center')
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Primary Slider ======-->
        <div class="s-skeleton s-skeleton--h-600 s-skeleton--bg-grey">
            <div class="owl-carousel primary-style-1" id="hero-slider">
                @foreach($banners as $banner)
                <div class="hero-slide hero-slide--{{$x++}}" style="background-image: url({{ asset($path_file.'') }}/{{ $banners[$x]['image'] ?? 0}}) !important;">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="slider-content slider-content--animation">
                                    <span class="content-span-1 u-c-secondary">Latest Update Stock</span>

                                    <span class="content-span-2 u-c-secondary">30% Off On Electronics</span>

                                    <span class="content-span-3 u-c-secondary">Find electronics on best prices, Also Discover most selling products of electronics</span>

                                    <span class="content-span-4 u-c-secondary">Starting At

                                            <span class="u-c-brand">$1050.00</span></span>

                                    <a class="shop-now-link btn--e-brand" href="#">SHOP NOW</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
        <!--====== End - Primary Slider ======-->


        <!--====== Section 1 ======-->
        <div class="u-s-p-y-60">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">SHOP BY DEALS</h1>

                                <span class="section__span u-c-silver">BROWSE FAVOURITE DEALS</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        @for($z = 0 ; $z < 4 ;$z++)
                            @if($z % 2 == 0)
                            <div class="col-lg-5 col-md-5 u-s-m-b-30">
                                <a class="collection" href="{{$brands[$z]->getUrl()}}">
                                    <div class="aspect aspect--bg-grey aspect--square">
                                        <img class="aspect__img collection__img" src="{{$brands[$z]->getImage()}}" alt=""></div>
                                </a></div>
                            @else
                            <div class="col-lg-7 col-md-7 u-s-m-b-30">

                                <a class="collection" href="{{$brands[$z]->getUrl()}}">
                                    <div class="aspect aspect--bg-grey aspect--1286-890">

                                        <img class="aspect__img collection__img" src="{{$brands[$z]->getImage()}}" alt=""></div>
                                </a></div>
                            @endif
                        @endfor
                    </div>
                </div>
            </div>

            <!--====== Section Content ======-->
        </div>
        <!--====== End - Section 1 ======-->


        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-16">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">TOP TRENDING</h1>

                                <span class="section__span u-c-silver">CHOOSE CATEGORY</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="filter-category-container">
                                <div class="filter__category-wrapper">

                                    <button class="btn filter__btn filter__btn--style-1 js-checked" type="button" data-filter="*">ALL</button></div>
                                @for($x = 0 ;$x < count($categoryTop);$x++)
                                    <div class="filter__category-wrapper">

                                        <button class="btn filter__btn filter__btn--style-1" type="button" data-filter=".{{$categoryTop[$x]['name']}}">{{$categoryTop[$x]['name']}}</button></div>
                                @endfor
                            </div>
                            <div class="filter__grid-wrapper u-s-m-t-30">
                                <div class="row">
                                    @foreach($categoryTop as $key => $category)
                                        @if (!empty($categoryList[$category->id]))
                                            @foreach($categoryList[$category->id] as $child)
                                                @php
                                                    $topTrending = App\Models\ShopOrderDetail::all();
                                                @endphp
                                            @foreach($topTrending as $product)
                                                @php
                                                    $products = \App\Models\ShopProduct::where(['id'=> $product->product_id, 'category_id'=> $child->id])->limit(4)->get();
                                                @endphp
                                            @foreach($products as $prod)
                                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item {{$category->name}}">
                                                    <div class="product-o product-o--hover-on product-o--radius">
                                                        <div class="product-o__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{$prod->getUrl()}}">

                                                                <img class="aspect__img" src="{{asset($prod->getImage())}}" alt=""></a>
                                                            <div class="product-o__action-wrap">
                                                                <ul class="product-o__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" onClick="addToCart('{{ $prod->id }}','default',$(this))" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a onClick="addToCart('{{ $prod->id }}','wishlist',$(this))" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-o__category">

                                                                <a href="href="{{$child->getUrl()}}"">{{$child->name}}</a></span>
                                                        <span class="product-o__name">

                                                                <a href="{{$prod->getUrl()}}">{{$prod->name}}</a></span>
                                                        <div class="product-o__rating gl-rating-style">
                                                            @php
                                                                $rate = (new \App\Models\ShopProductLike)->getRate($prod->id);
                                                            @endphp
                                                            @for($r = 0 ; $r < $rate['percent'];$r++)
                                                                <i class="fas fa-star"></i>
                                                            @endfor
                                                            @if($r < 5)
                                                                @for($x = 0; $x < (5-$r); $x++)
                                                                    <i class="fas fa-star" style="color:wheat"></i>
                                                                @endfor
                                                            @endif
                                                            <span class="product-o__review">({{$rate['userCount'] > 0 ? 'تقييم ' . $rate['userCount'] : 'لا يوجد تقييم'}})</span></div>

                                                        <span class="product-o__price">{{$prod->price}}</span>
                                                    </div>
                                                </div>
                                                @endforeach
                                                @endforeach
                                            @endforeach
                                        @endif
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="load-more">

                                <button class="btn btn--e-brand" type="button">Load More</button></div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 2 ======-->


        <!--====== Section 4 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">NEW ARRIVALS</h1>

                                <span class="section__span u-c-silver">GET UP FOR NEW ARRIVALS</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="slider-fouc">
                        <div class="owl-carousel product-slider" data-item="4">
                            @php
                                $newArrivals = \App\Models\ShopProduct::orderBy('id', 'DESC')->LIMIT(10)->get();
                            @endphp
                            @foreach($newArrivals as $product)
                                <div class="u-s-m-b-30">
                                    <div class="product-o product-o--hover-on">
                                        <div class="product-o__wrap">

                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{$product->getUrl()}}">

                                                <img class="aspect__img" src="{{asset($product->getImage())}}" alt=""></a>
                                            <div class="product-o__action-wrap">
                                                <ul class="product-o__action-list">
                                                    <li>

                                                        <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                    <li>

                                                        <a data-modal="modal" onClick="addToCart('{{ $prod->id }}','default',$(this))" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                    <li>

                                                        <a onClick="addToCart('{{ $prod->id }}','wishlist',$(this))" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                    <li>

                                                        <a data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <span class="product-o__category">

                                                <a href="{{$product->category->getUrl()}}">{{$product->category->first()->name}}</a></span>

                                        <span class="product-o__name">

                                                <a href="{{$product->getUrl()}}">{{$product->name}}</a></span>
                                        <div class="product-o__rating gl-rating-style">
                                            @php
                                                $rate = (new \App\Models\ShopProductLike)->getRate($product->id);
                                            @endphp
                                            @for($r = 0 ; $r < $rate['percent'];$r++)
                                                <i class="fas fa-star"></i>
                                            @endfor
                                            @if($r < 5)
                                                @for($x = 0; $x < (5-$r); $x++)
                                                    <i class="fas fa-star" style="color:wheat"></i>
                                                @endfor
                                            @endif
                                            <span class="product-o__review">({{$rate['userCount'] > 0 ? 'تقييم ' . $rate['userCount'] : 'لا يوجد تقييم'}})</span></div>

                                        <span class="product-o__price">{{$product->price}}</span>
                                    </div>
                                </div>
                            @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 4 ======-->


        <!--====== Section 6 ======-->
        <div class="u-s-p-y-60">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">FEATURED CATEGORIES</h1>

                                <span class="section__span u-c-silver">MOST FEATURED CATEGORIES</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        @foreach($categoryList as $key => $value)
                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                            <div class="product-o product-o--hover-on u-h-100">
                                <div class="product-o__wrap">

                                    <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{$value[0]->getUrl()}}">

                                        <img class="aspect__img" src="{{ $value[0]->getThumb() }}" alt=""></a>
                                </div>

                                <span class="product-o__name">

                                        <a style="width:100%; margin: auto" href="{{$value[0]->getUrl()}}">{{$value[0]->name}}</a></span>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 6 ======-->


        <!--====== Section 7 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">

                            <a class="promotion" href="shop-side-version-2.html">
                                <div class="aspect aspect--bg-grey aspect--square">

                                    <img class="aspect__img promotion__img" src="images/promo/promo-img-1.jpg" alt=""></div>
                                <div class="promotion__content">
                                    <div class="promotion__text-wrap">
                                        <div class="promotion__text-1">

                                            <span class="u-c-secondary">ACCESSORIES FOR YOUR EVERYDAY</span></div>
                                        <div class="promotion__text-2">

                                            <span class="u-c-secondary">GET IN</span>

                                            <span class="u-c-brand">TOUCH</span></div>
                                    </div>
                                </div>
                            </a></div>
                        <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">

                            <a class="promotion" href="shop-side-version-2.html">
                                <div class="aspect aspect--bg-grey aspect--square">

                                    <img class="aspect__img promotion__img" src="images/promo/promo-img-2.jpg" alt=""></div>
                                <div class="promotion__content">
                                    <div class="promotion__text-wrap">
                                        <div class="promotion__text-1">

                                            <span class="u-c-secondary">SMARTPHONE</span>

                                            <span class="u-c-brand">2019</span></div>
                                        <div class="promotion__text-2">

                                            <span class="u-c-secondary">NEW ARRIVALS</span></div>
                                    </div>
                                </div>
                            </a></div>
                        <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">

                            <a class="promotion" href="shop-side-version-2.html">
                                <div class="aspect aspect--bg-grey aspect--square">

                                    <img class="aspect__img promotion__img" src="images/promo/promo-img-3.jpg" alt=""></div>
                                <div class="promotion__content">
                                    <div class="promotion__text-wrap">
                                        <div class="promotion__text-1">

                                            <span class="u-c-secondary">DSLR FOR NEW GENERATION</span></div>
                                        <div class="promotion__text-2">

                                            <span class="u-c-brand">GET UP TO 10% OFF</span></div>
                                    </div>
                                </div>
                            </a></div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 7 ======-->


        <!--====== Section 8 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                            <div class="column-product">

                                <span class="column-product__title u-c-secondary u-s-m-b-25">WEEKLY PRODUCTS</span>
                                <ul class="column-product__list">
                                    @foreach($categories as $key => $value)
                                        @php
                                            $firstBest = null;
                                            $counter = 0;
                                            if($value[0]->four_best_product == 1)
                                            $products = \App\Models\ShopProduct::where(['status'=> 1,'category_id' => $value[0]->id])->sort()->orderBy('price',
                                            'desc')->paginate(5);
                                        @endphp
                                        @foreach($products as $item)
                                            @php
                                                if($counter == 0){
                                                $firstBest = $item;
                                                $counter++;
                                                continue;
                                                }
                                                $counter++;
                                            @endphp
                                            <li class="column-product__item">
                                                <div class="product-l">
                                                    <div class="product-l__img-wrap">

                                                        <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link" href="{{ $item->getUrl() }}">

                                                            <img class="aspect__img" src="{{ asset( $item->getThumb()) }}" alt=""></a></div>
                                                    <div class="product-l__info-wrap">
                                                        <span class="product-l__category">

                                                                <a href="{{ $item->category->getUrl() }}">{{ $item->category->first()->name }}</a></span>
                                                        <span class="product-l__name">

                                                        <a href="{{ $item->getUrl() }}">{{ $item->name }}</a></span>
                                                        <div class="product-o__rating gl-rating-style">
                                                            @php
                                                                $rate = (new \App\Models\ShopProductLike)->getRate($item->id);
                                                            @endphp
                                                            @for($r = 0 ; $r < $rate['percent'];$r++)
                                                                <i class="fas fa-star"></i>
                                                            @endfor
                                                            @if($r < 5)
                                                                @for($x = 0; $x < (5-$r); $x++)
                                                                    <i class="fas fa-star" style="color:wheat"></i>
                                                                @endfor
                                                            @endif
                                                            <span class="product-o__review">({{$rate['userCount'] > 0 ? 'تقييم ' . $rate['userCount'] : 'لا يوجد تقييم'}})</span></div>
                                                        <span class="product-l__price">{!! $item->showPrice() !!}</span></div>
                                                </div>
                                            </li>
                                        @endforeach

                                    @endforeach
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                            <div class="column-product">
                                <span class="column-product__title u-c-secondary u-s-m-b-25">SPECIAL PRODUCTS</span>
                                <ul class="column-product__list">
                                    @php
                                        $products_special = (new \App\Models\ShopProduct)->getProductsSpecial($limit = 20, $random = true);
                                        $stop = 0;
                                    @endphp
                                    @if (!empty($products_special))
                                        @foreach ($products_special as $key => $product_special)
                                            @php
                                                $test = \App\Models\ShopProduct::where('id', $product_special->id)->get();
                                            @endphp
                                            @foreach($test as $t)
                                                @php
                                                    $stop++;
                                                    if($stop > 4) break;
                                                @endphp
                                                <li class="column-product__item">
                                                    <div class="product-l">
                                                        <div class="product-l__img-wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link" href="{{ $t->getUrl() }}">

                                                                <img class="aspect__img" src="{{ asset($t->getThumb()) }}" alt=""></a></div>
                                                        <div class="product-l__info-wrap">
                                                                <span class="product-l__name">

                                                                <a href="{{ $t->getUrl() }}">{{ $t->name }}</a></span>
                                                            <div class="product-o__rating gl-rating-style">
                                                                @php
                                                                    $rate = (new \App\Models\ShopProductLike)->getRate($t->id);
                                                                @endphp
                                                                @for($r = 0 ; $r < $rate['percent'];$r++)
                                                                    <i class="fas fa-star"></i>
                                                                @endfor
                                                                @if($r < 5)
                                                                    @for($x = 0; $x < (5-$r); $x++)
                                                                        <i class="fas fa-star" style="color:wheat"></i>
                                                                    @endfor
                                                                @endif
                                                                <span class="product-o__review">({{$rate['userCount'] > 0 ? 'تقييم ' . $rate['userCount'] : 'لا يوجد تقييم'}})</span></div>
                                                                    <span class="product-l__price">{!! $t->showPrice() !!}</span></div>
                                                    </div>
                                                </li>
                                            @endforeach
                                        @endforeach
                                    @endif
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 u-s-m-b-30">
                                <div class="column-product">

                                    <span class="column-product__title u-c-secondary u-s-m-b-25">FLASH PRODUCTS</span>
                                    <ul class="column-product__list">
                                        @php
                                            $products_special = (new \App\Models\ShopProduct)->getProductsSpecial($limit = 20, $random = true);
                                            $stop = 0;
                                        @endphp
                                        @if (!empty($products_special))
                                            @foreach ($products_special as $key => $product_special)
                                                @php
                                                    $test = \App\Models\ShopProduct::where('id', $product_special->id)->get();
                                                @endphp
                                                @foreach($test as $t)
                                                    @php
                                                        $stop++;
                                                        if($stop > 4) break;
                                                    @endphp
                                                    <li class="column-product__item">
                                                        <div class="product-l">
                                                            <div class="product-l__img-wrap">

                                                                <a class="aspect aspect--bg-grey aspect--square u-d-block product-l__link" href="{{ $t->getUrl() }}">

                                                                    <img class="aspect__img" src="{{ asset($t->getThumb()) }}" alt=""></a></div>
                                                            <div class="product-l__info-wrap">
                                                                <span class="product-l__name">

                                                                        <a href="{{ $t->getUrl() }}">{{ $t->name }}</a></span>
                                                                <div class="product-o__rating gl-rating-style">
                                                                    @php
                                                                        $rate = (new \App\Models\ShopProductLike)->getRate($t->id);
                                                                    @endphp
                                                                    @for($r = 0 ; $r < $rate['percent'];$r++)
                                                                        <i class="fas fa-star"></i>
                                                                    @endfor
                                                                    @if($r < 5)
                                                                        @for($x = 0; $x < (5-$r); $x++)
                                                                            <i class="fas fa-star" style="color:wheat"></i>
                                                                        @endfor
                                                                    @endif
                                                                    <span class="product-o__review">({{$rate['userCount'] > 0 ? 'تقييم ' . $rate['userCount'] : 'لا يوجد تقييم'}})</span></div>
                                                                <span class="product-l__price">{!! $t->showPrice() !!}</span></div>
                                                        </div>
                                                    </li>
                                                @endforeach
                                            @endforeach
                                        @endif
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 8 ======-->


        <!--====== Section 9 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                            <div class="service u-h-100">
                                <div class="service__icon"><i class="fas fa-truck"></i></div>
                                <div class="service__info-wrap">

                                    <span class="service__info-text-1">Free Shipping</span>

                                    <span class="service__info-text-2">Free shipping on all US order or order above $200</span></div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                            <div class="service u-h-100">
                                <div class="service__icon"><i class="fas fa-redo"></i></div>
                                <div class="service__info-wrap">

                                    <span class="service__info-text-1">Shop with Confidence</span>

                                    <span class="service__info-text-2">Our Protection covers your purchase from click to delivery</span></div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                            <div class="service u-h-100">
                                <div class="service__icon"><i class="fas fa-headphones-alt"></i></div>
                                <div class="service__info-wrap">

                                    <span class="service__info-text-1">24/7 Help Center</span>

                                    <span class="service__info-text-2">Round-the-clock assistance for a smooth shopping experience</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 9 ======-->


<!--        ====== Section 10 ======
        <div class="u-s-p-b-60">

            ====== Section Intro ======
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">LATEST FROM BLOG</h1>

                                <span class="section__span u-c-silver">START YOU DAY WITH FRESH AND LATEST NEWS</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            ====== End - Section Intro ======


            ====== Section Content ======
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                            <div class="bp-mini bp-mini&#45;&#45;img u-h-100">
                                <div class="bp-mini__thumbnail">

                                    ====== Image Code ======

                                    <a class="aspect aspect&#45;&#45;bg-grey aspect&#45;&#45;1366-768 u-d-block" href="blog-detail.html">

                                        <img class="aspect__img" src="images/blog/post-2.jpg" alt=""></a>
                                    ====== End - Image Code ======
                                </div>
                                <div class="bp-mini__content">
                                    <div class="bp-mini__stat">

                                            <span class="bp-mini__stat-wrap">

                                                <span class="bp-mini__publish-date">

                                                    <a>

                                                        <span>25 February 2018</span></a></span></span>

                                        <span class="bp-mini__stat-wrap">

                                                <span class="bp-mini__preposition">By</span>

                                                <span class="bp-mini__author">

                                                    <a href="#">Dayle</a></span></span>

                                        <span class="bp-mini__stat">

                                                <span class="bp-mini__comment">

                                                    <a href="blog-detail.html"><i class="far fa-comments u-s-m-r-4"></i>

                                                        <span>8</span></a></span></span></div>
                                    <div class="bp-mini__category">

                                        <a>Learning</a>

                                        <a>News</a>

                                        <a>Health</a></div>

                                    <span class="bp-mini__h1">

                                            <a href="blog-detail.html">Life is an extraordinary Adventure</a></span>
                                    <p class="bp-mini__p">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                    <div class="blog-t-w">

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Travel</a>

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Culture</a>

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Place</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                            <div class="bp-mini bp-mini&#45;&#45;img u-h-100">
                                <div class="bp-mini__thumbnail">

                                    ====== Image Code ======

                                    <a class="aspect aspect&#45;&#45;bg-grey aspect&#45;&#45;1366-768 u-d-block" href="blog-detail.html">

                                        <img class="aspect__img" src="images/blog/post-12.jpg" alt=""></a>
                                    ====== End - Image Code ======
                                </div>
                                <div class="bp-mini__content">
                                    <div class="bp-mini__stat">

                                            <span class="bp-mini__stat-wrap">

                                                <span class="bp-mini__publish-date">

                                                    <a>

                                                        <span>25 February 2018</span></a></span></span>

                                        <span class="bp-mini__stat-wrap">

                                                <span class="bp-mini__preposition">By</span>

                                                <span class="bp-mini__author">

                                                    <a href="#">Dayle</a></span></span>

                                        <span class="bp-mini__stat">

                                                <span class="bp-mini__comment">

                                                    <a href="blog-detail.html"><i class="far fa-comments u-s-m-r-4"></i>

                                                        <span>8</span></a></span></span></div>
                                    <div class="bp-mini__category">

                                        <a>Learning</a>

                                        <a>News</a>

                                        <a>Health</a></div>

                                    <span class="bp-mini__h1">

                                            <a href="blog-detail.html">Wait till its open</a></span>
                                    <p class="bp-mini__p">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                    <div class="blog-t-w">

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Travel</a>

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Culture</a>

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Place</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                            <div class="bp-mini bp-mini&#45;&#45;img u-h-100">
                                <div class="bp-mini__thumbnail">

                                    ====== Image Code ======

                                    <a class="aspect aspect&#45;&#45;bg-grey aspect&#45;&#45;1366-768 u-d-block" href="blog-detail.html">

                                        <img class="aspect__img" src="images/blog/post-5.jpg" alt=""></a>
                                    ====== End - Image Code ======
                                </div>
                                <div class="bp-mini__content">
                                    <div class="bp-mini__stat">

                                            <span class="bp-mini__stat-wrap">

                                                <span class="bp-mini__publish-date">

                                                    <a>

                                                        <span>25 February 2018</span></a></span></span>

                                        <span class="bp-mini__stat-wrap">

                                                <span class="bp-mini__preposition">By</span>

                                                <span class="bp-mini__author">

                                                    <a href="#">Dayle</a></span></span>

                                        <span class="bp-mini__stat">

                                                <span class="bp-mini__comment">

                                                    <a href="blog-detail.html"><i class="far fa-comments u-s-m-r-4"></i>

                                                        <span>8</span></a></span></span></div>
                                    <div class="bp-mini__category">

                                        <a>Learning</a>

                                        <a>News</a>

                                        <a>Health</a></div>

                                    <span class="bp-mini__h1">

                                            <a href="blog-detail.html">Tell me difference between smoke and vape</a></span>
                                    <p class="bp-mini__p">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                    <div class="blog-t-w">

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Travel</a>

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Culture</a>

                                        <a class="gl-tag btn&#45;&#45;e-transparent-hover-brand-b-2">Place</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            ====== End - Section Content ======
        </div>
        ====== End - Section 10 ======-->


        <!--====== Section 11 ======-->
        <div class="u-s-p-b-90 u-s-m-b-30">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">CLIENTS FEEDBACK</h1>

                                <span class="section__span u-c-silver">WHAT OUR CLIENTS SAY</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">

                    <!--====== Testimonial Slider ======-->
                    <div class="slider-fouc">
                        <div class="owl-carousel" id="testimonial-slider">
                            <div class="testimonial">
                                <div class="testimonial__img-wrap">

                                    <img class="testimonial__img" src="images/about/test-1.jpg" alt=""></div>
                                <div class="testimonial__content-wrap">

                                    <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                                    <blockquote class="testimonial__block-quote">
                                        <p>"Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean."</p>
                                    </blockquote>

                                    <span class="testimonial__author">John D. / DVNTR Inc.</span>
                                </div>
                            </div>
                            <div class="testimonial">
                                <div class="testimonial__img-wrap">

                                    <img class="testimonial__img" src="images/about/test-2.jpg" alt=""></div>
                                <div class="testimonial__content-wrap">

                                    <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                                    <blockquote class="testimonial__block-quote">
                                        <p>"Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean."</p>
                                    </blockquote>

                                    <span class="testimonial__author">John D. / DVNTR Inc.</span>
                                </div>
                            </div>
                            <div class="testimonial">
                                <div class="testimonial__img-wrap">

                                    <img class="testimonial__img" src="images/about/test-3.jpg" alt=""></div>
                                <div class="testimonial__content-wrap">

                                    <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                                    <blockquote class="testimonial__block-quote">
                                        <p>"Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean."</p>
                                    </blockquote>

                                    <span class="testimonial__author">John D. / DVNTR Inc.</span>
                                </div>
                            </div>
                            <div class="testimonial">
                                <div class="testimonial__img-wrap">

                                    <img class="testimonial__img" src="images/about/test-4.jpg" alt=""></div>
                                <div class="testimonial__content-wrap">

                                    <span class="testimonial__double-quote"><i class="fas fa-quote-right"></i></span>
                                    <blockquote class="testimonial__block-quote">
                                        <p>"Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean."</p>
                                    </blockquote>

                                    <span class="testimonial__author">John D. / DVNTR Inc.</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Testimonial Slider ======-->
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 11 ======-->


        <!--====== Section 12 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">

                    <!--====== Brand Slider ======-->
                    <div class="slider-fouc">
                        <div class="owl-carousel" id="brand-slider" data-item="5">
                            <div class="brand-slide">

                                <a href="shop-side-version-2.html">

                                    <img src="images/brand/b1.png" alt=""></a></div>
                            <div class="brand-slide">

                                <a href="shop-side-version-2.html">

                                    <img src="images/brand/b2.png" alt=""></a></div>
                            <div class="brand-slide">

                                <a href="shop-side-version-2.html">

                                    <img src="images/brand/b3.png" alt=""></a></div>
                            <div class="brand-slide">

                                <a href="shop-side-version-2.html">

                                    <img src="images/brand/b4.png" alt=""></a></div>
                            <div class="brand-slide">

                                <a href="shop-side-version-2.html">

                                    <img src="images/brand/b5.png" alt=""></a></div>
                            <div class="brand-slide">

                                <a href="shop-side-version-2.html">

                                    <img src="images/brand/b6.png" alt=""></a></div>
                        </div>
                    </div>
                    <!--====== End - Brand Slider ======-->
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 12 ======-->
    </div>
    <!--====== End - App Content ======-->
@endsection



@push('styles')
@endpush
