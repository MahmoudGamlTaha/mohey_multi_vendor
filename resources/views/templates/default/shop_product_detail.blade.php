@extends($theme.'.shop_layout')
@php
    $banner = \App\Models\Banner::where('status', 1)->where('type_id', 1)->sort()->first();
  @endphp
@section('center')
<div class="row">
    @php
        $category = $product->category()->first();
        $cat_id = $category->id;
        $lang = App\Models\Language::where('code', app()->getLocale())->first();
        $categories = DB::select(DB::raw("WITH RECURSIVE cte AS (SELECT id, parent FROM shop_category WHERE id = ?
            UNION ALL
            SELECT d.id, d.parent
            FROM shop_category d
            INNER JOIN cte
            ON  d.id = cte.parent
        ) SELECT * FROM cte "), [$cat_id]);
    @endphp
    <ul class="page-addressbar">
        <li class="page-addressbar-head"><a href="{{ env('APP_URL') }}">الرئيسية</a></li>
        <li> > </li>
        <li class="page-addressbar-tail"><a href="#">{{$title}}</a></li>
        @foreach($categories as $value)
            @php
                $productCategories = \App\Models\ShopCategoryDescription::where('shop_category_id', $value->id)->where('lang_id', $lang->id)->get();
            @endphp
            @foreach ($productCategories as $productCategory)
                <li> < </li>
                <li class="page-addressbar-item"><a href="{{env('APP_URL').'/category/'.strtolower($productCategory->name).'_'.$productCategory->shop_category_id}}">{{$productCategory->name}}</a> </li>
            @endforeach
        @endforeach
    </ul>
</div>
<br/>
<div class="row"><!-- content div -->
  <div class="col-sm-1">
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
                    @for ($i = 0; $i < 5; ++$i)
                        <span style="color:{{$percent<= $i?' wheat':' #FFBC41'}}" data-index="{{$i}}" class="fa fa-star rateStar-{{$i}}"></span>
                    @endfor
                        هذا المنتج تقييمه<p class="ratePercentage">{{$ratePercentage.'%'}}</p>
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
<div class="clearfix"></div>
              <hr style="margin: 0 0 15px 0">
              <div class="col-sm-12">
                <div class="col-sm-4">
                  <button class="btn btn-default btn-content" style="float: left;">بيع هذا المنتج</button>
                </div>
                <div class="col-sm-8">
                  <i class="fa fa-heart-o" style="color: #a8a8a8"></i> &nbsp;<a href="" style="color: #a8a8a8 ; margin-left: 30px">إضافة الى قائمة المفضلة</a>
                  <a onClick="addToCart('{{ $product->id }}','compare',$(this))" style="color: #a8a8a8">  
                    <i class="fa fa-refresh" style="color: #a8a8a8" ></i>&nbsp; مقارنة</a>
                  <ul class="list-unstyled product_details">
                   <!-- <li> <b>شركة</b>  {{count($product->company()->get()) == 0? 'Dokkani' : $product->company()->first()->name }}</li>-->
                   <li> <b>شركة</b> Dokkani</li>
                    <li><b>SKU</li>
                    <li>{{ $product->sku }}</li>
                  </ul>
                  <br/>
                </div>
              </div>
              <form id="buy_block" action="{{ route('postCart') }}" method="post">
              {{ csrf_field() }}
              <input type="hidden" name="product_id" value="{{ $product->id }}" />
              <div class="col-sm-12">
                <div class="col-sm-12" >
                  <span><del>EGP90.00</del></span>

                  <span style="margin: -20%">{!! $product->showPrice() !!}</span>
                </div>
                <div class="col-sm-12">
                  <br>
                  <input type="number" class="form-control" style="width:50%;display:inline;" name="qty" value="1"/>
                  <button class="btn btn-default btn-content" type="submit"> <i class="fa fa-shopping-cart" style="color:white;"></i> {{trans('language.add_to_cart')}}</button>
                  <button style="display:inline" class="btn btn-default btn-content" data-toggle="modal" data-target="#paymentTermModal">نظام الدفع</button>
                </form>
              <br>
               
              
                </div>
              </div>
          </div>
         <!-- // -->

         
          <div  id="paymentTermModal" class="modal fade" role="dailog" aria-hidden="true" tabindex="-1" style="overflow:auto">
              <div class="modal-dialog" role="document">
                   <div class="modal-content">
                        <div class="modal-header" style="height: 60px;">
                          <h5 class="modal-title" style="text-align: left;width: 80%;float: left; color:#10243f;font-size: 16px;
                          text-transform: capitalize;">select Available Payment Term</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                <div class="model-body" style="padding: 20px 10px 5px 10px">
                  <ul>
                 <form action="{{ route('postCart') }}" method="post">
                   @if($paymentTerms != null) 
                 @foreach($paymentTerms as $key => $payment)
                     <li><input type="radio" name="payment[]" value = "{{$payment->id}}"/> {{$payment->paymentTerm()->first()->name}} </li>
                 @endforeach
                 <input type="hidden" name="qty" value="1">
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
                          <button class="btn btn-default btn-default1"  onclick="closeModal()">الغاء</button>
                          </div>
                  </div>
                </div>
              </div>
          </div>
              </div>
          <!-- // -->
          <div class="col-sm-4" >
            <div class="col-sm-12" style="padding:0px;">
              <img src="{{ asset($product->getImage()) }}" alt="" style="width:100%;height:200px;border: 1px solid #eee" class="block-center"/>
            </div>
            <div class="col-sm-12" style="padding:0px;">
            @if ($product->images->count())
                       @foreach ($product->images as $key=>$image)
                <div class="col-sm-3"style="padding:0px;"> 
                  <img src="{{ asset($image->getImage()) }}" alt="" style="width:100%;height:100px;margin-top: 2px; border:1px solid #eee"  class="block-center"/>
                </div>
                @endforeach
            @endif

            </div>

          </div>          

          <div class="clearfix"></div>
<hr>
          <div class="col-sm-12">
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
                  <span><p class="ratePercentage2">{{$ratePercentage.'%'}} من المستخدمين ينصحون بهذا المنتج لصديق.</p></span>
                  <h4>قيم هذا المنتج:</h4>
                    <div align="center" style="color:white;">
                        <i class="fa fa-star fstar fa-2x" data-index="0"></i>
                        <i class="fa fa-star fstar fa-2x" data-index="1"></i>
                        <i class="fa fa-star fstar fa-2x" data-index="2"></i>
                        <i class="fa fa-star fstar fa-2x" data-index="3"></i>
                        <i class="fa fa-star fstar fa-2x" data-index="4"></i>
                        <br><br>
                    </div>
                </div>
                  <br>
                  <div class = "vertical" style="border-left: .3px solid lightgray;height: 180px;position:absolute;left: 34.5%; "></div>
                <div class="col-sm-5">
                    @for($i=1;$i<=5;$i++)
                    <div class="row">
                          <div class="col-sm-2">
                              <span data-index="{{$i}}" id="label-{{$i}}" class="user-count">
                                  @foreach($productLikes as $productLike)
                                  @if(isset($productLike['rate']) && $productLike['rate'] == $i) ({{$productLike['user_count']}}) @break @endif
                                  @endforeach
                              </span>
                          </div>
                          <div class="col-sm-6">
                              <div class="progress" style="margin-bottom: 10px;">
                                  <div data-index="{{$i}}" id="star-{{$i}}" class="progress-bar progress-bar-warning progress-bar" role="progressbar" aria-valuenow="70"
                                   aria-valuemin="0" aria-valuemax="100" style="width:
                                  @if(isset($productLike['rate']) && $productLike['rate'] == $i){{100 * $productLike['user_count']/$userCount}}% @endif">
                                   </div>
                              </div>
                          </div>
                      <div class="col-sm-3">
                        <span>{{$i}} نجوم</span>
                      </div>
                    </div>
                    @endfor
              </div>
                  <div class = "vertical" style="border-left: .3px solid lightgray;height: 180px;position:absolute;left: 70%; "></div>
                <div class="col-sm-3" >
                  <div class="col-sm-12" style="text-align:center;" >
                    <div style="width: 155px;">
                      <br/>
                      <br/>
                        <span class="percent" style="font-size:15pt;font-style:bold;border: 1px solid #bbb;border-radius:50px;width:90px;height:90px;padding:25px;">{{$percent}}</span>
                        <br/>
                        <br/>
                    </div>
                    <br/>
                      <div>
                          @for ($i = 0; $i < 5; ++$i)
                              <span style="color:{{$percent<= $i?' wheat':' #FFBC41'}}" data-index="{{$i}}" class="fa fa-star rateStar-{{$i}}"></span>
                          @endfor
                          <br/>
                          <div style="display:inline" class="percent">{{$percent}}</div> من 5

                      </div>
                      <div>
                          <div style="display:inline" class="userCount">{{$userCount}}</div> تقييم
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
            <div class=" card col-sm-3" style="width:23%; border:1px solid #bbb;margin:3px;">
            <a href="{{ $product_rel->getUrl() }}">
               <img  class="card-img-top" src="{{ asset($product_rel->getThumb()) }}" alt="{{ $product_rel->name }}" style="width:100%;" class="block-center"/></a>
            
               <div class="card-body">
                <h5 class="card-title"> <span> {!! $product_rel->showPrice() !!} <span></h5>
                <p class="card-text"  style="text-align: center ; background: #10243f;border-radius:0 15px; padding: 4px;">
                  <a href="{{ $product_rel->getUrl() }}" style="color: white" >
                {{ $product_rel->name }}</a> 
              </p>
              </div>
            
              
            
          </div>
           @endforeach
          </div>

       

          <div class="col-sm-12">

        
          </div>


      </div>


      <div class="col-sm-3" style="padding:0px;"><!-- content right-->
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
          <img src="{{ asset($path_file.'') }}/{{ $banner->image }}" alt=""  class="product-detail-banner block-center" style="width:100% !important"/>
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
        var ratedIndex = -1, uID = {{Auth::id() ?? 0}};

        $(document).ready(function () {
            resetStarColors();

            if (localStorage.getItem('ratedIndex') != null) {
                setStars(parseInt(localStorage.getItem('ratedIndex')));
                uID = localStorage.getItem('uID');
            }

            $('.fstar').on('click', function () {
                @if(Auth::id() != null)
                ratedIndex = parseInt($(this).data('index'));
                localStorage.setItem('ratedIndex', ratedIndex);
                saveToTheDB();
                @else
                window.location.replace("{{ route('login') }}");
                @endif
            });

            $('.fstar').mouseover(function () {
                resetStarColors();
                var currentIndex = parseInt($(this).data('index'));
                setStars(currentIndex);
            });

            $('.fstar').mouseleave(function () {
                resetStarColors();

                if (ratedIndex != -1)
                    setStars(ratedIndex);
            });
        });

        function saveToTheDB() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{ route('productRate') }}",
                method: "POST",
                dataType: 'json',
                data: {
                    _token: '{{csrf_token()}}',
                    uID: "{{Auth::id() ?? 0}}",
                    ratedIndex: ratedIndex,
                    productID:  {{ $product->id }} ,
                    companyID: {{ $product->company()->first()->id ?? 0}},
                },
                success: function (result) {
                    uID = result.id;
                    localStorage.setItem('uID', uID);
                    $(".ratePercentage").html(result.ratePercentage+'%');
                    $(".ratePercentage2").html(result.ratePercentage+'%'+' من المستخدمين ينصحون بهذا المنتج لصديق.');
                    $(".percent").html(result.percent);
                    $(".userCount").html(result.userCount);
                    for (var i=0; i <= 4; i++){
                        if($(".rateStar-"+i).data('index') < result.percent){
                            $(".rateStar-"+i).css('color', '#FFBC41');
                        }else{
                            $(".rateStar-"+i).css('color', 'wheat');
                        }
                    }
                    function reset() {
                        for (let j = 1; j <= 5; j++) {
                            $("#star-" + j).css("width", 0 + "%");
                            $("#label-" + j).html("(" + 0 + ")");
                        }
                    }
                    reset();
                    for (let i=0;i< result.productLikes.length;i++)
                    {
                        let star = result.productLikes[i];
                        let percent = star.user_count * 100 / result.userCount;
                        $("#label-"+star.rate).html("("+star.user_count+")");
                        $("#star-"+star.rate).css("width", percent+"%");
                    }
                },
            });
        }
        function setStars(max) {
            for (var i=0; i <= max; i++)
                $('.fstar:eq('+i+')').css('color', '#FFBC41');
        }

        function resetStarColors() {
            $('.fstar').css({'color': 'wheat'});
        }
    </script>
<script>
    function closeModal(){ 
      $('#paymentTermModal').modal('toggle');
    }
  
</script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5bd09e60b8c26cab"></script>
@endpush
