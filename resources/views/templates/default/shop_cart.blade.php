@extends($theme.'.shop_layout')

@section('main')
<section>
    <div class="container">
      <div class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-10">
        <div class="col-sm-12">
          <h4>{{ $title }}</h4>
        </div>
        <div class="col-sm-12 table-responsive">
        @if(isset($cart) && sizeof($cart) > 0)
        <table class="table table-striped">
            <thead>
              <tr>
                <th style="width: 15%;text-align:center;"></th>
                <th style="width: 25%;text-align:right;">{{ trans('language.cart.product') }}</th>
                <th style="width: 15%;text-align:center;">{{ trans('language.product.price') }}</th>
                <th style="width: 20%;text-align:center;">{{ trans('language.product.quantity') }}</th>
                <th style="width: 12%;text-align:center;">{{ trans('language.product.total_price') }}</th>
                @if($payment_term != null)
                <th style="width: 15%;text-align:center;">{{ trans('language.payments.payment_term') }}</th>
                @endif
              </tr>
            </thead>
            <tbody>
            @foreach($cart as $item)
            @php
            $product = App\Models\ShopProduct::find($item->id);
           @endphp
              <tr>
                <td style="text-align:center;">
                <a href="{{$product->getUrl() }}"><img width="100" src="{{asset($product->getImage())}}" alt=""></a>
                </td>
                <td>
                  <span class="cart-product-span">{{$product->getName()}}</span>
                  <br/>
                  <span>البائع: </span>
                  <br/>
                  <span>{{count($product->company()->get()) == 0? 'Dokkani' : $product->company()->first()->name }}</span>
                  <br/>
                  <br/>
                 <a style="cursor: pointer;color:#F29811" onClick="addToCart('{{ $product->id }}','wishlist',$(this))"><i class="fa fa-heart-o"></i>{{trans('language.add_to_wishlist')}}</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <a style="cursor: pointer;color:#F29811" onClick="return confirm('Confirm?')" title="Remove Item" alt="Remove Item" class="cart_quantity_delete" href="{{route("removeItem",['id'=>$item->rowId])}}"><i class="fa fa-trash-o"></i> حذف</a>
                  </td>
                <td>
                  <span class="cart-total-span">{!! html_entity_decode($product->showPrice()) !!}</span>
                </td>
                <td style="width: 15%;text-align:center;">
                  <button name="decrease" style="border:none; height:28px;width:30px"  id="decrease" onClick="decreseAmount('{{$item->rowId}}', {{ $item->id }});">-</button>
                  <input type="text" id="item-{{$item->id}}" onChange="updateCart('{{$item->rowId}}', {{ $item->id }});" class="item-qty" value="{{$item->qty}}" name="qty-{{$item->id}}" style="width:30px;text-align:center; margin:-3px">
                  <button style="border:none; height:28px;width:30px" name="increase" id="increase" onClick="increaseAmount('{{$item->rowId}}', {{ $item->id }});">+</button>
                </td>
                <td>
                  <span style="color:#81C4E6;width: 12%;text-align:center;"><b>{{\Helper::currencyRender($item->subtotal)}}</b></span>
                </td>
                @if($payment_term != null)
                <td>
                <span style="color:#81C4E6;">{{$payment_term->paymentTerm()->first()->name}}</span>
                </td>
                @endif
              </tr>
              @endforeach
            </tbody>
            <tfoot>
              <tr>
                @if($extensionDiscount)
                <td colspan="100%">
                  <div style="padding-right:20px;">
                    <form style="background-color:#FBFBFB;border-radius:5px;" class="shipping_address" id="form-order" role="form" method="POST" action="{{ route('processCart') }}">
                    {{ csrf_field() }}
                     <h4 style="background-color:#F5F5F5;">كود الخصم</h4>
                      <label>{{ trans('language.cart.coupon') }}:</label>
                      <br/>
                      <input type="text" id="coupon-value"  {{ ($extensionDiscount['permission'])?'':'disabled' }} placeholder="كوبون الخصم"/>
                      <button style="color:white;background-color:#10243F;border-radius:5px;padding:5px;font-size:12pt;" {!! ($extensionDiscount['permission'])?'id="coupon-button"':'' !!}>تطبيق</button>
                      <div class="coupon-msg  {{ Session::has('error_discount')?'text-danger':'' }}" style="text-align: left;padding-left: 10px;">{{ Session::has('error_discount')?Session::get('error_discount'):'' }}</div>
                    </form>
                  </div>
                  <br/>
                  <a  style="color:#10243C;background-color:#FEFEFE;border-radius:5px;padding:5px;font-size:12pt;cursor:pointer;">تحديث السلة</a>
                  <a href="{{ route('home') }}" style="color:#10243C;background-color:#F99520;border-radius:5px;padding:5px;font-size:12pt; border:none;cursor:pointer;"><b>متابعة التسوق</b></a>
                 <!-- <a onClick="return confirm('Confirm ?')" href="{{route('clearCart')}}"><button class="btn" type="button" style="cursor: pointer;padding:10px 30px">{{ trans('language.cart.remove_all') }}</button></a>
