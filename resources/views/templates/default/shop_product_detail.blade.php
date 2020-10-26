@extends($theme.'.shop_layout')
@php
    $banner = \App\Models\Banner::where('status', 1)->where('type_id', 1)->sort()->first();
  @endphp
@section('center')
<div class="row">
    @php
        $category = $product->category()->first();
        $productCategory = \App\Models\ShopCategoryDescription::where('shop_category_id', $category->parent)->first();
    @endphp
    <ul class="page-addressbar">
        <li class="page-addressbar-head"><a href="{{ env('APP_URL') }}">الرئيسية</a></li>
        <li> > </li>
        <li class="page-addressbar-tail"><a href="#">{{$title}}</a></li>
        <li> < </li>
        <li class="page-addressbar-item"><a href="{{env('APP_URL').'/category/'.strtolower($category->name).'_'.$category->id}}">{{$category->name}}</a> </li>
        <li> < </li>
        <li class="page-addressbar-item"><a href="{{env('APP_URL').'/category/'.strtolower($productCategory->name).'_'.$productCategory->shop_category_id}}">{{$productCategory->name}}</a> </li>
    </ul>
</div>
<br/>
<div class="row"><!-- content div -->
  <div class="col-sm-2">
    &nbsp;
  </div>
      <div class="col-sm-8"> <!--content left-->
          <div class="col-sm-8">
              <div class="col-sm-12">
                <div class="col-sm-12">
                  <h4>{{$product->category()->get()->first()->name}}</h4>
                  <span><b>{{$title}}</b></span>
                </div>
                <div class="col-sm-6">
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star-o"></span>
                  <span class="fa fa-star-o"></span>
                  هذا المنتج تقييمه 60%
                </div>
                <div class="col-sm-6">
                    <span>{{ trans('language.product.quantity') }} :</span>
                    @if($product->stock > 0)
                    <span style="color:green;"> متوفر </span>
                    @elseif($product->stock <= 0)
                    <span style="color:red;"> غير متوفر حاليا </span>
                    @endif
                    <br/>
                    <br/>
                </div>
              </div>

              <div class="col-sm-12">
                <div class="col-sm-6">
                  <button class="btn btn-default btn-content">بيع هذا المنتج</button>
                </div>
                <div class="col-sm-6">
                  <i class="fa fa-heart-o"></i> &nbsp;<a href="">إضافة الى قائمة المفضلة</a>
                  <a onClick="addToCart('{{ $product->id }}','compare',$(this))">  <i class="fa fa-refresh"></i>&nbsp; مقارنة</a>
                  <ul class="list-unstyled">
                   <!-- <li> <b>شركة</b>  {{count($product->company()->get()) == 0? 'Dokkani' : $product->company()->first()->name }}</li>-->
                   <li> <b>شركة</b> Dokkani</li>
                    <li><b>SKU</li>
                    <li>{{ $product->sku }}</li>
                  </ul>
                  <br/>
                  <br/>
                </div>
              </div>
              <form id="buy_block" action="{{ route('postCart') }}" method="post">
              {{ csrf_field() }}
              <input type="hidden" name="product_id" value="{{ $product->id }}" />
              <div class="col-sm-12">
                <div class="col-sm-12">
                  <span style="font-size:14pt;">{!! $product->showPrice() !!}</span>
                  <span><del>EGP90.00</del></span>
                </div>
                <div class="col-sm-12">
                  <input type="text" name="qty" value="1"/>
                  <button class="btn btn-default btn-content" type="submit"> <i class="fa fa-shopping-cart" style="color:white;"></i> {{trans('language.add_to_cart')}}</button>
               </form>
                  <button class="btn btn-default btn-content" data-toggle="modal" data-target="#paymentTermModal">إختار نظام الدفع</button>

                </div>
              </div>
          </div>
         <!-- // -->
          <div  id="paymentTermModal" class="modal fade" role="dailog" aria-hidden="true" tabindex="-1">
              <div class="modal-dialog" role="document">
                   <div class="modal-content">
                       <div class="modal-header">
                             <h5>select Available Payment Term</h5>
                        </div>
                <div class="model-body">
                  <ul>
                 <form action="{{ route('postCart') }}" method="post">
                   @if($paymentTerms != null) 
                 @foreach($paymentTerms as $key => $payment)
                     <li><input type="radio" name="payment[]" value = "{{$payment->id}}"/> {{$payment->paymentTerm()->first()->name}} </li>
                 @endforeach
                 <input type="hidden" name="qty" value="1"></input>
                 {{ csrf_field() }}
                  <input type="hidden" name="product_id" value="{{ $product->id }}" />
                 @else
                 <span>غير متوفر نظام دفع لك حاليا</span>
                 @endif
                  </ul>
                </div>
                <div class="modal-footer">
                  <div class="row"> 
                          <div class="col-md-10">
                          @if($paymentTerms != null)
                          <button class="btn btn-default" >اضافة للسلة</button>
                          @endif
                          </div>
                        </form>
                          <div class="col-md-2">
                          <button class="btn btn-default" onclick="closeModal()">الغاء</button>
                          </div>
                  </div>
                </div>
              </div>
          </div>
              </div>
          <!-- // -->
          <div class="col-sm-4" >
            <div class="col-sm-12" style="padding:0px;">
              <img src="{{ asset($product->getImage()) }}" alt="" style="width:100%;height:200px;" class="block-center"/>
            </div>
            <div class="col-sm-12" style="padding:0px;">
            @if ($product->images->count())
                       @foreach ($product->images as $key=>$image)
                <div class="col-sm-3"style="padding:0px;">
                  <img src="{{ asset($image->getImage()) }}" alt="" style="width:100%;height:100px;" class="block-center"/>
                </div>
                @endforeach
            @endif
            </div>

          </div>

          <div class="col-sm-12">
            <br/>
            <br/>
            <ul class="nav nav-tabs rightSide">
              <li><a data-toggle="tab" href="#menu2">معلومات البائع</a></li>
              <li><a data-toggle="tab" href="#menu3">تقييم العملاء</a></li>
              <li><a data-toggle="tab" href="#menu1">التفاصيل</a></li>
              <li class="active"><a data-toggle="tab" href="#home">الوصف</a></li>
            </ul>

            <div class="tab-content" style="padding:30px;">
              <div id="home" class="tab-pane fade in active">
                <h4>وصف مختصر</h4>
                <p>{{$description}}</p>
              </div>
              <div id="menu1" class="tab-pane fade">
                <h4>التفاصيل</h4>
                <p>{!! html_entity_decode($product->content) !!}}</p>
              </div>
              <div id="menu2" class="tab-pane fade">
                <h3> <b>شركة</b>  {{count($product->company()->get()) == 0? 'Dokkani' : $product->company()->first()->name }}</h3>
                <p></p>
              </div>
              <div id="menu3" class="tab-pane fade">
                <div class="col-sm-4">
                  <br/>
                  <span><p>100% من المستخدمين ينصحون بهذا المنتج لصديق.</p></span>
                  <h2>قيم هذا المنتج:</h2>
                  <span class="fa fa-star-o"></span>
                  <span class="fa fa-star-o"></span>
                  <span class="fa fa-star-o"></span>
                  <span class="fa fa-star-o"></span>
                  <span class="fa fa-star-o"></span>
                  <br/>
                  <br/>
                </div>
                <div class="col-sm-4">
                  <br/>
                  <div class="row">
                    <div class="col-sm-2">
                      <span>(20)</span>
                    </div>
                    <div class="col-sm-8">
                      <div class="progress">
                          <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="70"
                           aria-valuemin="0" aria-valuemax="100" style="width:70%">
                           </div>
                         </div>
                      </div>
                      <div class="col-sm">
                        <span>5نجوم</span>
                      </div>
                  </div>
                    <div class="row">
                      <div class="col-sm-2">
                        <span>(20)</span>
                      </div>
                      <div class="col-sm-8">
                      <div class="progress">
                          <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="70"
                           aria-valuemin="0" aria-valuemax="100" style="width:70%">
                           </div>
                     </div>
                    </div>
                    <div class="col-sm">
                      <span>5نجوم</span>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-2">
                      <span>(20)</span>
                    </div>
                    <div class="col-sm-8">
                    <div class="progress">
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="70"
                         aria-valuemin="0" aria-valuemax="100" style="width:70%">
                         </div>
                   </div>
                  </div>
                  <div class="col-sm">
                    <span>5نجوم</span>
                  </div>
                </div>
              </div>
                <div class="col-sm-4" >
                  <div class="col-sm-12" style="text-align:center;" >
                    <div>
                      <br/>
                      <br/>
                        <span style="font-size:20pt;font-style:bold;border: 1px solid #bbb;border-radius:50px;width:100px;height:100px;padding:30px;">4.7</span>
                        <br/>
                        <br/>
                    </div>
                    <br/>
                    <div>
                      <span class="fa fa-star-o"></span>
                      <span class="fa fa-star-o"></span>
                      <span class="fa fa-star-o"></span>
                      <span class="fa fa-star-o"></span>
                      <span class="fa fa-star-o"></span>
                      <br/>
                      4.7 من 5

                    </div>
                    <div>
                        25 تقييم
                        <br/>
                        <br/>
                        <br/>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-sm-12">
          @foreach ($productsToCategory as  $key => $product_rel)
            <div class="col-sm-2" style="border:1px solid #bbb;margin:3px;">
            <a href="{{ $product_rel->getUrl() }}"> <img src="{{ asset($product_rel->getThumb()) }}" alt="{{ $product_rel->name }}" style="width:100%;" class="block-center"/></a>
            {!! $product_rel->showPrice() !!}
            <a href="{{ $product_rel->getUrl() }}"><p>{{ $product_rel->name }}</p></a> 
          </div>
           @endforeach
          </div>
          <div class="col-sm-12">
          </div>


      </div>
      <div class="col-sm-2" style="padding:0px;"><!-- content right-->
        <div class="col-sm-12" style="padding:0px;">
          <ul class="product-right-list"style="padding:0px;">
            <li class="product-right-list-head"> <a class="product-right-list-link" href="#">إظهار جميع الاقسام</a> &nbsp;<span class="fa fa-angle-left"></span>
            </li>
            <li class="product-right-list-item"><b><a class="product-right-list-link"href="#">القسم الخاص بالمنتج </a></b><span  style="color:#bbb;">(10)</span></li>


          </ul>
        </div>
        <div class="col-sm-12" style="padding:0px;">
        @if (!empty($banner))
        <a href="{{$banner->url}}">
          <img src="{{ asset($path_file.'') }}/{{ $banner->image }}" alt=""  class="product-detail-banner block-center"/>
          </a>
          @endif
        </div>
     </div>
</div><!-- end content div -->
<br/>
<br/>
@include('blockView/featured_category')
<br/>


@endsection

@section('breadcrumb')
@endsection

@push('styles')

@endpush
@push('scripts')
<script>
    function closeModal(){ 
      $('#paymentTermModal').modal('toggle');
    }
  
</script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5bd09e60b8c26cab"></script>
@endpush
