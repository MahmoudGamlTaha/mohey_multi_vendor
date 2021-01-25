@extends($theme.'.shop_layout')
@if(session()->has('error'))
    <div class="alert alert-danger">
        {{ session()->get('error') }}
    </div>
@endif
<style>
    .minus-btn{
        left: 0;
        position: absolute;
        border: none !important;
        top: 0;
        display: inline-block;
        cursor: pointer;
        font-size: 10px;
        text-align: center;
        width: 50px;
        line-height: 50px;
        height: 100%;
        border-radius: 34px;
        outline: none;
        background-color: #F1F1F1;
        color: #333;
    }
    .plus-btn{
        right: 0;
        position: absolute;
        border: none !important;
        top: 0;
        display: inline-block;
        cursor: pointer;
        font-size: 10px;
        text-align: center;
        width: 50px;
        line-height: 50px;
        height: 100%;
        border-radius: 34px;
        outline: none;
        background-color: #F1F1F1;
        color: #333;
    }
    .qty-input{
        outline: none;
        border: none !important;
        display: block;
        background-color: #F1F1F1;
        height: 50px;
        width: 100%;
        border-radius: 34px;
        font-weight: 600;
        font-size: 14px;
        text-align: center;
    }
</style>
@section('main')
    @if(isset($cart) && sizeof($cart) > 0)
            <!--====== App Content ======-->
            <div class="app-content">

                <!--====== Section 1 ======-->
                <div class="u-s-p-y-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="breadcrumb">
                                <div class="breadcrumb__wrap">
                                    <ul class="breadcrumb__list">
                                        <li class="has-separator">

                                            <a href="index.html">Home</a></li>
                                        <li class="is-marked">

                                            <a href="cart.html">Cart</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section 1 ======-->


                <!--====== Section 2 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Intro ======-->
                    <div class="section__intro u-s-m-b-60">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section__text-wrap">
                                        <h1 class="section__heading u-c-secondary">SHOPPING CART</h1>
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
                                <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                                    <div class="table-responsive">
                                        <table class="table-p">
                                            <tbody>

                                            <!--====== Row ======-->
                                            @foreach($cart as $item)
                                                @php
                                                    $product = App\Models\ShopProduct::find($item->id);
                                                    $category = \App\Models\ShopCategoryDescription::where('shop_category_id', $product->category_id)->first();
                                                    $uofms = \App\Models\UofmGroups::where('id', $product->uofm_groups)->first();
                                                @endphp
                                                <tr>
                                                    <td>
                                                        <div class="table-p__box">
                                                            <div class="table-p__img-wrap">

                                                                <a href="{{$product->getUrl() }}"><img class="u-img-fluid" src="{{asset($product->getImage())}}" alt=""></a></div>
                                                            <div class="table-p__info">

                                                                <span class="table-p__name">

                                                                    <a href="{{$product->getUrl() }}">{{$product->getName()}}</a></span>

                                                                <span class="table-p__category">

                                                                    <a href="shop-side-version-2.html">{{$category->name}}</a></span>
