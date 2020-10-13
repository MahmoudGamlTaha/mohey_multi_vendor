@extends($theme.'.shop_layout')

@section('center')
<!-- sprint 3-->

@foreach($categories as $key => $value)
@php
$firstBest = null;
$counter = 0;
if($value[0]->four_best_product == 1)
$products = \App\Models\ShopProduct::where(['status'=> 1,'category_id' => $value[0]->id])->sort()->orderBy('price',
'desc')->paginate(13);
@endphp
@if(isset($products))
<div class="row">
    <div class="col-md-6 col-md-offset-2" style="height: 70px">
        <div class="carousel slide" id="myCarouse2" style="height: 70px">
            <div class="carousel-inner" style="height: 70px">
                @php
                $index = 0;
                @endphp
                @foreach($brands as $key => $brand)
                @if(($index) % 4 == 0)
                <div class="{{ ($key)?'item':'item active' }}">
                    @endif
                    <div class="col-xs-3"><a href="{{$brand->getUrl()}}"><img src="{{$brand->getImage()}}"
                                style="height: 50px; width:60px;border:1px solid black;"></a></div>
                    @if(($index + 1) % 4 == 0)
                </div>
                @endif
                @php
                $index++;
                @endphp
                @endforeach
                @if(count($brands) % 4 != 0 )
            </div>
        </div>
        @endif
    </div>
    <a class="left carousel-control" href="#myCarouse2" data-slide="prev"><i
            class="glyphicon glyphicon-chevron-left"></i></a>
    <a class="right carousel-control" href="#myCarouse2" data-slide="next"><i
            class="glyphicon glyphicon-chevron-right"></i></a>
</div>
</div>
<div class="col-sm-10">

    @foreach($products as $item)
    @php
    if($counter == 0){
    $firstBest = $item;
    $counter++;
    continue;
    }
    $counter++;
    @endphp
    <div class="col-sm-2 home-top-row-ads">
        <div class="product-image-wrapper product-single">
            <div class="single-products product-box-{{ $item->id }}">
                <a href="{{ $item->getUrl() }}"> <img src="{{ asset( $item->getThumb()) }}"
                        style="width:100%;height:150px;" alt="" /></a>
                     {!! $item->showPrice() !!}
                <ul class="nav nav-pills nav-justified">
                    <li> <a class="btn btn-default add-to-cart"
                            onClick="addToCart('{{ $item->id }}','default',$(this))"><i
                                class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a></li>
                    <li> <a class="btn btn-default add-to-cart"
                            onClick="addToCart('{{ $item->id }}','wishlist',$(this))"><i class="fa fa-heart"></i></a>
                    </li>
                </ul>

            </div>
        </div>
    </div>
    @endforeach
</div>
<div class="col-sm-2 home-top-row-ads">
    <div class="product-image-wrapper product-single">

        @if(isset($firstBest))
        <div class="single-products product-box-{{$firstBest->id }}">
            <a href="{{ $firstBest->getUrl() }}"> <img src="{{ asset( $firstBest->getThumb()) }}"
                    style="width:100%;height:310px;" alt="" /></a>
                   {!! $firstBest->showPrice() !!}
            <ul class="nav nav-pills nav-justified">
                <li> <a class="btn btn-default add-to-cart"
                        onClick="addToCart('{{ $firstBest->id }}','default',$(this))"><i
                            class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a></li>
                <li> <a class="btn btn-default add-to-cart"
                        onClick="addToCart('{{ $firstBest->id }}','wishlist',$(this))"><i class="fa fa-heart"></i></a>
                </li>
            </ul>
        </div>
        @else
        <img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:100%;height:320px;"></img>
        @endif

    </div>
