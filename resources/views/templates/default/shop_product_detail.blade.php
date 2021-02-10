@extends($theme.'.shop_layout')
@php
    $banner = \App\Models\Banner::where('status', 1)->where('type_id', 1)->sort()->first();
@endphp
@section('center')
    @php
        /*$category = $product->category()->first();
        $cat_id = $category->id;
        $categories = DB::select(DB::raw("WITH RECURSIVE cte AS (SELECT id, parent FROM shop_category WHERE id = ?
            UNION ALL
            SELECT d.id, d.parent
            FROM shop_category d
            INNER JOIN cte
            ON  d.id = cte.parent
        ) SELECT * FROM cte "), [$cat_id]);*/
        $lang = App\Models\Language::where('code', app()->getLocale())->first();
        $user =  Auth::guard()->user();
        $seller_check = $user->seller_type ?? null;
    @endphp
<!--====== App Content ======-->
<div class="app-content">

    <!--====== Section 1 ======-->
    <div class="u-s-p-t-90">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">

                    <!--====== Product Breadcrumb ======-->
                    <div class="pd-breadcrumb u-s-m-b-30">
                        <ul class="pd-breadcrumb__list">
                            <li class="has-separator"><a href="{{route('home')}}">{{trans('language.home')}}</a></li>
                            @foreach ($breadCrumb as $k => $v)
                                <li class="has-separator"><a href="{{env('APP_URL').'/category/'.strtolower($v).'_'.$k}}">{{$v}}</a> </li>
                            @endforeach
                            <li class="is-marked"><a href="{{$product->getUrl()}}">{{$product->name}}</a></li>
                        </ul>
                    </div>
                    <!--====== End - Product Breadcrumb ======-->


                    <!--====== Product Detail Zoom ======-->
                    <div class="pd u-s-m-b-30">
                        <div class="slider-fouc pd-wrap">
                            <div id="pd-o-initiate">
                                <div class="pd-o-img-wrap" data-src="{{ asset($product->getImage()) }}">

                                    <img style="max-height:370px!important;" class="u-img-fluid" src="{{ asset($product->getImage()) }}" data-zoom-image="{{ asset($product->getImage()) }}" alt=""></div>
                                @if ($product->images->count())
                                    @foreach ($product->images as $key=>$image)
                                    <div class="pd-o-img-wrap" data-src="{{ asset($image->getImage()) }}">

                                        <img style="max-height:370px!important;min-height:250px!important;" class="u-img-fluid" src="{{ asset($image->getImage()) }}" data-zoom-image="{{ asset($image->getImage()) }}" alt=""></div>
                                    @endforeach
                                @endif
                            </div>

                            <span class="pd-text">Click for larger zoom</span>
                        </div>
                        <div class="u-s-m-t-15">
                            <div class="slider-fouc">
                                <div id="pd-o-thumbnail">
                                    <div class="pd-o-img-wrap" data-src="{{ asset($product->getImage()) }}">

                                        <img style="max-height:370px!important;" class="u-img-fluid" src="{{ asset($product->getImage()) }}" data-zoom-image="{{ asset($product->getImage()) }}" alt=""></div>
                                    @if ($product->images->count())
                                        @foreach ($product->images as $key=>$image)
                                            <div>

                                                <img style="height:120px!important;" class="u-img-fluid" src="{{ asset($image->getImage()) }}" alt=""></div>
                                        @endforeach
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Product Detail Zoom ======-->
                </div>
                <div class="col-lg-7">

                    <!--====== Product Right Side Details ======-->
                    <div class="pd-detail">
                        <div>

                            <span class="pd-detail__name">{{ $product->name }}</span></div>
                        <div>
                            <div class="pd-detail__inline">

                                <span class="pd-detail__price">${{ $product->price }}</span>