-->
                </td>
                @endif
              </tr>
            </tfoot>
          </table>
        </div>
        <div class="col-sm-4">
        </div>
        <div class="col-sm-4">
          <form id="form-order" role="form" method="POST" action="{{ route('processCart') }}">
          {{ csrf_field() }}
            <h4 style="padding: 5px;background-color:#F5F5F5;">كود الخصم</h4>
            @foreach ($dataTotal as $key => $element)
                    @if ($element['value'] !=0)
            @if($element['code']=='total')
            <span style="width:100%;text-align:center">الاجمالى<b> {{$element['text'] }}</b></span>
            <hr/>
            <span style="width:100%;text-align:center">{!! $element['title'] !!}<b> {{$element['text'] }}</b></span>
            @endif
            @else
                        <tr class="showTotal">
            @endif
            @endforeach
            <input style="width:100%;color:white;background-color:#10243F;border-radius:5px;padding:5px;font-size:12pt;" value="{{trans('language.purchase')}}" type="submit" id="submit-order"></input>
            @endif
          </form>

        </div>
      </div>
      </div>
      <br/>
      <div class="row" style="border-top:3px solid #F5F5F5;border-right:10px solid #C1C1C1;padding-left:30px;padding-right:30px;">
        <div class="row">
          <div class="col-sm-4">
          </div>
          <div class="col-sm-4" style="padding-bottom:-5px;text-align:center;">
            <h4 style="border:1px solid #ccc;border-bottom:none; margin-bottom:0px;">{{ trans('language.cart.lastViewd') }}</h4>
          </div>
          <div class="col-sm-4">
          </div>
        </div>
        <div class="row">
          @foreach($lastViewed as $key => $value)
          <div class="col-sm-2" style="padding-top:20px;padding-bottom:20px;">
            <a href="{{$value->getUrl() }}"><img src="{{asset($value->getImage())}}" alt style="width:100%;"/></a>
            <span>{{$value->getName()}}</span>
          </div>
          @endforeach
        </div>
        <div class="row">
          <div class="col-sm-8">
          </div>
          <div class="col-sm-2">
            <a href="" style="color:#000;">{{ trans('language.ViewAll') }}</a>  >
          </div>
        </div>
      </div>
      <br/>
      <div class="row" style="border-top:3px solid #F5F5F5;border-right:10px solid #C1C1C1;padding-left:30px;padding-right:30px;">
        <div class="row">
          <div class="col-sm-4">
          </div>
          <div class="col-sm-4" style="padding-bottom:-5px;text-align:center;">
            <h4 style="border:1px solid #ccc;border-bottom:none; margin-bottom:0px;color:red;">{{trans('language.wishlist_products')}}</h4>
          </div>
          <div class="col-sm-4">
          </div>
        </div>
        <div class="row">
        
        @foreach( $wishlist as $item)
        @php
        $count = (isset($n)?$n:0);
        if($count >= 6)
           break;
        $count++;
        $productWish = App\Models\ShopProduct::find( $item->id);
       
        @endphp
          <div class="col-sm-2" style="padding-top:20px;padding-bottom:20px;">
          <a href="{{ $productWish->getUrl() }}"><img src="{{asset($productWish->getImage())}}" alt=""></a>
          </div>
          @endforeach
        </div>
        <div class="row">
          <div class="col-sm-8">
          </div>
          <div class="col-sm-2">
            <a href="{{route('wishlist')}}" style="color:#000;">رؤية الكل</a>  >
          </div>
        </div>
      </div>
    </div>
</section>
@endsection
@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">الرئيسية</a></li>
         <li class="active"> > {{ $title }}</li>
        </ol>
      </div>
@endsection
@push('scripts')
<script type="text/javascript">

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
      console.log(rowId);
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
                  console.log(err);
                }
        });
    }

$('#submit-order').click(function(){
    $('#form-order').submit();
    $(this).prop('disabled',true);
});

@if ($extensionDiscount)
    $('#coupon-button').click(function() {
     var coupon = $('#coupon-value').val();
        if(coupon==''){
            $('#coupon-group').addClass('has-error');
            $('.coupon-msg').html('{{ trans('language.cart.coupon_empty') }}').addClass('text-danger').show();
        }else{
        $('#coupon-button').button('loading');
        setTimeout(function() {
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
                    $('#coupon-group').addClass('has-error');
                    $('.coupon-msg').html(result.msg).addClass('text-danger').show();
                }else{
                    $('#removeCoupon').show();
                    $('.coupon-msg').html(result.msg).addClass('text-success').show();
                    $('.showTotal').remove();
                    $('#showTotal').prepend(result.html);
                }
            })
            .fail(function() {
                console.log("error");
            })
           $('#coupon-button').button('reset');
       }, 2000);
        }

    });
    $('#removeCoupon').click(function() {
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
            .fail(function() {
                console.log("error");
            })
            // .always(function() {
            //     console.log("complete");
            // });
    });
@endif

</script>
@endpush