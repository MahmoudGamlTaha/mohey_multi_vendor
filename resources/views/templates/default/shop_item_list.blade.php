@extends($theme.'.shop_layout')

@section('main')
<div class="row">
        <div class="container">
                <h2 class="title text-center">{{ $title }}</h2>
                  @if (!empty($itemsList))
                    @foreach ($itemsList as $item)
                        <div class="col-sm-3 col-xs-4">
                            <div class="product-image-wrapper product-single">
                              <div class="single-products">
                                <div class="productinfo text-center product-box-{{ $item->id }}">
                                  @if($item->getImage() != "documents/website/")
                                  <a href="{{ $item->getUrl() }}"><img src="{{ asset($item->getImage()) }}" alt="{{ $item->name }}" /></a>
                                  @else
                                  <a href="{{ $item->getUrl() }}"><img src="{{ asset($path_file.'') }}/default/shop.jpg" style="width:100%;height:320px;" alt="{{ $item->name }}" /></a>
                                  @endif
                                 
                                  <a href="{{ $item->getUrl() }}"><p>{{ $item->name}}</p></a>
                            
                                </div>
                              </div>
                            </div>
                        </div>
                    @endforeach
                  @endif
<div style="clear: both; ">
    <ul class="pagination">
      {{ $itemsList->appends(request()->except(['page','_token']))->links() }}
  </ul>
</div>

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
            <option value="name_asc" {{ ($filter_sort =='name_asc')?'selected':'' }}>{{ trans('language.filters.name_asc') }}</option>
            <option value="name_desc" {{ ($filter_sort =='name_desc')?'selected':'' }}>{{ trans('language.filters.name_desc') }}</option>
            <option value="sort_asc" {{ ($filter_sort =='sort_asc')?'selected':'' }}>{{ trans('language.filters.sort_asc') }}</option>
            <option value="sort_desc" {{ ($filter_sort =='sort_desc')?'selected':'' }}>{{ trans('language.filters.sort_desc') }}</option>
            <option value="id_asc" {{ ($filter_sort =='id_asc')?'selected':'' }}>{{ trans('language.filters.id_asc') }}</option>
            <option value="id_desc" {{ ($filter_sort =='id_desc')?'selected':'' }}>{{ trans('language.filters.id_desc') }}</option>
          </select>
        </div>
      </div>
  </form>

@endsection

@push('scripts')
  <script type="text/javascript">
    $('[name="filter_sort"]').change(function(event) {
      $('#filter_sort').submit();
    });
  </script>
@endpush