<!--                                <span class="pd-detail__discount">(76% OFF)</span><del class="pd-detail__del">$28.97</del></div>-->
                        </div>
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__rating gl-rating-style">
                                @for ($i = 0; $i < 5; ++$i)
                                    <span style="color:{{$percent<= $i?' wheat':' #FFBC41'}}" data-index="{{$i}}" class="fa fa-star rateStar-{{$i}}"></span>
                                @endfor
                                <span class="pd-detail__review u-s-m-l-4">

                                        <a data-click-scroll="#view-review">{{$ratePercentage > 0 ? $ratePercentage.'%' : $ratePercentage}}</a></span>
                            </div>
                        </div>
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__inline">
                                @if($product->stock > 0)
                                    <span class="pd-detail__stock">{{trans('language.available')}}</span>
                                    <span class="pd-detail__stock">{{$product->stock}} in stock</span>
                                @elseif($product->stock <= 0)
                                    <span style="background-color: #FFE5DB;color:#FF4500" class="pd-detail__stock">{{trans('language.unavailable')}}</span>
                                @endif
                                <!--<span class="pd-detail__stock">200 in stock</span>
                                <span class="pd-detail__left">Only 2 left</span></div>-->
                        </div>
                            <!----- Company ----->
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__inline">
                                @php
                                    $company = $product->company()->first();
                                    if(isset($company) && ($company->visible == 1))
                                    {
                                        $company_name = $company->name;
                                    }else{
                                        $company_name = trans('language.dokanii');
                                    }
                                    $getRate = \App\Models\ShopProductLike::where(['users_id' => Auth::id(), 'product_id' => $product->id])->first();
                                @endphp
                                <span class="pd-detail__click-wrap">
                                    <a>{{trans('language.company').': '.$company_name}}</a>
                                </span>
                            </div>
                        </div>
                            <!----- Description ----->
                        <div class="u-s-m-b-15">
                            <span class="pd-detail__preview-desc">{{$description}}</span>
                        </div>
                            <!------ WishList ------->
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__inline">
                                <span class="pd-detail__click-wrap">
                                    <a class="wishlist_heart" onClick="addToCart('{{ $product->id  }}','wishlist',$(this))">
                                        <i class="far fa-heart u-s-m-r-6 heart"></i>{{trans('language.addToWishList')}}</a>
                                </span>
                            </div>
                        </div>
                            <!-------- Cart -------->
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__inline">
                                <span class="pd-detail__click-wrap">
                                    <a href="" onClick="addToCart('{{ $product->id }}','compare',$(this))" style="color: #a8a8a8">
                                    <i class="fa fa-refresh" style="color: #a8a8a8" ></i>  {{trans('language.compare')}}</a>
                                </span>
                            </div>
                        </div>
                        <div class="u-s-m-b-15">
                            <div class="pd-detail__inline">
                                <span class="pd-detail__click-wrap"><i class="far fa-building" aria-hidden="true"></i>
                                    <button style="outline:none;border:none;background:inherit;color: #7F7F7F" class="btn btn-default btn-content" onclick="window.open('{{$seller_check == 1 ? route('prod', ['id' => $product->id]) : route('registermerchantl')}}', '_self')">{{trans('language.sellProduct')}}</button>
                                </span>
                            </div>
                        </div>
                        <div class="u-s-m-b-15">
                            <ul class="pd-social-list">
                                <li>

                                    <a class="s-fb--color-hover" href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li>

                                    <a class="s-tw--color-hover" href="#"><i class="fab fa-twitter"></i></a></li>
                                <li>

                                    <a class="s-insta--color-hover" href="#"><i class="fab fa-instagram"></i></a></li>
                                <li>

                                    <a class="s-wa--color-hover" href="#"><i class="fab fa-whatsapp"></i></a></li>
                                <li>

                                    <a class="s-gplus--color-hover" href="#"><i class="fab fa-google-plus-g"></i></a></li>
                            </ul>
                        </div>
                        <div class="u-s-m-b-15">
                            <form class="pd-detail__form" action="{{ route('postCart') }}" method="post">
                                {{ csrf_field() }}
                                <input type="hidden" name="product_id" value="{{ $product->id }}">
                                <div class="pd-detail-inline-2">
                                    <div class="u-s-m-b-15">

                                        <!--====== Input Counter ======-->
                                        <div class="input-counter">

                                            <span class="input-counter__minus fas fa-minus"></span>

                                            <input class="input-counter__text input-counter--text-primary-style" type="text" name="qty" value="1" data-min="1" data-max="1000">

                                            <span class="input-counter__plus fas fa-plus"></span></div>
                                        <!--====== End - Input Counter ======-->
                                    </div>
                                    <div class="u-s-m-b-15">
                                        <button class="btn btn--e-brand-b-2" type="submit">{{trans('language.add_to_cart')}}</button></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--====== End - Product Right Side Details ======-->
                </div>
            </div>
        </div>
    </div>

    <!--====== Product Detail Tab ======-->
    <div class="u-s-p-y-90">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="pd-tab">
                        <div class="u-s-m-b-30">
                            <ul class="nav pd-tab__list">
                                <li class="nav-item">

                                    <a class="nav-link active" data-toggle="tab" href="#pd-desc">DESCRIPTION</a></li>
                                <li class="nav-item">

                                    <a class="nav-link" data-toggle="tab" href="#pd-tag">TAGS</a></li>
                                <li class="nav-item">

                                    <a class="nav-link" id="view-review" data-toggle="tab" href="#pd-rev">REVIEWS

                                        <span>(23)</span></a></li>
                            </ul>
                        </div>
                        <div class="tab-content">

                            <!--====== Tab 1 ======-->
                            <div class="tab-pane fade show active" id="pd-desc">
                                <div class="pd-tab__desc">
                                    <div class="u-s-m-b-15">
                                        <p>{!! html_entity_decode($product->content) !!}</p>
                                    </div>
                                    <!--<div class="u-s-m-b-30"><iframe src="https://www.youtube.com/embed/qKqSBm07KZk" allowfullscreen></iframe></div>
                                    <div class="u-s-m-b-30">
                                        <ul>
                                            <li><i class="fas fa-check u-s-m-r-8"></i>

                                                <span>Buyer Protection.</span></li>
                                            <li><i class="fas fa-check u-s-m-r-8"></i>

                                                <span>Full Refund if you don't receive your order.</span></li>
                                            <li><i class="fas fa-check u-s-m-r-8"></i>

                                                <span>Returns accepted if product not as described.</span></li>
                                        </ul>
                                    </div>
                                    <div class="u-s-m-b-15">
                                        <h4>PRODUCT INFORMATION</h4>
                                    </div>
                                    <div class="u-s-m-b-15">
                                        <div class="pd-table gl-scroll">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td>Main Material</td>
                                                    <td>Cotton</td>
                                                </tr>
                                                <tr>
                                                    <td>Color</td>
                                                    <td>Green, Blue, Red</td>
                                                </tr>
                                                <tr>
                                                    <td>Sleeves</td>
                                                    <td>Long Sleeve</td>
                                                </tr>
                                                <tr>
                                                    <td>Top Fit</td>
                                                    <td>Regular</td>
                                                </tr>
                                                <tr>
                                                    <td>Print</td>
                                                    <td>Not Printed</td>
                                                </tr>
                                                <tr>
                                                    <td>Neck</td>
                                                    <td>Round Neck</td>
                                                </tr>
                                                <tr>
                                                    <td>Pieces Count</td>
                                                    <td>1 Piece</td>
                                                </tr>
                                                <tr>
                                                    <td>Occasion</td>
                                                    <td>Casual</td>
                                                </tr>
                                                <tr>
                                                    <td>Shipping Weight (kg)</td>
                                                    <td>0.5</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                            <!--====== End - Tab 1 ======-->


                            <!--====== Tab 2 ======-->
                            <div class="tab-pane" id="pd-tag">
                                <div class="pd-tab__tag">
                                    <h2 class="u-s-m-b-15">ADD YOUR TAGS</h2>
                                    <div class="u-s-m-b-15">
                                        <form>

                                            <input class="input-text input-text--primary-style" type="text">

                                            <button class="btn btn--e-brand-b-2" type="submit">ADD TAGS</button></form>
                                    </div>

                                    <span class="gl-text">Use spaces to separate tags. Use single quotes (') for phrases.</span>
                                </div>
                            </div>
                            <!--====== End - Tab 2 ======-->


                            <!--====== Tab 3 ======-->
                            <div class="tab-pane" id="pd-rev">
                                <div class="pd-tab__rev">
                                    <div class="u-s-m-b-30">
                                        <div class="pd-tab__rev-score">
                                            <div class="u-s-m-b-8">
                                                <h2 style="margin-bottom:7px">
                                                    <span style="display:inline" class="userCount">{{$userCount}}</span>
                                                    Reviews -
                                                    <span style="display:inline" class="percent">{{$percent}}</span> (Overall)</h2>
                                                <div>
                                                    @for ($i = 0; $i < 5; ++$i)
                                                        <span style="color:{{$percent<= $i?' wheat':' #FFBC41'}}" data-index="{{$i}}" class="fa fa-star rateStar-{{$i}}"></span>
                                                    @endfor
                                                </div>
                                            </div>
                                            <div class="u-s-m-b-8">
                                                <h4>We want to hear from you!</h4>
                                            </div>

                                            <span class="gl-text">Tell us what you think about this item</span>
                                        </div>
                                    </div>
<!--                                    <div class="u-s-m-b-30">
                                        <form class="pd-tab__rev-f1">
                                            <div class="rev-f1__group">
                                                <div class="u-s-m-b-15">
                                                    <h2>23 Review(s) for Man Ruched Floral Applique Tee</h2>
                                                </div>
                                                <div class="u-s-m-b-15">

                                                    <label for="sort-review"></label><select class="select-box select-box&#45;&#45;primary-style" id="sort-review">
                                                        <option selected>Sort by: Best Rating</option>
                                                        <option>Sort by: Worst Rating</option>
                                                    </select></div>
                                            </div>
                                            <div class="rev-f1__review">
                                                <div class="review-o u-s-m-b-15">
                                                    <div class="review-o__info u-s-m-b-8">

                                                        <span class="review-o__name">John Doe</span>

                                                        <span class="review-o__date">27 Feb 2018 10:57:43</span></div>
                                                    <div class="review-o__rating gl-rating-style u-s-m-b-8"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                        <span>(4)</span></div>
                                                    <p class="review-o__text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                </div>
                                                <div class="review-o u-s-m-b-15">
                                                    <div class="review-o__info u-s-m-b-8">

                                                        <span class="review-o__name">John Doe</span>

                                                        <span class="review-o__date">27 Feb 2018 10:57:43</span></div>
                                                    <div class="review-o__rating gl-rating-style u-s-m-b-8"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                        <span>(4)</span></div>
                                                    <p class="review-o__text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                </div>
                                                <div class="review-o u-s-m-b-15">
                                                    <div class="review-o__info u-s-m-b-8">

                                                        <span class="review-o__name">John Doe</span>

                                                        <span class="review-o__date">27 Feb 2018 10:57:43</span></div>
                                                    <div class="review-o__rating gl-rating-style u-s-m-b-8"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                        <span>(4)</span></div>
                                                    <p class="review-o__text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                </div>
                                            </div>
                                        </form>
                                    </div>-->
                                    <div class="u-s-m-b-30">
                                        <form class="pd-tab__rev-f2">
                                            <h2 class="u-s-m-b-15">Add a Review</h2>

                                            <span class="gl-text u-s-m-b-15">Your email address will not be published. Required fields are marked *</span>
                                            <div class="u-s-m-b-30">
                                                <div class="rev-f2__table-wrap gl-scroll">
                                                    <table class="rev-f2__table">
                                                        <thead>
                                                        <tr>
                                                            <th>
                                                                <div class="gl-rating-style-2"><i class="fas fa-star"></i>

                                                                    <span>(1)</span></div>
                                                            </th>
                                                            <th>
                                                                <div class="gl-rating-style-2"><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                                                    <span>(2)</span></div>
                                                            </th>
                                                            <th>
                                                                <div class="gl-rating-style-2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                                                    <span>(3)</span></div>
                                                            </th>
                                                            <th>
                                                                <div class="gl-rating-style-2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                                                    <span>(4)</span></div>
                                                            </th>
                                                            <th>
                                                                <div class="gl-rating-style-2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                                                    <span>(5)</span></div>
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>

                                                                <!--====== Radio Box ======-->
                                                                <div class="radio-box">

                                                                    <input class="fstar" type="radio" id="star-1" name="rating" data-index="0">
                                                                    <div class="radio-box__state radio-box__state--primary">

                                                                        <label class="radio-box__label" for="star-1"></label></div>
                                                                </div>
                                                                <!--====== End - Radio Box ======-->
                                                            </td>
                                                            <td>

                                                                <!--====== Radio Box ======-->
                                                                <div class="radio-box">

                                                                    <input class="fstar" type="radio" id="star-2" name="rating" data-index="1">
                                                                    <div class="radio-box__state radio-box__state--primary">

                                                                        <label class="radio-box__label" for="star-2"></label></div>
                                                                </div>
                                                                <!--====== End - Radio Box ======-->
                                                            </td>
                                                            <td>

                                                                <!--====== Radio Box ======-->
                                                                <div class="radio-box">

                                                                    <input class="fstar" type="radio" id="star-3" name="rating" data-index="2">
                                                                    <div class="radio-box__state radio-box__state--primary">

                                                                        <label class="radio-box__label" for="star-3"></label></div>
                                                                </div>
                                                                <!--====== End - Radio Box ======-->
                                                            </td>
                                                            <td>

                                                                <!--====== Radio Box ======-->
                                                                <div class="radio-box">

                                                                    <input class="fstar" type="radio" id="star-4" name="rating" data-index="3">
                                                                    <div class="radio-box__state radio-box__state--primary">

                                                                        <label class="radio-box__label" for="star-4"></label></div>
                                                                </div>
                                                                <!--====== End - Radio Box ======-->
                                                            </td>
                                                            <td>

                                                                <!--====== Radio Box ======-->
                                                                <div class="radio-box">

                                                                    <input class="fstar" type="radio" id="star-5" name="rating" data-index="4">
                                                                    <div class="radio-box__state radio-box__state--primary">

                                                                        <label class="radio-box__label" for="star-5"></label></div>
                                                                </div>
                                                                <!--====== End - Radio Box ======-->
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="rev-f2__group">
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="reviewer-text">YOUR REVIEW *</label><textarea class="text-area text-area--primary-style" id="reviewer-text"></textarea></div>
                                                <div>
                                                    <p class="u-s-m-b-30">

                                                        <label class="gl-label" for="reviewer-name">NAME *</label>

                                                        <input class="input-text input-text--primary-style" type="text" id="reviewer-name"></p>
                                                    <p class="u-s-m-b-30">

                                                        <label class="gl-label" for="reviewer-email">EMAIL *</label>

                                                        <input class="input-text input-text--primary-style" type="text" id="reviewer-email"></p>
                                                </div>
                                            </div>
                                            <div>

                                                <button class="btn btn--e-brand-shadow" type="submit">SUBMIT</button></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--====== End - Tab 3 ======-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Product Detail Tab ======-->
    @php
        $lastViewed = json_decode(Cookie::get('productsLastView'));
    @endphp
    <div class="u-s-p-b-90">
        @if($lastViewed !== null)
        <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">CUSTOMER ALSO VIEWED</h1>

                                <span class="section__span u-c-grey">PRODUCTS THAT CUSTOMER VIEWED</span>
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
                            @foreach($lastViewed as $key => $value)
                                @php
                                    $value = \App\Models\ShopProduct::find($key);
                                @endphp
                                <div class="u-s-m-b-30">
                                    <div class="product-o product-o--hover-on">
                                        <div class="product-o__wrap">

                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{$value->getUrl() }}">

                                            <img class="aspect__img" src="{{asset($value->getImage())}}" alt=""></a>
                                            <div class="product-o__action-wrap">
                                                <ul class="product-o__action-list">
                                                    <li>

                                                        <a data-modal="modal" data-modal-id="#quick-look" class="quickLook" data-index="{{$value->id}}" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                    <li>

                                                        <a data-modal="modal" onClick="addToCart('{{ $value->id }}','default',$(this))" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                    <li>

                                                        <a href="#" onClick="addToCart('{{ $product->id }}','wishlist',$(this))" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                    <li>

                                                        <a href="#" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <span class="product-o__category">

                                            <a href="">{{$value->category()->first()->name}}</a></span>

                                        <span class="product-o__name">

                                            <a href="{{$value->getUrl()}}">{{$value->getName()}}</a></span>
                                        <div class="product-o__rating gl-rating-style">
                                            @php
                                                $rate = (new \App\Models\ShopProductLike)->getRate($value->id);
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

                                        <span class="product-o__price">{{$value->price}}</span>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        @else
        <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">PRODUCTS YOU MAY LIKE</h1>

                                <span class="section__span u-c-grey">PRODUCTS THAT CUSTOMER MAY LIKE</span>
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
                            $products = \App\Models\ShopProduct::where('category_id', $product->category_id)->limit(5)->get();
                        @endphp
                        @foreach($products as $product)
                            <div class="u-s-m-b-30">
                                <div class="product-o product-o--hover-on">
                                    <div class="product-o__wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{$product->getUrl() }}">

                                            <img class="aspect__img" src="{{asset($product->getImage())}}" alt=""></a>
                                        <div class="product-o__action-wrap">
                                            <ul class="product-o__action-list">
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#quick-look" class="quickLook" data-index="{{$product->id}}" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                <li>

                                                    <a data-modal="modal" onClick="addToCart('{{ $product->id }}','default',$(this))" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                <li>

                                                    <a href="#" onClick="addToCart('{{ $product->id }}','wishlist',$(this))" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                <li>

                                                    <a href="#" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <span class="product-o__category">

                                                <a href="shop-side-version-2.html">{{$product->category()->first()->name}}</a></span>

                                    <span class="product-o__name">

                                                <a href="{{$product->getUrl()}}">{{$product->name}}</a></span>
                                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                        <span class="product-o__review">(20)</span></div>

                                    <span class="product-o__price">{{$product->price}}</span>
                                </div>
                            </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endif
        <!--====== End - Section Content ======-->
    </div>
    <!--====== End - Section 1 ======-->
