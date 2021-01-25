@extends($theme.'.shop_layout')

@section('main')
<section >
<div class="container">
    <div class="row">
        <div style="width:80%;margin: auto">
        <h2 class="title text-center" style="margin:50px;">{{ $title }}</h2>
        <div style="margin:50px">
        {!! $page->content !!}
        </div>
        </div>
</div>
</div>
</section>

@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection
