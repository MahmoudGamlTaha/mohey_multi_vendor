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
    <div class="col-md-2"></div>
    <div class="col-md-8" style="height: 80px ; padding: 15px; border: 1px solid #dad6d6;">
        <div class="carousel slide" id="myCarouse2" >
            <div class="carousel-inner" style="height: 80px ;" >
                @php
                $index = 0;
                @endphp
                @foreach($brands as $key => $brand)
                @if(($index) % 4 == 0)
                <div class="{{ ($key)?'item':'item active' }}">
                    @endif
                    <div class="col-xs-3"><a href="{{$brand->getUrl()}}" style="float: left ; margin-left:40px;"><img src="{{$brand->getImage()}}"
                                style="width:100px;"></a></div>
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
    <div class="col-md-2"></div>

    <a class="left carousel-control" href="#myCarouse2" data-slide="prev"><i
            class="glyphicon glyphicon-chevron-left"></i></a>
    <a class="right carousel-control" href="#myCarouse2" data-slide="next"><i
            class="glyphicon glyphicon-chevron-right"></i></a>
</div>
</div>


<hr>
<!-- Contenttttt-->
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
        <div class="thumbnail product-image-wrapper product-single">
            <div class=" single-products product-box-{{ $item->id }}">
                <a href="{{ $item->getUrl() }}"> <img src="{{ asset( $item->getThumb()) }}" style="width:100%;height:150px;" alt="" /></a>
                     {!! $item->showPrice() !!}
                <ul class="nav nav-pills nav-justified" >
                    <li class="cart1"> <a class="btn btn-default add-to-cart" 
                            onClick="addToCart('{{ $item->id }}','default',$(this))">
                           {{trans('language.add_to_cart')}}  <i class="fa fa-shopping-cart"></i> </a></li>
                    <li class="fav"> <a class="btn btn-default add-to-cart"  
                            onClick="addToCart('{{ $item->id }}','wishlist',$(this))"><i class="fa fa-heart"></i></a>
                    </li>
                </ul>

            </div>
        </div>
    </div>
    @endforeach

      
</div>
<div class="col-sm-2 home-top-row-ads">
    <div class="product-image-wrapper product-single" style="height:442px">

        @if(isset($firstBest))
        <div class="single-products product-box-{{$firstBest->id }}">
            <a href="{{ $firstBest->getUrl() }}"> <img src="{{ asset( $firstBest->getThumb()) }}"
                    style="width:100%;height:380px;" alt="" /></a>
                   {!! $firstBest->showPrice() !!}
            <ul class="nav nav-pills nav-justified">
                <li class="cart1"> <a class="btn btn-default add-to-cart"
                        onClick="addToCart('{{ $firstBest->id }}','default',$(this))">
                        {{trans('language.add_to_cart')}} <i class="fa fa-shopping-cart"></i> </a></li>
                <li class="fav"> <a class="btn btn-default add-to-cart"
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
<hr>


<div class=" row features_items" style="">
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
    {{-- <div class="row"  style="background-color: #10243f;height: 50px;padding: 10px 5px;margin-bottom: 3px;">
        <div class="col-md-2">
        <h2 class="title text-center center-block " style="color: white"> الاكثر مبيعا </h2>
        </div> 

        <div class="col-md-8" style="background-color: #10243f;height: 50px;padding: 10px 5px;margin-bottom: 3px;">
        <a href="{{$value[0]->getUrl() }}">
            <h2 class="title text-center center-block"  style="color: white">{{ $value[0]->name }}</h2>
        </a>
        </div>

        <div class="col-md-2" style="background-color: #10243f;height: 50px;padding: 10px 5px;margin-bottom: 3px;">
        <h2 class="title text-center center-block "  style="color: white"> افضل عرض </h2>
        </div> 
    </div> --}}

    <div class="row" >
        <div class="col-sm-2" style="padding:0">
            <div  style="background-color: #10243f;height: 50px;padding: 10px 5px;margin-bottom: 3px;">
                <h2 class="title text-center center-block " style="color: white"> الاكثر مبيعا </h2>
            </div> 
            @for($i = 0; $i < count($products_most); $i++) @if($products_most[$i]->category_id == $value[0]->id && $countBest < 4)
                <div class="col-sm-5" style="border: 1px solid #eee; margin: 5px 8px; padding: 0">
                    <a href="{{ $products_most[$i]->getUrl() }}">
                        <img src="{{ asset($products_most[$i]->getThumb()) }}" style="width:87px; height:100px;"   alt="" />
                    </a>
                 </div>
            @elseif($counter < 4)
         <div class="col-sm-5" style="border: 1px solid #eee; margin: 5px 8px; padding: 0">
            <img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:87px;height:100px;">
         </div>
            @php $countBest++ @endphp
            @endif
            @endfor
        </div>




<div class="col-sm-8"  style=" " >

    <div style="background-color: #10243f;height: 50px;padding: 10px 5px;margin-bottom: 15px;">
        <a href="{{$value[0]->getUrl() }}">
            <h2 class="title text-center center-block"  style="color: white">{{ $value[0]->name }}</h2>
        </a>
    </div>

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
                        <li class="cart1"> <a class="btn btn-default add-to-cart"
                                onClick="addToCart('{{ $product->id }}','default',$(this))">
                                {{trans('language.add_to_cart')}} <i class="fa fa-shopping-cart"></i> </a></li>
                        <li class="fav"> <a class="btn btn-default add-to-cart"
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


<div class="col-sm-2" style="padding: 0">
    <div  style="background-color: #10243f;height: 50px;padding: 10px 5px;margin-bottom: 3px;">
        <h2 class="title text-center center-block "  style="color: white"> افضل عرض </h2>
        </div> 

        @if(isset($bestPrice))
    <div class="product-image-wrapper product-single" style="margin : 0">
        <div class="single-products product-box-{{ $bestPrice->id }}">
            <a href="{{ $bestPrice->getUrl() }}"><img src="{{ asset($bestPrice->getThumb()) }}"
                    style="width:100%;height:auto;" alt="" /></a>
                   
                    <p style="text-align: center"> {!! $bestPrice->showPrice() !!} </p>
            
            <ul class="nav nav-pills nav-justified">
                <li class="cart1"> <a class="btn btn-default add-to-cart"
                        onClick="addToCart('{{ $bestPrice->id }}','default',$(this))">
                            {{trans('language.add_to_cart')}} <i class="fa fa-shopping-cart"></i> </a></li>
                <li class="fav"> <a class="btn btn-default add-to-cart"
                        onClick="addToCart('{{ $bestPrice->id }}','wishlist',$(this))"><i class="fa fa-heart"></i></a>
                </li>
            </ul>
        </div>
    </div>
        @else
        <img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:100%;height:320px;">
        @endif
    </div>
</div>
@endforeach
</div>


<!--features_items  - الاقسام المميزة-->
@include('blockView/featured_category')


@endsection



@push('styles')
@endpush

@push('scripts')

@endpush