@extends($theme.'.shop_layout')
@section('main')
@php
$ImageUp = \App\Models\Banner::where('status',1)->where('type_id',5)->sort()->first();
$ImageDown = \App\Models\Banner::where('status',1)->where('type_id',6)->sort()->first();
$ImageLeft = \App\Models\Banner::where('status',1)->where('type_id',7)->sort()->first();
@endphp
<section >
  <div class="row">
      <ul class="page-addressbar">
        <li class="page-addressbar-head"><a href="#">الرئيسية</a></li>
        <li> > </li>
        <li class="page-addressbar-item"><a href="#">صفحة المستخدم</a> </li>
      </ul>
  </div>
  <br/>
  
  <div class="row">
    <div class="col-sm-10">
      &nbsp;
    </div>
    <div class="col-sm-2" style="text-align:center;">
          <a href="#"><img src="{{ asset($user->getImage())}}"  alt="userImage" style="width:180px;height:200px;"/><i data-toggle="modal" data-target="#profileImage" class="fa fa-camera"></i></a>
          <br/>
          <br/>
          <div  id="profileImage" class="modal fade" role="dailog" aria-hidden="true" tabindex="-1">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">
                       <div class="modal-header">
                             <h5> add profile Image</h5>
                        </div>
                  <div class="model-body">
                    <div class="col-sm">
                    <form method="post" action="/" enctype="multipart/form-data" id="uploadForm">
                  
                     <input type ="file" name="profileImage" type="file" accept="image/*" id="profileImage"/>
                       <div class='preview'>
                         <img src="" id="img" hidden width="100" height="100">
                       </div>
                    </div>
                    <div class="col-sm">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="btn_upload" class="btn btn-btn-sucess" onclick="uploadImage()">upload</button>
                    </div>
                    </form>
                  </div>
                   </div>
               </div>
          </div>
    </div>
  </div>
  <div class="row">
     <div class="tab-content">
        <div id="home" class= "tab-pane fade in active">
           <div class="col-sm-2" style="top:-25px">
             @if(isset($ImageLeft))
                <a href="{{$ImageLeft->url}}" target="_blank"><img src="{{ asset($path_file.'') }}/{{$ImageLeft->image}}" style="width:100%;height:40%;" ></img></a>
                @else
                <a href="#" target="_blank"><img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:100%;height:40%;" ></img></a>
                @endif
                </div>
                <div class="col-sm-8" style="text-align:center;top:-110px;">
                  <div class="row">
                    <div class="col-sm-6">
                      <h3>منتجات تم زيارتها من قبل</h3>
                      
                      <a href="#"><span class="fa fa-angle-right"></span></a>
                      @foreach($lastViewProd as $key => $value)
                     
                      <a href="{{$value->getUrl()}}"><img src="{{ asset($value->getThumb())}}" alt="" style="width:30%;"/> </a>
                      @endforeach
                      <a href="#"><span class="fa fa-angle-left"></span></a>
                    </div>
              <div class="col-sm-6">
                <h3>اشحن موبايلك</h3>
                @if(isset($ImageUp))
                <a href="{{$ImageUp->url}}" target="_blank"><img src="{{ asset($path_file.'') }}/{{$ImageUp->image}}" style="width:100%;height:150px;" ></img></a>
                @else
                <a href="#" target="_blank"><img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:100%;height:150px;" ></img></a>
                @endif
              </div>
            </div>
            <div class="row">
              <div class="col-sm-6">
                <h3>عروض دكانى</h3>
                <a href="#"><span class="fa fa-angle-right"></span></a>
                @foreach($prodPriceOffer as $key => $value)
                     
                     <a href="{{$value->getUrl()}}"><img src="{{ asset($value->getThumb())}}" alt="" style="width:30%;"/> </a>
                     @endforeach
                <a href="#"><span class="fa fa-angle-left"></span></a>
              </div>
              <div class="col-md-6">
              <h3>كوبونات الخصم</h3>
              @if(isset($ImageDown))
                <a href="{{$imageDown->url}}" target="_blank"><img src="{{ asset($path_file.'') }}/{{$ImageDown->image}}" style="width:100%;height:150px;" ></img></a>
              @else
              <a href="#" target="_blank"><img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:100%;height:150px;" ></img></a>
              @endif
              </div>
              </div>
            </div>
            </div> <!-- end tab home -->
            <div id="userOrder" class="tab-pane fade">
             <div class="col-sm-10">
                <div class="col-sm-13 table-responsive">
                <table class="table table-striped">
                    <thead>
                      <tr>
                        <th style="width: 15%;text-align:right;"></th>
                        <th style="width: 30%;text-align:right;">المنتج</th>
                        <th style="width: 10%;text-align:right;">السعر</th>
                        <th style="width: 10%;text-align:right;">الكمية</th>
                        <th style="width: 10%;text-align:right;">الاجمالى</th>
                        <th style="width: 25%;text-align:right;">حالة الاوردر</th>
                      </tr>
                </thead>
                <tbody>
                
              
                  @foreach($orders as $key => $order)
                  <tr>
                    <td style="text-align:center;">
                    <a href="{{ $order->product()->first()->getUrl() }}"><img width="100" src="{{asset($order->product()->first()->getImage())}}" alt=""></a>
                    </td>
                    <td>
                      <span class="cart-product-span">رقم الاوردر: {{$order->order_id}}</span>
                      <br/>
                      <span class="cart-product-span">اسم المنتح: {{$order->product()->first()->name}}</span>
                      <br/>
                      <span>البائع:</span>
                      <br/>
                      <span>{{$order->company()->first() == null? 'Dokkani':$order->company()->first()->name}}</span>
                      <br/>
                      <br/>
                      <a href=""><span class="fa fa-info"></span> تفاصيل</a> 
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <a href="" class='{{$order->status == 0? "":"btn disabled"}}'><span class="fas fa-prescription-bottle"></span>الغاء </a>

                      </td>
              <td>
                <span class="cart-total-span">EGP {{$order->price}}</span>
              </td>
              <td>
                   {{$order->qty}}
              </td>
              <td>
                <span style="color:#81C4E6;">EGP {{$order->price * $order->qty}}</span>
              </td>
              <td>
                      
              @if(($order->status == 0))
                <div class="col-sm-8">
                  <span style="color:#F99F3C;font-size:14pt;font-weight:bold;">قيد المراجعة </span>
                </div>
                <div class="col-sm-4">

                  <img src="{{ asset($theme_asset.'/images/home/profilerequeststatus1.jpg') }}" style="width:40px;height:40px;"/>
                </div>
                @elseif(($order->status) == 1)
                <div class="col-sm-8">
                  <button class="profile-right-list-link" style="height:25px;background-color:black;align-items:center" href="#home">تتبع طلبك</button>
                  جاري التحضير
                 </div>
                <div class="col-sm-4">

                  <img src="{{ asset($theme_asset.'/images/home/follow.JPG') }}" style="width:40px;height:40px;"/>
              
                </div>
            
                
                @elseif($order->status == 3 )
                <div class="col-sm-8">
                  <span style="color:#F99F3C;font-size:14pt;font-weight:bold;">تم الالغاء</span>
                </div>
                <div class="col-sm-4">

                  <img src="{{ asset($theme_asset.'/images/home/canceled.jpg') }}" style="width:40px;height:40px;"/>
                </div>
                @elseif($order->status == 4 )
                <div class="col-sm-8">
                  <span style="color:#F99F3C;font-size:14pt;font-weight:bold;">تم التسليم</span>
                </div>
                <div class="col-sm-4">

                  <img src="{{ asset($theme_asset.'/images/home/done.jpg') }}" style="width:40px;height:40px;"/>
                </div>
                @endif
                
              </td>
            </tr>
          @endforeach
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3">
                {{$orders->links()}}
             </td>
            </tr>
          </tfoot>
        </table>
      </div>
            </div>
          </div> <!-- end tab userOrder -->
        
          <div id="userWishList" class="tab-pane fade">
          <div class="col-sm-10">
                <div class="col-sm-13 table-responsive">
                <div class="col-sm-13 table-responsive">
                <table class="table table-striped">
                    <thead>
                      <tr>
                        <th style="width: 15%;text-align:right;"></th>
                        <th style="width: 30%;text-align:right;">المنتج</th>
                        <th style="width: 10%;text-align:right;">السعر</th>
                      </tr>
                </thead>
                <tbody>
                  @foreach($wishList as $key => $product)
                  <tr>
                    <td style="text-align:center;">
                    <a href="{{ $product->getUrl() }}"><img width="100" src="{{asset($product->getImage())}}" alt=""></a>
                    </td>
                    <td>
                      <span class="cart-product-span"> المنتج: {{$product->name}}</span>
                      <br/>
                      <span>البائع:</span>
                      <br/>
                      <span>{{$product->company()->first() == null? 'Dokkani':$order->company()->first()->name}}</span>
                      <br/>
                      <br/>
                      <a href="{{ $product->getUrl() }}">Sku: <span class="fa fa-info"></span> {{$product->sku}}</a>
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <a href="" ><span class="fas fa-prescription-bottle"></span>حذف </a>

                      </td>
              <td>
                <span class="cart-total-span">EGP {{$product->price}}</span>
              </td>
          
            </tr>
          @endforeach
          </tbody>
          <tfoot>
            <td colspan="3">
            {{$wishList->links()}}
            </td>
          </tfoot>
        </table>
      </div>
            
                </div>
          </div>
          </div><!-- end wishList -->
          <div id="profileedit1" class="tab-pane fade">
          <div class="col-sm-10">
                <div class="col-sm-13 table-responsive">
                 
                  <form method="post"> 
                    <div class="col-md-6">
                    <br/>
                     <div class="input-group"> 
                     <span  class= "input-group-addon transparent form-addon-left"> الاسم <i class="glyphicon glyphicon-user"></i> </span>
                    <input type="text" value="{{$user->name}}" class="form-control form-addon-right" ></input>  
                   
                  </div>
                  <br/>  
                  <div class="input-group"> 
                    <span class= "input-group-addon transparent form-addon-left">البلد</span>
                    <input type="text" value="{{$user->country}}" class="form-control form-addon-right"></input>
                    </div>
                    <br/>
                    <div class="input-group"> 
                    <span class= "input-group-addon transparent form-addon-left" >المحافظة</span>
                    <input type="text" value="{{$user->city}}" class="form-control form-addon-right" ></input>
                    </div>  
                   
                  </div>
                    <div class="col-md-6">
                    <br/>
                    <div class="input-group">
                     <span class= "input-group-addon transparent form-addon-left" >رقم الموبايل
                        <i class="fa fa-phone" aria-hidden="true"></i></span>
   
                         <input class="form-control form-addon-right" value="{{$user->mobile}}" placeholder="mobile" type="text" name="mobile">  
                     </div>
                     <br/>
                      <div class="input-group"> 
                    <span class="input-group-addon transparent form-addon-left">الايميل <i class="fa fa-envelope" aria-hidden="true"></i> </span>
                    <input type="text" value="{{$user->username}}" class="form-control form-addon-right" ></input>
                      </div>
                    @if($user->company() != null)
                    <br/>
                    <div class="input-group">
                    <span class="input-group-addon transparent form-addon-left">الشركة <i class="fas fas-building" aria-hidden="true"></i></span>
                       <input type="text" value="{{$user->company()->first()->name}}" class="form-control form-addon-right"></input>
                     </div>
                     @endif 
                    </div> 
                  </div>
                  <br/>
                  <div class="col-md-12">
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                  <button class = "btn" value="submit" style="width: 100%">تعديل</button>
                  </div>
                </form>
          </div>
          </div><!-- end profile -->
          <div id="profilewallet" class="tab-pane fade">
          <div class="col-sm-10">
                <div class="col-sm-13 table-responsive">
                <table class="table table-striped">
                   
                <tbody>
                  <tr>
                    <td style="text-align:center;">
                      <img src="" alt="" style="width:50px; height:50px;" />
                    </td>
                    <td>
                      <span class="cart-product-span">اجمالي عدد المنتجات المشتراه:</span>
                      <span> @if(isset($totals['products'])) {{$totals['products']}} @else 0 @endif منتج </span>
                      <br/>
    
                      <br/>
                      <br/>
                      &nbsp;&nbsp;&nbsp;&nbsp;
    
                      </td>
              <td>
                <span class="cart-total-span">اجمالي المشتريات</span>
                <span>  @if(isset($totals['total'])) {{$totals['total']}} @else 0 @endif ج.م</span>
                  <br/>
              </td>
              <td>
                <span style="color:#81C4E6;"> رصيدك الحالي</span>
                <span>  @if(isset($totals['total']) && isset($totals['paid']) ) {{$totals['paid'] - $totals['total']}} @else 0 @endif ج.م </span>
              </td>
              <td>
                    <h3></h3>
              </td>
            </tr>
            <tr><!-- recharge tab -->
                    <td style="text-align:center;">
                      <img src="" alt="" style="width:50px; height:50px;" />
                    </td>
                    <td>
                      <span class="cart-product-span">اشحن رصيدك</span>
                      <br/>
                      <div style="width:70px;height:20px;align-items:center;border-radius:5px;background-color:black">
                      <a style="color:white;padding-right:5px" href="#">اشحن</a>
                      </div>                      
    
                      <br/>
                      <br/>
                      &nbsp;&nbsp;&nbsp;&nbsp;
    
                      </td>
              <td>
                <span class="cart-total-span">تحويل رصيد/span>
                <span> 0 ج.م</span>
                  <br/>
              </td>
              <td>
                <span style="color:#81C4E6;"> رصيدك الحالي</span>
                <span>0 ج.م</span>
              </td>
              <td>
                    <h3></h3>
              </td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3">
            
             </td>
            </tr>
          </tfoot>
        </table>

              </div>
          </div>
          </div> 
          
     </div>
    <div class="col-sm-2">
      <ul class="profile_right_list" id="ulProfile" style="padding:0px;">
      <a data-toggle="tab" class="profile-right-list-link active orange-bk"  href="#home">  <li class="active orange-bk" style="height: 50px;align-items:center"  onclick="changeStyle(this)"> الرئيسية</li>  </a>      
      <a data-toggle="tab" id="userOrderLi" class="profile-right-list-link" href="#userOrder"> <li style="height: 50px;align-items:center"  onclick="changeStyle(this)"> طلباتى</li></a>
      <a data-toggle="tab" id="userWishListLi" class="profile-right-list-link" href="#userWishList"> <li style="height: 50px;align-items:center"  onclick="changeStyle(this)"> المفضلة</li></a>
      <a data-toggle="tab" class="profile-right-list-link" href="#profileedit1"> <li style="height: 50px;align-items:center"  onclick="changeStyle(this)"> تعديل بيانات الحساب</li></a>
      <a data-toggle="tab" class="profile-right-list-link" href="#profilewallet"> <li style="height: 50px;align-items:center"  onclick="changeStyle(this)">محفظتى</li></a>
        
     <a class="profile-right-list-link" href="{{ route('logout') }}" rel="nofollow" onclick="event.preventDefault();
                   document.getElementById('logout-form').submit();">
                   <li style="height: 50px;align-items:center"><i class="fa fa-power-off"></i> {{ trans('language.logout') }} </li>
                  </a>
      </ul>
    </div>
  </div>
 <br/>
 <br/>
 <br/>
</section>
@endsection

@section('breadcrumb')

@endsection
