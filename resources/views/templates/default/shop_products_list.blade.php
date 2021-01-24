@extends($theme.'.shop_layout')

@section('center')
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-y-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop-p">
                            <div class="shop-p__toolbar u-s-m-b-30">
                                <div class="shop-p__meta-wrap u-s-m-b-60">

                                    <span class="shop-p__meta-text-1">FOUND {{count($products)}} RESULTS</span>
                                </div>
                                <div class="shop-p__tool-style">
                                    <div class="tool-style__group u-s-m-b-8">

                                        <span class="js-shop-filter-target" data-side="#side-filter">Filters</span>

                                        <span class="js-shop-grid-target is-active">Grid</span>

                                        <span class="js-shop-list-target">List</span></div>
                                    <form>
                                        <div class="tool-style__form-wrap">
                                            <div class="u-s-m-b-8"><select class="select-box select-box--transparent-b-2">
                                                    <option>Show: 8</option>
                                                    <option selected>Show: 12</option>
                                                    <option>Show: 16</option>
                                                    <option>Show: 28</option>
                                                </select></div>
                                            <div class="u-s-m-b-8"><select class="select-box select-box--transparent-b-2">
                                                    <option selected>Sort By: Newest Items</option>
                                                    <option>Sort By: Latest Items</option>
                                                    <option>Sort By: Best Selling</option>
                                                    <option>Sort By: Best Rating</option>
                                                    <option>Sort By: Lowest Price</option>
                                                    <option>Sort By: Highest Price</option>
                                                </select></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="shop-p__collection">
                                <div class="row is-grid-active">
                                    @foreach ($products as $item)
                                        <div class="col-lg-3 col-md-4 col-sm-6">
                                            <div class="product-m">
                                                <div class="product-m__thumb">

                                                    <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{ $item->getUrl() }}">

                                                        <img class="aspect__img" src="{{ asset( $item->getThumb()) }}" alt=""></a>
                                                    <div class="product-m__quick-look">

                                                        <a class="fas fa-search" data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick Look"></a></div>
                                                    <div class="product-m__add-cart">

                                                        <a class="btn--e-brand" onClick="addToCart('{{ $item->id }}','default',$(this))" data-modal="modal" data-modal-id="#add-to-cart">Add to Cart</a></div>
                                                </div>
                                                <div class="product-m__content">

                                                    <div class="product-m__name">

                                                        <a href="product-detail.html">{{ $item->name }}</a></div>
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
                                                    <div class="product-m__price">{{ $item->price }}</div>
                                                    <div class="product-m__hover">
                                                        <div class="product-m__preview-description">

                                                            <span>{{ $item->description }}</span></div>
                                                        <div class="product-m__wishlist">

                                                            <a class="far fa-heart" onClick="addToCart('{{ $item->id }}','wishlist',$(this))" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="u-s-p-y-60">

                                <!--====== Pagination ======-->
                                <ul class="shop-p__pagination">
                                    <li class="is-active">

                                        <a href="#">1</a></li>
                                    <li>

                                        <a href="#">2</a></li>
                                    <li>

                                        <a href="#">3</a></li>
                                    <li>

                                        <a href="#">4</a></li>
                                    <li>

                                        <a class="fas fa-angle-right" href="shop-grid-full.html"></a></li>
                                </ul>
                                <!--====== End - Pagination ======-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section 1 ======-->
    </div>
    <!--====== End - App Content ======-->
@endsection