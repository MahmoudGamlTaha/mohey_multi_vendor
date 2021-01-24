@extends($theme.'.shop_layout')

@section('center')
    <!--====== App Content ======-->
    <div class="app-content">
        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">
            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary">Wishlist</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->
            @if (count($wishlist) ==0)
                <!--====== App Content ======-->
                    <div class="app-content">

                        <!--====== Section 1 ======-->
                        <div class="u-s-p-y-60">

                            <!--====== Section Content ======-->
                            <div class="section__content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 u-s-m-b-30">
                                            <div class="empty">
                                                <div class="empty__wrap">

                                                    <span class="empty__big-text">EMPTY</span>

                                                    <span class="empty__text-1">No items found on your wishlist.</span>

                                                    <a class="empty__redirect-link btn--e-brand" href="{{route('home')}}">CONTINUE SHOPPING</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--====== End - Section Content ======-->
                        </div>
                        <!--====== End - Section 1 ======-->
                    </div>
                    <!--====== End - App Content ======-->
            @else
            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            @foreach($wishlist as $item)
                                @php
                                    $n = (isset($n)?$n:0);
                                    $n++;
                                    $product = App\Models\ShopProduct::find($item->id);
                                @endphp
                            <!--====== Wishlist Product ======-->
                            <div class="w-r u-s-m-b-30">
                                <div class="w-r__container">
                                    <div class="w-r__wrap-1">
                                        <div class="w-r__img-wrap">

                                            <img class="u-img-fluid" src="{{asset($product->getImage())}}" alt=""></div>
                                        <div class="w-r__info">

                                                    <span class="w-r__name">

                                                        <a href="{{$product->getUrl() }}">{{ $product->name }}</a></span>

                                            <span class="w-r__category">

                                                        <a href="#">{{$product->category()->first()->name}}</a></span>

                                            <span class="w-r__price">{{$product->price}}</span>
                                        </div>
                                    </div>
                                    <div class="w-r__wrap-2">

                                        <a class="w-r__link btn--e-brand-b-2" onClick="addToCart('{{ $product->id }}','default',$(this))" data-modal="modal" data-modal-id="#add-to-cart">ADD TO CART</a>

                                        <a class="w-r__link btn--e-transparent-platinum-b-2" href="{{$product->getUrl() }}">VIEW</a>

                                        <a class="w-r__link btn--e-transparent-platinum-b-2" onClick="return confirm('Confirm')" href="{{url("removeItemWishlist/$item->rowId")}}">REMOVE</a></div>
                                </div>
                            </div>
                            @endforeach
                            <!--====== End - Wishlist Product ======-->
                        </div>
                        <div class="col-lg-12">
                            <div class="route-box">
                                <div class="route-box__g">

                                    <a class="route-box__link" href="{{route('home')}}"><i class="fas fa-long-arrow-alt-left"></i>

                                        <span>CONTINUE SHOPPING</span></a></div>
                                <div class="route-box__g">

                                    <a class="route-box__link" href="#"><i class="fas fa-trash"></i>

                                        <span>CLEAR WISHLIST</span></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            @endif
        </div>
        <!--====== End - Section 2 ======-->
    </div>
<!--====== End - App Content ======-->
@endsection
