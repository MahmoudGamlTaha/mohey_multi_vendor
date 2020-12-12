@extends($theme.'.shop_layout')

@section('main')
<section>
    <div class="container">
      <div class="row">
<h2 class="title text-center">{{ $title }}</h2>
@if (count($cart) ==0)
    <div class="col-md-12 text-danger">
        Cart empty!
    </div>
@else
    <style>
    .shipping_address td{
        padding: 3px !important;
    }
    .shipping_address textarea,.shipping_address input[type="text"]{
        width: 100%;
        padding: 7px !important;
    }
    .row_cart>td{
        vertical-align: middle !important;
    }
    input[type="number"]{
        text-align: center;
        padding:2px;
    }
</style>
<div class="table-responsive">
<table style="width: 90%;text-align: center;" class="table box table-bordered">
    <thead>
      <tr  style="background: #eaebec">
        <th style="width: 50px;">No.</th>
        <th style="width: 15%;">{{ trans('language.product.sku') }}</th>
        <th style="width: 20%;">{{ trans('language.product.name') }}</th>
        <th style="width: 10%;text-align:center;">{{ trans('language.product.price') }}</th>
        <th style="width: 10%;text-align:center;">{{ trans('language.product.quantity') }}</th>
        <th style="width: 20%;text-align:center;">{{ trans('language.product.unit') }}</th>
        <th style="text-align:center;">{{ trans('language.product.total_price') }}</th>
      </tr>
    </thead>
    <tbody>

    @foreach($cart as $item)
        @php
            $n = (isset($n)?$n:0);
            $n++;
            $product = App\Models\ShopProduct::find($item->id);
            $uofms = \App\Models\UofmGroups::where('id', $product->uofm_groups)->first();
        @endphp
    <tr class="row_cart">
        <td >{{ $n }}</td>
        <td>{{ $product->sku }}</td>
        <td>
            {{ $product->getName() }}<br>
{{-- Process attributes --}}
            @if ($item->options->att)

                @foreach ($item->options->att as $keyAtt => $att)
                    <b>{{ $attributesGroup[$keyAtt]['name'] }}</b>: <i>{{ $att }}</i> ;
                @endforeach
            <br>
            @endif
{{-- //end Process attributes --}}
            <a href="{{$product->getUrl() }}"><img width="100" src="{{asset($product->getImage())}}" alt=""></a>
        </td>
        <td>{!! $product->showPrice() !!}</td>
        <td>{{$item->qty}}</td>
        <td>{{$uofms->name ."/". \App\Models\Uofms::where('id', $item->uofm['uofm'])->first()->name}}</td>
        <td style="width:10%">{{\Helper::currencyRender($item->subtotal)}}</td>
    </tr>
    @endforeach
    </tbody>
  </table>
  </div>
<form class="shipping_address" id="form-order" role="form" method="POST" action="{{ route('storeOrder') }}">
    {{ csrf_field() }}
    <input type="hidden" name="address" value="{{ json_encode($address) }}">
    <input type="hidden" name="dataTotal" value="{{ json_encode($dataTotal) }}">
    <input type="hidden" name="payment" value="{{ $payment }}">
    <input type="hidden" name="shipping" value="{{ $shipping }}">
    <div class="row">
        
    <div style="margin-left:8%" class="grid col-md-5">
        <div style="margin-bottom: 15px;">
            <span><b>نظام الدفع</b></span>
        </div>
        @if(isset($payment_term))
        <div style="margin-left:4%">
        <select id="paymentTerm" class="form-control" name="paymentTerm">
            <option value="0">Cash</option>
          @foreach($payment_term as $key => $term)
             <option value="{{$term->id}}">{{$term->paymentTerm()->first()->name}}</option>
          @endforeach
         </select>
        </div>
    </div>
        @endif
    </div>
    <div class="row">
    <div class="col-md-6">
        <h3 class="control-label"><i class="fa fa-credit-card-alt"></i> {{ trans('language.cart.shipping_address') }}:<br></h3>
        <table style="width: 90%;text-align: center;" class="table box table-bordered" id="showTotal">
            <tr>
                <td>{{ trans('language.cart.to_name') }}:</td>
                <td>{{ $address['toname'] }}</td>
            </tr>
            <tr>
                <td>{{ trans('language.cart.phone') }}:</td>
                <td>{{ $address['phone'] }}</td>
            </tr>
             <tr>
                <td>{{ trans('language.cart.email') }}:</td>
                <td>{{ $address['email'] }}</td>
            </tr>
             <tr>
                <td>{{ trans('language.cart.address') }}:</td>
                <td>{{ $address['address1'].' '.$address['address2'] }}</td>
            </tr>
             <tr>
                <td>{{ trans('language.cart.note') }}:</td>
                <td>{{ $address['comment'] }}</td>
            </tr>
        </table>
    </div>
    <div class="col-md-6">
{{-- Total --}}
        <div class="row">
            <div class="col-md-12">
                <table class="table box table-bordered" id="showTotal">
                    <th>الفائده المضافه</th>
                    <td style="font-weight:bold" class="rate">0%</td>
                    @foreach ($dataTotal as $key => $element)
                    @if ($element['value'] !=0)

                     @if ($element['code']=='total')
                         @php
                            $value = $element['value'];
                         @endphp
                         <tr class="showTotal" style="background:#f5f3f3;font-weight: bold;">
                     @else
                        <tr class="showTotal">
                     @endif
                             <th>{!! $element['title'] !!}</th>
                            <td style="text-align: right" id="{{ $element['code'] }}" class="total">{{$element['text'] }}</td>
                        </tr>
                    @endif

                    @endforeach
                </table>
        {{-- Payment method --}}
            <div class="row">
                <div class="col-md-12">
                        <div class="form-group">
                            <h3 class="control-label"><i class="fa fa-credit-card-alt"></i> {{ trans('language.cart.payment_method') }}:<br></h3>
                        </div>
                        <div class="form-group">
                                <div>
                                    <label class="radio-inline">
                                     <img title="{{ $paymentMethod['title'] }}" alt="{{ $paymentMethod['title'] }}" src="{{ asset($paymentMethod['image']) }}" style="width: 120px;">
                                    </label>
                                </div>
                        </div>
                </div>
            </div>
        {{-- //Payment method --}}
            </div>
        </div>
{{-- End total --}}

        <div class="row" style="padding-bottom: 20px;">
            <div class="col-md-12 text-center">
             <div class="pull-left">
                <button class="btn btn-default" type="button" style="cursor: pointer;padding:10px 30px" onClick="location.href='{{ route('cart') }}'"><i class="fa fa-arrow-left"></i>{{ trans('language.cart.back_to_cart') }}</button>
                </div>
                    <div class="pull-right">
                        <button class="btn btn-success" id="submit-order" type="submit" style="cursor: pointer;padding:10px 30px"><i class="fa fa-check"></i> {{ trans('language.cart.confirm') }}</button>
                    </div>
            </div>
        </div>

    </div>
</div>
</form>
@endif
        </div>
    </div>
</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li><a href="{{ route('cart') }}">{{ trans('language.cart_title') }}</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function (){
            console.log('hello bebo from outside the function');
            $('#paymentTerm').change(function (){
                console.log('hi bebo');
                if($('#paymentTerm').val() === 'Cash') {
                    $('.total').html({{$value}});
                    $('.rate').html('0%');
                }else{
                    $('.total').html('ج'+{{($term->rate * $value)+$value}});
                    $('.rate').html({{$term->rate}}+'%');
                }
            });
        });
    </script>
@endpush
