@extends($theme.'.shop_layout')
@if(session()->has('error'))
    <div class="alert alert-danger">
        {{ session()->get('error') }}
    </div>
@endif
@section('main')
<section>
    <div class="container">
      <div class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-10">
        <div class="col-sm-12">
          <h4 style="color: #10243f;">{{ $title }}</h4>
        </div>
        <div class="col-sm-12 table-responsive"  style="border: 1px solid #eee; padding: 19px 5px 0 5px; margin-bottom: 5px;">
        @if(isset($cart) && sizeof($cart) > 0)
        <table class="table table-striped" style="margin-bottom:0;">
            <thead>
              <tr>
                <th style="width: 15%;text-align:center;"></th>
                <th style="width: 25%;text-align:right;">{{ trans('language.cart.product') }}</th>
                <th style="width: 15%;text-align:center;">{{ trans('language.product.price') }}</th>
                <th style="width: 20%;text-align:center;">{{ trans('language.product.quantity') }}</th>
                <th style="width: 20%;text-align:center;">{{ trans('language.product.unit') }}</th>
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
            $uofms = $product->getUnit();
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
                 <a style="cursor: pointer;color:#00f" onClick="addToCart('{{ $product->id }}','wishlist',$(this))"><i class="fa fa-heart-o"></i> {{trans('language.add_to_wishlist')}}</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <a style="cursor: pointer;color:#f00" onClick="return confirm('Confirm?')" title="Remove Item" alt="Remove Item" class="cart_quantity_delete" href="{{route("removeItem",['id'=>$item->rowId])}}"><i class="fa fa-trash-o"></i> حذف</a>
                  </td>
                <td style="padding: 33px;">
                  <span class="cart-total-span">{!! html_entity_decode($product->showPrice()) !!}</span>
                </td>
                <td style="width: 15%;text-align:center;padding: 33px;">
                  <button name="decrease" style="border:none; height:28px;width:30px;border: 1px solid #dad9d9"  id="decrease" onClick="decreseAmount('{{$item->rowId}}', {{ $item->id }});">-</button>
                  <input type="text" id="item-{{$item->id}}" onChange="updateCart('{{$item->rowId}}', {{ $item->id }});" class="item-qty" value="{{$item->qty}}" name="qty-{{$item->id}}" style="width:30px;text-align:center; margin:-3px ;height:28px;border:1px solid #dad9d9">
                  <button style="border:none; height:28px;width:30px; border:1px solid #dad9d9" name="increase" id="increase" onClick="increaseAmount('{{$item->rowId}}', {{ $item->id }});">+</button>
                </td>
                <td style="width:20%;padding:33px;" class="col-md-12">
                    <div class="form-group">
                        <select id="units-{{$item->id}}" style="font-size:15px;padding:3px;border-style:none;color:black;" class="form-control" onclick="units('{{$item->rowId}}', {{ $item->id }});">
                            @if($uofms !== null)
                                @php
                                    $uofm = $uofms->getUnits()->get();
                                @endphp
                                <option hidden disabled selected>{{$product->getUnit()->name ."/". $product->getUnit()->getUnits()->where('id', $item->uofm['uofm'])->first()->name}}</option>
                                @foreach($uofm as $unit)
                                <option class="test-{{$item->id}}" data-index="{{$product->getUnit()->id}}" value="{{$unit->id ?? 0}}">{{$product->getUnit()->name ."/".$unit->name ?? 0}}</option>
                                @endforeach
                            @else
                                <option>لا يوجد</option>
                            @endif
                        </select>
                    </div>
                </td>
                <td>
                  <span style="color:#10243f;width: 12%;text-align:center; font-size: 16px;line-height: 5;"><b>{{\Helper::currencyRender($item->subtotal)}}</b></span>
                </td>
                @if($payment_term != null)
                <td>
                <span style="color:#81C4E6;">{{$payment_term->paymentTerm()->first()->name}}</span>
                </td>
                @endif
              </tr>
              @endforeach
            </tbody>
            <tfoot style="background: #f9f9f9;">
              <tr>
                @if($extensionDiscount)
                <td colspan="100%">
                  <div >
                   


                    <div class="panel-group">
                      <div class="panel panel-default">
                    
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#collapse" style="color:#10243f ; font-size:18px">
                               <i  onclick="myFunctiondiscount(this)" class="fa fa-angle-up" style="float: left "></i> كود الخصم  </a>
                          </h4>
                        </div>
                              
          
                      <div id="collapse" class="panel-collapse collapse in" style="height: auto;text-align: center;">
                      
                        <form style=" width: 50%; padding: 5px 30px;" class="shipping_address" id="form-order" role="form" method="POST" action="{{ route('processCart') }}">
                          {{ csrf_field() }}
                           <div>
                            <label style="float: right ; color: #b0b0b0;padding-right: 20px;">{{ trans('language.cart.coupon') }}:</label>
                            <input type="text" class="form-control" id="coupon-value"  {{ ($extensionDiscount['permission'])?'':'disabled' }} placeholder="كوبون الخصم" style="width: 80% ; display: inline;"/>
                           
                            <button style="color:white;background-color:#10243F;border-radius:5px;padding:5px;font-size:12pt;" {!! ($extensionDiscount['permission'])?'id="coupon-button"':'' !!}>تطبيق</button>
                            <div class="coupon-msg  {{ Session::has('error_discount')?'text-danger':'' }}" style="text-align: left;padding-left: 10px;">{{ Session::has('error_discount')?Session::get('error_discount'):'' }}</div>
                          <div>
                          </form>
                       </div>
          
                  </div>
                </div>

                  </div>
                  <br/>
                  <a  style="color:#9f9f9f;background-color:#fdfdfd ; border: 1px solid #9f9f9f ;border-radius:5px;padding:5px;font-size:12pt;cursor:pointer;">تحديث السلة</a>
                  <a href="{{ route('home') }}" 
                  style="color:#10243C;background-color:#F99520;border-radius:5px;padding:5px;font-size:12pt; border:none;cursor:pointer;"><b>متابعة التسوق</b></a>
                 <!-- <a onClick="return confirm('Confirm ?')" href="{{route('clearCart')}}"><button class="btn" type="button" style="cursor: pointer;padding:10px 30px">{{ trans('language.cart.remove_all') }}</button></a>