</div>
</div>
@endif
@endforeach
<br />
<div class=" row features_items">
    <!--features_items-->
    @foreach($categories as $key => $value)
    @php
    $counter = 0;
    $products = \App\Models\ShopProduct::where(['status'=> 1,'category_id' => $value[0]->id])->orderBy('price',
    'ASC')->paginate(10);
    $bestSale = DB::table('shop_order_detail');
    $bestPrice = null;
    $countBest = 0;
    @endphp
    <div class="row">
    <div class="col-md-4">
      <h2 class="title text-center center-block padding-right-200"> الاكثر مبيعا </h2>
      </div> 
    <div class="col-md-4">
        <a href="{{$value[0]->getUrl() }}">
            <h2 class="title text-center center-block">{{ $value[0]->name }}</h2>
        </a>
      </div>
      <div class="col-md-4">
      <h2 class="title text-center center-block padding-left-200"> افضل عرض </h2>
      </div> 
    
    </div>
    <div class="row">
        <div class="col-sm-2">
            <!--<h3 class="text-center">الاكثر مبيعا</h3> -->
            @for($i = 0; $i < count($products_most); $i++) @if($products_most[$i]->category_id == $value[0]->id &&
                $countBest < 4) <div class="col-sm-6" style="padding:2px;">
                    <a href="{{ $products_most[$i]->getUrl() }}">
                        <img src="{{ asset($products_most[$i]->getThumb()) }}" style="width:100%;height:100%;"
                            alt="" /></a>
        </div>
        @elseif($counter < 4) <div class="col-sm-6" style="padding:2px;">
            <img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:70%;height:120px;"></img>
    </div>
    @php $countBest++ @endphp
    @endif
    @endfor
</div>
<div class="col-sm-8">
    @foreach ($products as $key => $product)
    @php

    $size = $products->count() > 5? 2 : 3;

    if($counter == 0) {
    $bestPrice = $product;
    $counter++;
    continue;
    }
    @endphp
    <div class="col-sm-{{$size}}" style="float: right;">
        <div class="product-image-wrapper product-single">
            <div class="single-products product-box-{{ $product->id }}">
                <div class="productinfo text-center">
                    <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}"
                            alt="{{ $product->name }}" /></a>
                    {!! $product->showPrice() !!}
                    <a href="{{ $product->getUrl() }}">
                        <p>{{ $product->name }}</p>
                    </a>
                    <ul class="nav nav-pills nav-justified">
                        <li> <a class="btn btn-default add-to-cart"
                                onClick="addToCart('{{ $product->id }}','default',$(this))"><i
                                    class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a></li>
                        <li> <a class="btn btn-default add-to-cart"
                                onClick="addToCart('{{ $product->id }}','wishlist',$(this))"><i
                                    class="fa fa-heart"></i></a></li>
                    </ul>
                </div>
                @if ($product->price > $product->getPrice())
                <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                @elseif($product->type == 1)
                <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                @endif
            </div>
            <div class="choose">
                <ul class="nav nav-pills nav-justified">

                  <!--  <li><a onClick="addToCart('{{ $product->id }}','compare',$(this))"><i
                                class="fa fa-plus-square"></i>{{trans('language.add_to_compare')}}</a></li> -->
                </ul>
            </div>
        </div>
    </div>

    @endforeach

</div>
<div class="col-sm-2">
    <!--<h3 class="text-center">افضل عرض</h3> -->
    @if(isset($bestPrice))
    <div class="product-image-wrapper product-single">
        <div class="single-products product-box-{{ $bestPrice->id }}">
            <a href="{{ $bestPrice->getUrl() }}"><img src="{{ asset($bestPrice->getThumb()) }}"
                    style="width:100%;height:auto;" alt="" /></a>
                    {!! $bestPrice->showPrice() !!} 
            <ul class="nav nav-pills nav-justified">
                <li> <a class="btn btn-default add-to-cart"
                        onClick="addToCart('{{ $bestPrice->id }}','default',$(this))"><i
                            class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a></li>
                <li> <a class="btn btn-default add-to-cart"
                        onClick="addToCart('{{ $bestPrice->id }}','wishlist',$(this))"><i class="fa fa-heart"></i></a>
                </li>
            </ul>
        </div>
    </div>
        @else
        <img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:100%;height:320px;"></img>
        @endif
    </div>
</div>
@endforeach
</div>
<!--features_items-->
@include('blockView/featured_category')


@endsection



@push('styles')
@endpush

@push('scripts')

@endpush