@extends($theme.'.shop_layout')
@php
    $banners = \App\Models\Banner::where('status', 1)->where('type_id', 1)->sort()->get();
    $top3Images = \App\Models\Banner::where('status', 1)->where('type_id', 2)->sort()->get();
    $sideImage = \App\Models\Banner::where('status',1)->where('type_id',4)->sort()->first();
    $x = -1;
    $prodArray = [];
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
                                    {!!$banner->title!!}
                                </div>
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

                                        <button class="btn filter__btn filter__btn--style-1" type="button" data-filter=".{{str_replace(' ', '',$categoryTop[$x]['name'])}}">{{$categoryTop[$x]['name']}}</button></div>
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
                                                @php
                                                    if(in_array($prod->id, $prodArray)){
                                                        continue;
                                                    }
                                                    $prodArray[] = $prod->id;
                                                @endphp
                                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item {{str_replace(' ', '',$category->name)}}">
                                                    <div class="product-o product-o--hover-on product-o--radius">
                                                        <div class="product-o__wrap">
                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{$prod->getUrl()}}">

                                                                <img class="aspect__img" src="{{asset($prod->getImage())}}" alt=""></a>
                                                            <div class="product-o__action-wrap">
                                                                <ul class="product-o__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look" class="quickLook" data-index="{{$prod->id}}" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
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

                                                        <a data-modal="modal" data-modal-id="#quick-look" class="quickLook" data-index="{{$product->id}}" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                    <li>

                                                        <a data-modal="modal" onClick="addToCart('{{ $product->id }}','default',$(this))" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                    <li>

                                                        <a onClick="addToCart('{{ $product->id }}','wishlist',$(this))" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
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
        @php
            $ImagesLeft = \App\Models\Banner::where('status',1)->where('type_id',7)->limit(3)->get();
        @endphp

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        @if(isset($ImagesLeft))
                        @foreach($ImagesLeft as $ImageLeft)
                        <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">
                            <a class="promotion" href="{{$ImageLeft->url}}">
                                <div class="aspect aspect--bg-grey aspect--square">

                                    <img class="aspect__img promotion__img" src="{{ asset($path_file.'') }}/{{$ImageLeft->image}}" alt=""></div>
                                <div class="promotion__content">
                                    <div class="promotion__text-wrap">
                                        <div class="promotion__text-1">

                                            <span class="u-c-secondary">{{$ImageLeft->title}}</span></div>
                                    </div>
                                </div>
                            </a></div>
                            @endforeach
                        @else
                            <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">
                                <a class="promotion" href="#">
                                    <div class="aspect aspect--bg-grey aspect--square">

                                        <img class="aspect__img promotion__img" src="{{ asset($path_file.'') }}/default/default_1.jpg" alt=""></div>
                                    <div class="promotion__content">
                                        <div class="promotion__text-wrap">
                                            <div class="promotion__text-1">

                                                <span class="u-c-secondary">{{$ImageLeft->title}}</span></div>
                                        </div>
                                    </div>
                                </a></div>
                        @endif
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
    </div>
    <!--====== End - App Content ======-->
@endsection



@push('styles')
@endpush
