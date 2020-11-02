@extends($theme.'.shop_layout')

@section('main')
<section >
<div class="container" style="margin-bottom: 10px;">
    <div class="row" >
      <div class="col-sm-12" style="text-align:center;">
        <h4 style="background: #f69620;padding: 12px 5px;color: white;">{{ $title }}</h4>
      </div>

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
  <div class="col-sm-6"> 
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
          <div   class="col-sm-12" >
          <div class="col-sm-6">
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star-o"></span>
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
            
            <i class="fa fa-heart-o" style="color: #a8a8a8"></i> &nbsp;<a href="" style="color: #a8a8a8 ; margin-left: 30px">إضافة الى قائمة المفضلة</a>
            <a onclick="addToCart('35','compare',$(this))" style="color: #a8a8a8">  
              <i class="fa fa-refresh" style="color: #a8a8a8"></i>&nbsp; مقارنة</a>
            
            
            <ul class="list-unstyled product_details">
              <li>3D-SENSOR-NTC 100K</li>
              <li>3D-SENSOR-NTC 100K<b>
            </ul>
          </div>
        </div>
  
       
        <div class="col-sm-12">
          <div class="col-sm-12">
            <span><del>EGP90.00</del></span>
            <span> {!! $product->showPrice() !!}</span>
          </div>
          <br><br>

          <div class="col-sm-12">
            <input type="number" class="form-control" style="width:40%;display:inline;" name="q" value="1">
            <button class="btn btn-default btn-content" type="submit"> <i class="fa fa-shopping-cart" style="color:white;"></i> سلة الشراء</button>
            <button style="display:inline" class="btn btn-default btn-content" > اختيار نظام الدفع </button>
          <br>
         </div>
         </div>
       
  
   
  </div>
  
  <div class="col-sm-3" >
    <div class="col-sm-12" style="padding:0px;">
      <a href="{{ $product->getUrl() }}"><img style="width:140px ; height:200px; margin: 0 -20px;"  
        src="{{asset($product->getImage())}}" alt="" class="block-center"></a>
  
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