</div>
<!--====== End - App Content ======-->
@endsection
    @push('scripts')
        <script>
            var ratedIndex = -1, uID = {{Auth::id() ?? 0}};
            var rate = {{$productLike['rate'] ?? 0}};
            var getUserRate = {{$getRate->rate ?? 0}};
            $(document).ready(function () {
                localStorage.setItem('ratedIndex', -1);
                if (localStorage.getItem('ratedIndex') != null) {
                    uID = localStorage.getItem('uID');
                }

                $('.fstar').on('click', function () {
                    @if(Auth::id() != null)
                        ratedIndex = parseInt($(this).data('index'));
                    localStorage.setItem('ratedIndex', ratedIndex);
                    saveToTheDB();
                    @else
                    window.location.replace("{{ route('login') }}");
                    @endif
                });
                if (ratedIndex == -1) {
                    $('#star-'+getUserRate).attr('checked',true);
                }
            });

            function saveToTheDB() {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: "{{ route('productRate') }}",
                    method: "POST",
                    dataType: 'json',
                    data: {
                        _token: '{{csrf_token()}}',
                        uID: "{{Auth::id() ?? 0}}",
                        ratedIndex: ratedIndex,
                        productID:  {{ $product->id }} ,
                        companyID: {{ $product->company()->first()->id ?? 0}},
                    },
                    success: function (result) {
                        uID = result.id;
                        localStorage.setItem('uID', uID);
                        $(".ratePercentage").html(result.ratePercentage+'%');
                        $(".ratePercentage2").html(result.ratePercentage+'%'+' من المستخدمين ينصحون بهذا المنتج لصديق.');
                        $(".percent").html(result.percent);
                        $(".userCount").html(result.userCount);
                        for (var i=0; i <= 4; i++){
                            if($(".rateStar-"+i).data('index') < result.percent){
                                $(".rateStar-"+i).css('color', '#FFBC41');
                            }else{
                                $(".rateStar-"+i).css('color', 'wheat');
                            }
                        }
                        for (let i=0;i< result.productLikes.length;i++)
                        {
                            let star = result.productLikes[i];
                            let percent = star.user_count * 100 / result.userCount;
                            $("#label-"+star.rate).html("("+star.user_count+")");
                            $("#star-"+star.rate).css("width", percent+"%");
                        }
                    },
                });
            }
        </script>
    @endpush
