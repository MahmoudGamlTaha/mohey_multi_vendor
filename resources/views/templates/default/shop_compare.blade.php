@extends($theme.'.shop_layout')

@section('main')
<section >
<div class="container" style="margin-bottom: 10px;">
    <div class="row" >

      @if (count($compare) ==0)
          <div class="col-md-12 text-danger">
             <h3 style="text-align:center;" >Not found !</h3>
          </div>
      @endif

      @php
      $n = 0;
      @endphp

    @foreach($compare as $key => $item)
    @php
        $n++;
        $product = App\Models\ShopProduct::find($item->id);
    @endphp


<div class=""> 
  @if ( $n > 2)
    <div class="col-sm-7"> <br> </div>
    <div class="col-sm-6" style="margin-top: 20px;">
  @endif
  @if ( $n == 2)
  <div class="col-sm-6"> 
  @endif
   @if($n == 1)
   <div class="col-sm-6" style="float: right;" > 
    @endif

    <div class="col-sm-12" style="border: 1px solid #eee; padding: 20px 10px;">
    
      <div class="col-sm-9"  style="padding: 0;margin: 0;">
        <div class="col-sm-12" >
          <div class="col-sm-12">
            <a onClick="return confirm('Confirm')" title="Remove Item" alt="Remove Item" style=" position: absolute; top: -21px; left: -25px; border-radius: 0;"
            class="cart_quantity_delete btn btn-danger" href="{{route("removeItemCompare",['id'=>$item->rowId])}}">  <i class="fa fa-times"></i></a>
       
            <span><b>{{ $product->name }}({{ $product->sku }})</b></span>
            <p>{!! $product->description !!} </p>
            
          </div>
            @php
                $productRate = \App\Models\ShopProductLike::where('product_id', $product->id)->first();
                if($productRate)
                {
                    $rate = $productRate->rate;
                }else{
                    $rate = 0 ;
                }
                $rates[] = $rate;
                $percentage = $rate*100/5 ;
            @endphp
          <div   class="col-sm-12" >
          <div class="col-sm-6">
              @if($percentage == 0)
                  <div>لا يوجد تقييم</div>
              @else
                  <div>هذا المنتج تقييمه {{$percentage}} %</div>
              @endif
            <div class="star-{{$n}}" data-index="{{$n}}"></div>
          </div>
          <div class="col-sm-6">
              <span>الكمية :</span>
              <span style="color:green;"> متوفر </span>
              <br>
              <br>
          </div>
          </div>
        </div>
  
        <div class="clearfix"></div>
        <hr style="margin: 0 0 15px 0">
       
        <div class="col-sm-12">
          <div class="col-sm-12">
            <span> {!! $product->showPrice() !!}</span>
          </div>
          <br><br>

          <div class="col-sm-12">
              <form id="buy_block" action="{{ route('postCart') }}" method="post">
                  {{ csrf_field() }}
                  <input type="hidden" name="product_id" value="{{ $product->id }}" />
                      <input type="number" class="form-control" style="width:50%;display:inline;" name="qty" value="1"/>
                      <button class="btn btn-default btn-content" type="submit"> <i class="fa fa-shopping-cart" style="color:white;"></i> {{trans('language.add_to_cart')}}</button>
              </form>
          <br>
         </div>
         </div>
       
  
   
  </div>
  
  <div class="col-sm-3" >
    <div class="col-sm-12" style="padding:0px;">
      <a href="{{ $product->getUrl() }}"><img style="width:140px ; height:200px; margin: 0 -20px;"  
        src="{{asset($product->getImage())}}" alt="" class="block-center"></a>
    </div>
      <div class="col-sm-12" style="padding:0px;">
          @if ($product->images->count())
              @foreach ($product->images as $key=>$image)
                  <div class="col-sm-6"style="padding:0px;">
                      <img src="{{ asset($image->getImage()) }}" alt="" style="width:100%;height:100px;margin-top: 2px; border:1px solid #eee"  class="block-center"/>
                  </div>
              @endforeach
          @endif

      </div>
  </div>
  
    
    </div>


  </div>

 
</div>





@endforeach




</div>
</div>

</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li> <i class="fa fa-angle-left"></i></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@push('scripts')
<script>
    $(document).ready(function(){
        var productCount = {{count($compare)}};
        var rates = new Array();
        rates = {{json_encode($rates)}};
        for(var i = 1 ; i <= productCount; i++)
        {
            var product = $('.star-'+i);
            var productIndex = product.data('index');
            if(productIndex == i)
            {
                var rate = rates[i-1];
                for (var n = 1 ; n <= rate; n++)
                {
                    const star = document.createElement('span');
                    star.innerHTML = "<i class='fa fa-star checked'></i>";
                    product.append(star);
                }
                if(rate < 5)
                {
                    var test = 5 - rate;
                    for (var s = 1 ; s <= test ; s++)
                    {
                        const star = document.createElement('span');
                        star.innerHTML = "<i class='fa fa-star'></i>";
                        product.append(star);
                    }
                }
            }
        }
    });
</script>
@endpush


<div class="modal fade" id="confirmDeleteModal" tabindex="-1" caller-id="" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body confirm-delete">
        This action is permanent!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="confirmDeleteButtonModal">Delete</button>
      </div>
    </div>
  </div>
</div>