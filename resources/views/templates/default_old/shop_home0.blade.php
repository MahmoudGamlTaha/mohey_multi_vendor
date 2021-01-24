@extends($theme.'.shop_layout')

@section('center')
          <!-- sprint 3-->
          <div class="row">
            <div class="col-sm-10">
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
              <div class="col-sm-2 home-top-row-ads">
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:150px;"alt=""/>
              </div>
            </div>
            <div class="col-sm-2">
              <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;height:310px;"alt=""/>
            </div>
          </div>
          <br/>
          <div class=" row features_items"><!--features_items-->
              <div class="row">
                <h2 class="title text-center center-block">{{ trans('language.features_items') }}</h2>
              </div>
            <div class="row">
              <div class="col-sm-2">
                <h3 class="text-center">الاكثر مبيعا</h3>
                <div class="col-sm-6" style="padding:0px;">
                  <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;hieght:100%;"alt=""/>
                </div>
                <div class="col-sm-6"style="padding:0px;">
                  <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;hieght:100%;"alt=""/>
                </div>
                <div class="col-sm-6"style="padding:0px;">
                  <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;hieght:100%;"alt=""/>
                </div>
                <div class="col-sm-6"style="padding:0px;">
                  <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;hieght:100%;"alt=""/>
                </div>
              </div>
              <div class="col-sm-8">

                @foreach ($products_new as  $key => $product_new)
                <!-- @if ($key % 4 == 0)
                  <div class="row item {{($key == 0)?'active':''}}">
                    <div class="col-sm-2">
                        <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" alt="{{$key}}"></img>
                     </div>
                @endif -->
                <!-- @if ($key % 4 == 0)
                  <div class="row">
                @endif -->
                  <div class="col-sm-3">
                    <div class="product-image-wrapper product-single">
                      <div class="single-products product-box-{{ $product_new->id }}">
                          <div class="productinfo text-center">
                            <a href="{{ $product_new->getUrl() }}"><img src="{{ asset($product_new->getThumb()) }}" alt="{{ $product_new->name }}" /></a>
                            {!! $product_new->showPrice() !!}
                            <a href="{{ $product_new->getUrl() }}"><p>{{ $product_new->name }}--{{ $key}}</p></a>
                            <a class="btn btn-default add-to-cart" onClick="addToCart('{{ $product_new->id }}','default',$(this))"><i class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a>
                          </div>
                     @if ($product_new->price > $product_new->getPrice())
                      <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                      @elseif($product_new->type == 1)
                      <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                      @endif
                      </div>
                      <div class="choose">
                        <ul class="nav nav-pills nav-justified">
                          <li><a onClick="addToCart('{{ $product_new->id }}','wishlist',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_wishlist')}}</a></li>
                          <li><a onClick="addToCart('{{ $product_new->id }}','compare',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_compare')}}</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>

               @endforeach

             </div>
             <div class="col-sm-2">
               <h3 class="text-center">افضل عرض</h3>
                <img src="{{ asset($theme_asset.'/images/home/side.jpg') }}" style="width:100%;hieght:auto;"alt=""/>

             </div>
           </div>
          </div><!--features_items-->
          <div class="row">
            <div class="row">
                <div class="col-sm-2">
                  &nbsp;
                </div>
                <div class="col-sm-8 home-fdep-section">
                  <div class="row home-fdep-section-title">

                  <h4>الاقسام المميزة</h4>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>
                  <div class="col-sm-2 home-bottom-row-fdep">
                    <a href=""><img src="{{ asset($theme_asset.'/images/home/last.jpg') }}" alt=""  class="block-center"/>
                    <p class="text-center">اسم القسم</p></a>
                  </div>

                </div>
                <div class="col-sm-2">
                  &nbsp;
                </div>
            </div>
          </div>
          <div class="row recommended_items"><!--recommended_items-->
            <div class="row">
            <h2 class="title text-center">{{ trans('language.products_hot') }}</h2>
          </div>
          <div class="row">
            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                @foreach ($products_hot as  $key => $product_hot)
                @if ($key % 3 == 0)
                  <div class="item {{  ($key ==0)?'active':'' }}">
                @endif
                  <div class="col-sm-2">
                    <div class="product-image-wrapper product-single">
                      <div class="single-products   product-box-{{ $product_hot->id }}">
                          <div class="productinfo text-center">
                            <a href="{{ $product_hot->getUrl() }}"><img src="{{ asset($product_hot->getThumb()) }}" alt="{{ $product_hot->name }}" /></a>
                            {!! $product_hot->showPrice() !!}
                            <a href="{{ $product_hot->getUrl() }}"><p>{{ $product_hot->name }}</p></a>
                            <a class="btn btn-default add-to-cart" onClick="addToCart('{{ $product_hot->id }}','default',$(this))"><i class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a>
                          </div>
                          @if ($product_hot->price != $product_hot->getPrice())
                          <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                          @elseif($product_hot->type == 1)
                          <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                          @endif
                      </div>
                      <div class="choose">
                        <ul class="nav nav-pills nav-justified">
                          <li><a onClick="addToCart('{{ $product_hot->id }}','wishlist',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_wishlist')}}</a></li>
                          <li><a onClick="addToCart('{{ $product_hot->id }}','compare',$(this))"><i class="fa fa-plus-square"></i>{{trans('language.add_to_compare')}}</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                @if ($key % 3 == 2 || $key+1 == $products_hot->count())
                  </div>
                @endif
               @endforeach

              </div>
               <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                <i class="fa fa-angle-right"></i>
                </a>
                <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                <i class="fa fa-angle-left"></i>
                </a>
            </div>
          </div>
          </div><!--/recommended_items-->

          <div class="row category-tab"><!--category-tab-->
            <div class="col-sm-12">
              <ul class="nav nav-tabs">
                @foreach ($categories[0] as $key => $category)
                  <li {{ ($key ==0)?'class="active"':'' }}><a href="#cate{{ $key }}" data-toggle="tab">{{ $category->name }}</a></li>
                @endforeach
              </ul>
            </div>
            <div class="row tab-content">
              @foreach ($categories[0] as $key => $category)
                <div class="tab-pane fade {{ ($key ==0)?'active in':'' }}" id="cate{{ $key }}" >
                  @foreach ($category->getProductsToCategory($category->id,4) as $product)
                    <div class="col-sm-2">
                      <div class="product-image-wrapper product-single">
                        <div class="single-products  product-box-{{ $product->id }}">
                          <div class="productinfo text-center">
                            <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}" alt="{{ $product->name }}" /></a>
                            {!! $product->showPrice() !!}
                            <a href="{{ $product->getUrl() }}"><p>{{ $product->name }}</p></a>
                            <a class="btn btn-default add-to-cart" onClick="addToCart('{{ $product->id }}','default',$(this))"><i class="fa fa-shopping-cart"></i>{{trans('language.add_to_cart')}}</a>
                          </div>
                          @if ($product->price != $product->getPrice())
                          <img src="{{ asset($theme_asset.'/images/home/sale.png') }}" class="new" alt="" />
                          @elseif($product->type == 1)
                          <img src="{{ asset($theme_asset.'/images/home/new.png') }}" class="new" alt="" />
                          @endif

                        </div>
                      </div>
                    </div>
                  @endforeach
                </div>
              @endforeach
            </div>
          </div><!--/category-tab-->


@endsection



@push('styles')
@endpush

@push('scripts')

@endpush
