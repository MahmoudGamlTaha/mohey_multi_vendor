@extends($theme.'.shop_layout')

@section('center')
  <div class="features_items">
    <h2 class="title text-center">{{ $title }}</h2>

    @isset ($itemsList)
      @if($itemsList->count())
      <div class="item-folder">
            @foreach ($itemsList as  $key => $item)
            <div class="col-sm-3 col-xs-4">
                <div class="item-folder-wrapper product-single">
                  <div class="single-products">
                    <div class="productinfo text-center product-box-{{ $item->id }}">
                      <a href="{{ $item->getUrl() }}"><img src="{{ asset($item->getThumb()) }}" alt="{{ $item->name }}" /></a>
                      <a href="{{ $item->getUrl() }}"><p>{{ $item->name }}</p></a>
                    </div>
                  </div>
                </div>
            </div>
            @endforeach
        <div style="clear: both; ">
        </div>
      </div>
      @endif
    @endisset

      @if (count($products) == 0)
        {{ trans('language.empty_product') }}
      @elseif(count($products) == 1)
          @php
            $item = $products[0];
          @endphp
          <div class="col-sm-10" style="margin-left:38%;margin-top:30px;">
              <div class="col-sm-3 home-top-row-ads">
                  <div class="thumbnail product-image-wrapper product-single">
                      <div class=" single-products product-box-{{ $item->id }}">
                          <a href="{{ $item->getUrl() }}"> <img src="{{ asset( $item->getThumb()) }}" style="width:100%;height:150px;" alt="" /></a>
                          {!! $item->showPrice() !!}
                          <ul class="nav nav-pills nav-justified" >
                              <li class="cart1"> <a class="btn btn-default add-to-cart"
                                                    onClick="addToCart('{{ $item->id }}','default',$(this))">
                                      {{trans('language.add_to_cart')}}  <i class="fa fa-shopping-cart"></i> </a></li>
                              <li class="fav"> <a class="btn btn-default add-to-cart"
                                                  onClick="addToCart('{{ $item->id }}','wishlist',$(this))"><i class="fa fa-heart"></i></a>
                              </li>
                          </ul>

                      </div>
                  </div>
              </div>
          </div>
      @else
          <div class="col-sm-9" style="margin-left:10%">
          @foreach ($products as $item)
              <div class="col-sm-3 home-top-row-ads">
                  <div class="thumbnail product-image-wrapper product-single">
                      <div class=" single-products product-box-{{ $item->id }}">
                          <a href="{{ $item->getUrl() }}"> <img src="{{ asset( $item->getThumb()) }}" style="width:100%;height:150px;" alt="" /></a>
                          {!! $item->showPrice() !!}
                          <ul class="nav nav-pills nav-justified" >
                              <li class="cart1"> <a class="btn btn-default add-to-cart"
                                                    onClick="addToCart('{{ $item->id }}','default',$(this))">
                                      {{trans('language.add_to_cart')}}  <i class="fa fa-shopping-cart"></i> </a></li>
                              <li class="fav"> <a class="btn btn-default add-to-cart"
                                                  onClick="addToCart('{{ $item->id }}','wishlist',$(this))"><i class="fa fa-heart"></i></a>
                              </li>
                          </ul>

                      </div>
                  </div>
              </div>
          @endforeach
          </div>
      @endif

    <div style="clear: both; ">
        <ul class="pagination">
          {{ $products->appends(request()->except(['page','_token']))->links() }}
      </ul>
    </div>
</div>
@endsection


@section('breadcrumb')
    <div class="breadcrumbs pull-left">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@section('filter')
  <form action="" method="GET" id="filter_sort">
        <div class="pull-right">
        <div>
            @php
              $queries = request()->except(['filter_sort','page']);
            @endphp
            @foreach ($queries as $key => $query)
              <input type="hidden" name="{{ $key }}" value="{{ $query }}">
            @endforeach
          <select class="custom-select" name="filter_sort">
            <option value="">{{ trans('language.filters.sort') }}</option>
            <option value="price_asc" {{ ($filter_sort =='price_asc')?'selected':'' }}>{{ trans('language.filters.price_asc') }}</option>
            <option value="price_desc" {{ ($filter_sort =='price_desc')?'selected':'' }}>{{ trans('language.filters.price_desc') }}</option>
            <option value="sort_asc" {{ ($filter_sort =='sort_asc')?'selected':'' }}>{{ trans('language.filters.sort_asc') }}</option>
            <option value="sort_desc" {{ ($filter_sort =='sort_desc')?'selected':'' }}>{{ trans('language.filters.sort_desc') }}</option>
            <option value="id_asc" {{ ($filter_sort =='id_asc')?'selected':'' }}>{{ trans('language.filters.id_asc') }}</option>
            <option value="id_desc" {{ ($filter_sort =='id_desc')?'selected':'' }}>{{ trans('language.filters.id_desc') }}</option>
          </select>
        </div>
      </div>
  </form>

@endsection

@push('styles')
@endpush
@push('scripts')
  <script type="text/javascript">
    $('[name="filter_sort"]').change(function(event) {
      $('#filter_sort').submit();
    });
  </script>
@endpush