<!--                                                                <ul class="table-p__variant-list">
                                                                    <li>

                                                                        <span>Size: 22</span></li>
                                                                    <li>

                                                                        <span>Color: Red</span></li>
                                                                </ul>-->
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>

                                                        <span class="table-p__price subtotal-{{$item->rowId}}">{{\Helper::currencyRender($item->subtotal)}}</span></td>
                                                    <td>
                                                        <div class="table-p__input-counter-wrap">

                                                            <!--====== Input Counter ======-->
                                                            <div class="input-counter">
                                                                <button class="minus-btn fas fa-minus" id="decreasex" onClick="decreseAmount('{{$item->rowId}}', {{ $item->id }});"></button>

                                                                <input class="qty-input item-qty" onChange="updateCart('{{$item->rowId}}', {{ $item->id }});" type="text" id="item-{{$item->id}}" class="item-qty" value="{{$item->qty}}" name="qty-{{$item->id}}" readonly>

                                                                <button class="plus-btn fas fa-plus" id="increasex" onClick="increaseAmount('{{$item->rowId}}', {{ $item->id }});"></button></div>
                                                            <!--====== End - Input Counter ======-->
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="table-p__del-wrap">
                                                            <select id="units-{{$item->id}}" style="width:70%;border-radius:15px;text-align-last:center;" class="select-box select-box--primary-style" onclick="units('{{$item->rowId}}', {{ $item->id }});">
                                                                @if($uofms !== null)
                                                                    @php
                                                                        $uofm = \App\Models\Uofms::where('group_id', $item->uofm['uofm_groups'])->get();
                                                                    @endphp
                                                                    <option hidden disabled selected>{{$uofms->name ."/". \App\Models\Uofms::where('id', $item->uofm['uofm'])->first()->name}}</option>
                                                                    @foreach($uofm as $unit)
                                                                        <option class="test-{{$item->id}}" data-index="{{$uofms->id}}" value="{{$unit->id ?? 0}}">{{$uofms->name ."/".$unit->name ?? 0}}</option>
                                                                    @endforeach
                                                                @else
                                                                    <option>لا يوجد</option>
                                                                @endif
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="table-p__del-wrap">

                                                            <a class="far fa-trash-alt table-p__delete-link" href="{{route("removeItem",['id'=>$item->rowId])}}"></a></div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            <!--====== End - Row ======-->

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div id="checkout-msg-group">
                                        <div class="msg">

                                        <span class="msg__text">Have a coupon?

                                            <a class="gl-link" href="#have-coupon" data-toggle="collapse">Click Here to enter your code</a></span>
                                            <div class="collapse" id="have-coupon" data-parent="#checkout-msg-group">
                                                <div class="c-f u-s-m-b-16">

                                                    <span class="gl-text u-s-m-b-16">Enter your coupon code if you have one.</span>
                                                    <form class="c-f__form" id="form-order" role="form" method="POST" action="{{ route('processCart') }}">
                                                        {{ csrf_field() }}
                                                        <div class="u-s-m-b-16">
                                                            <div class="u-s-m-b-15">

                                                                <label for="coupon"></label>

                                                                <input class="input-text input-text--primary-style" type="text" id="coupon-value"  {{ ($extensionDiscount['permission'])?'':'disabled' }} placeholder="Coupon Code"></div>
                                                            <div class="u-s-m-b-15">

                                                                <button class="btn btn--e-transparent-brand-b-2" type="submit" {!! ($extensionDiscount['permission'])?'id="coupon-button"':'' !!}>APPLY</button></div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 2 ======-->


                <!--====== Section 3 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                                    <form class="f-cart">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                                <div class="f-cart__pad-box">
                                                    <h1 class="gl-h1">ESTIMATE SHIPPING AND TAXES</h1>

                                                    <span class="gl-text u-s-m-b-30">Enter your destination to get a shipping estimate.</span>
                                                    <div class="u-s-m-b-30">

                                                        <!--====== Select Box ======-->

                                                        <label class="gl-label" for="shipping-country">COUNTRY *</label><select class="select-box select-box--primary-style" id="shipping-country">
                                                            <option selected value="">Choose Country</option>
                                                            <option value="uae">United Arab Emirate (UAE)</option>
                                                            <option value="uk">United Kingdom (UK)</option>
                                                            <option value="us">United States (US)</option>
                                                        </select>
                                                        <!--====== End - Select Box ======-->
                                                    </div>
                                                    <div class="u-s-m-b-30">

                                                        <!--====== Select Box ======-->

                                                        <label class="gl-label" for="shipping-state">STATE/PROVINCE *</label><select class="select-box select-box--primary-style" id="shipping-state">
                                                            <option selected value="">Choose State/Province</option>
                                                            <option value="al">Alabama</option>
                                                            <option value="al">Alaska</option>
                                                            <option value="ny">New York</option>
                                                        </select>
                                                        <!--====== End - Select Box ======-->
                                                    </div>
                                                    <div class="u-s-m-b-30">

                                                        <label class="gl-label" for="shipping-zip">ZIP/POSTAL CODE *</label>

                                                        <input class="input-text input-text--primary-style" type="text" id="shipping-zip" placeholder="Zip/Postal Code"></div>
                                                    <div class="u-s-m-b-30">

                                                        <a class="f-cart__ship-link btn--e-transparent-brand-b-2" href="#">CALCULATE SHIPPING</a></div>

                                                    <span class="gl-text">Note: There are some countries where free shipping is available otherwise our flat rate charges or country delivery charges will be apply.</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                                <div class="f-cart__pad-box">
                                                    <h1 class="gl-h1">NOTE</h1>

                                                    <span class="gl-text u-s-m-b-30">Add Special Note About Your Product</span>
                                                    <div>

                                                        <label for="f-cart-note"></label><textarea class="text-area text-area--primary-style" id="f-cart-note"></textarea></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                                <div class="f-cart__pad-box">
                                                    <div class="u-s-m-b-30">
                                                        <table class="f-cart__table">
                                                            <tbody>
                                                            @foreach ($dataTotal as $key => $element)
                                                                @if($element['code']=='discount')
                                                                    <tr>
                                                                        <td>{{trans('language.order.discount')}}</td>
                                                                        <td class="discountx">{{$element['text'] }}</td>
                                                                    </tr>
                                                                @endif
                                                                @if($element['code']=='subtotal')
                                                                    <tr>
                                                                        <td>{{trans('language.order.sub_total')}}</td>
                                                                        <td class="subtotalx">{{$element['text'] }}</td>
                                                                    </tr>
                                                                @endif
                                                                @if($element['code']=='total')
                                                                    <tr>
                                                                        <td>{{trans('language.order.total')}}</td>
                                                                        <td class="totalx">{{$element['text'] }}</td>
                                                                    </tr>
                                                                @endif
                                                            @endforeach
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div>

                                                        <a style="text-align:center" href="{{ route('checkout') }}" class="btn btn--e-brand-b-2" type="submit"> PROCEED TO CHECKOUT</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 3 ======-->
            </div>
            <!--====== End - App Content ======-->
        </div>
    @else
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

                                        <span class="empty__text-1">No items found on your cart.</span>

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

    @endif