-->
<br/><br/>


                </td>
                @endif
              </tr>
            </tfoot>
          </table>
        </div>

     

        <div class="col-sm-3">
        </div>
        <div class="col-sm-6">

          <div class="panel-group">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" href="#collapse1" style="color:#10243f ; font-size:18px">
                     <i  onclick="myFunction(this)" class="fa fa-angle-up" style="float: left "></i> الاجمالى  </a>
                </h4>
              </div>
     
              <form id="form-order" role="form" method="POST" action="{{ route('processCart') }}" style="margin-bottom: 0">
          {{ csrf_field() }}           
         

            <div id="collapse1" class="panel-collapse collapse in" style="height: auto;text-align: center;">
            
            @foreach ($dataTotal as $key => $element)
                    @if ($element['value'] !=0)
            @if($element['code']=='total')
            <div style="margin-top: 12px; margin-bottom: -5px;">
              <span style="text-align:center; color: #b0b0b0; margin: 20px;">  الاجمالى : </span>
              <span style="text-align:center; color: #000;">{{$element['text'] }}</span>
            </div>
            <hr/>
            
            <div style="margin-top: -8px; margin-bottom: 15px;">
              <span style="text-align:center; color: #b0b0b0; margin: 4px;">  {!! $element['title'] !!} :  </span>
              <span style="text-align:center; color: #000;">   {{$element['text'] }}</span>
            </div>
            @endif
            @else
                        <tr class="showTotal">
            @endif
            @endforeach
            <input style="width:98%;color:white;background-color:#10243F;border-radius:5px;padding:5px;font-size:12pt;margin-bottom: 5px;" value="{{trans('language.purchase')}}" type="submit" id="submit-order"></input>
            @endif

      
             </div>
          </form>

        </div>
      </div>

        </div>
      </div>
      </div>
      <br/>
<hr style="margin-bottom: 0">
      <div class="row" style="">
        <div class="row">
        
          <div class="col-sm-12" style="text-align:center;">
            <h4 style="background: #f69620;padding: 12px 5px;color: white;">{{ trans('language.cart.lastViewd') }}</h4>
          </div>
         
        </div>
        <div class="row" style="margin: 0px 6px;">
          @foreach($lastViewed as $key => $value)
          <div class="col-sm-2"  style="width: 16.1%; border: 1px solid #eee; margin:5px 3px 0 3px;">
            <a href="{{$value->getUrl() }}"><img src="{{asset($value->getImage())}}" alt style="width:100%;"/></a>
            <span>{{$value->getName()}}</span>
          </div>
          @endforeach
        </div>
        <div class="row">
          <div class="col-sm-12">
            <a href="" class="btn btn-default1">{{ trans('language.ViewAll') }}  <i class="fa fa-angle-double-left"></i> </a>  
          </div>
        </div>
      </div>

  <hr style="margin-bottom: 0">
      <div class="row" style="">
        <div class="row">
        
          <div class="col-sm-12" style="text-align:center;">
            <h4 style="background: #f69620;padding: 12px 5px;color: white;">{{trans('language.wishlist_products')}}</h4>
          </div>
         
        </div>

        <div class="row" style="margin: 0px 6px;">
          @foreach( $wishlist as $item)
          @php
          $count = (isset($n)?$n:0);
          if($count >= 6)
             break;
          $count++;
          $productWish = App\Models\ShopProduct::find( $item->id);
         
          @endphp
            <div class="col-sm-2"  style="width: 16.1%; border: 1px solid #eee; margin:5px 3px 0 3px;">
            <a href="{{ $productWish->getUrl() }}"><img style="width:95% " src="{{asset($productWish->getImage())}}" alt=""></a>
            </div>
            @endforeach
          </div>
          <br>

        <div class="row">
          <div class="col-sm-12">
            <a href="{{route('wishlist')}}" class="btn btn-default1">{{ trans('language.ViewAll') }}  <i class="fa fa-angle-double-left"></i> </a>  
          </div>
        </div>
      </div>
<br>


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
      //console.log(rowId);
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
                  //console.log(err);
                }
        });
    }

    function units(rowId, item_id)
    {
        var unitId = $('#units-'+item_id).val();
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
                //console.log("error");
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
                //console.log("error");
            })
            // .always(function() {
            //     console.log("complete");
            // });
    });
@endif

</script>
@endpush


<script>
  function myFunction(x) {
    x.classList.toggle("fa-angle-down");
  }

  function myFunctiondiscount(x) {
    x.classList.toggle("fa-angle-down");
  }

  
  </script>