@endsection
@push('scripts')
    <script>
            function decreseAmount(rowId, item_id) {
                var curr_qty = parseInt($('#item-'+item_id).val(), 10);
                curr_qty = curr_qty - 1;
                if(curr_qty <= 0)
                    return;
                $('#item-'+item_id).val(curr_qty);
                updateCart(rowId, item_id);
            }

            function increaseAmount(rowId, item_id) {
                var curr_qty = parseInt($('#item-'+item_id).val(), 10);
                curr_qty = curr_qty + 1;
                $('#item-'+item_id).val(curr_qty);
                updateCart(rowId, item_id);
            }

            function updateCart(rowId,id){
                var new_qty = $('#item-'+id).val();

                $.ajax({
                    url: '{{ route('updateToCart') }}',
                    type: 'POST',
                    dataType: 'json',
                    async: true,
                    cache: false,
                    data: {
                        id: id,
                        rowId: rowId,
                        new_qty: new_qty,
                        _token:'{{ csrf_token() }}'},
                    success: function(data){

                        error= parseInt(data.error);

                        if(error ===0)
                        {
                            window.location.replace(location.href);
                        }else{

                            $('.item-qty-'+id).css('display','block').html(data.msg);
                        }

                    },
                    error: function(err){
                    }
                });
            }

            //Units
            function units(rowId, item_id)
            {
                var unitId = $('#units-'+item_id).val();
                console.log(unitId);
                var uofm_group = $(".test-"+item_id).data('index');
                $.ajax({
                    url: '{{ route('updateToCart') }}',
                    type: 'POST',
                    dataType : 'json',
                    data : {
                        id     : item_id,
                        rowId  : rowId,
                        unitId : unitId,
                        uofm_group : uofm_group,
                        _token:'{{ csrf_token() }}'
                    },
                    success : function (result){
                        error= parseInt(result.error);
                        if(error ===0)
                        {
                            window.location.replace(location.href);
                        }
                    },
                });
            }

            //COUPON
            @if ($extensionDiscount)
            $('#coupon-button').on('click', function() {
                var coupon = $('#coupon-value').val();

                $.ajax({
                    url: '{{ route('useDiscount') }}',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        code: coupon,
                        uID: {{ $uID }},
                        _token: "{{ csrf_token() }}",
                    },
                })
                    .done(function(result) {
                        $('#coupon-value').val('');
                        $('.coupon-msg').removeClass('text-danger');
                        $('.coupon-msg').removeClass('text-success');
                        $('#coupon-group').removeClass('has-error');
                        $('.coupon-msg').hide();
                        if(result.error ==1){
                            $.notify(result.msg, 'error');
                        }else{
                            $('#removeCoupon').show();
                            $.notify(result.msg, 'success');
                            $('.showTotal').remove();
                            $('#showTotal').prepend(result.html);
                        }
                    })
                    .failed(function() {
                        //console.log("error");
                    })
                $('#coupon-button').button('reset');
            });

            $('#removeCoupon').on('click', function() {
                $.ajax({
                    url: '{{ route('removeDiscount') }}',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        _token: "{{ csrf_token() }}",
                    },
                })
                    .done(function(result) {
                        $('#removeCoupon').hide();
                        $('#coupon-value').val('');
                        $('.coupon-msg').removeClass('text-danger');
                        $('.coupon-msg').removeClass('text-success');
                        $('.coupon-msg').hide();
                        $('.showTotal').remove();
                        $('#showTotal').prepend(result.html);
                    })
                    .failed(function() {
                        //console.log("error");
                    })
            });
        @endif

    </script>
@endpush
