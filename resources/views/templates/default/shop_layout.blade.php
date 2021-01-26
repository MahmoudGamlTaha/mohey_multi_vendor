@php
    $carts = \Helper::getListCart();
@endphp
<!DOCTYPE html>
<html class="no-js" lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="{{ $description??'' }}">
    <meta name="keyword" content="{{ $keyword??'' }}">
    <title>{{$title??''}}</title>
    <meta property="og:url" content="{{ \Request::fullUrl() }}" />
    <meta property="og:type" content="Website" />
    <meta property="og:title" content="{{ $title??'' }}" />
    <meta property="og:description" content="{{ $description??'' }}" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!--Module meta -->
@isset ($layouts['meta'])
    @foreach ( $layouts['meta']  as $layout)
        @if ($layout->page == null ||  $layout->page =='*' || $layout->page =='' || (isset($layout_page) && in_array($layout_page, $layout->page) ) )
            @if ($layout->page =='html')
                {{$layout->text }}
            @endif
        @endif
    @endforeach
@endisset
<!--//Module meta -->

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!--====== Google Font ======-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">
    <link href="{{ asset($theme_asset.'/css/font-awesome.min.css')}}" rel="stylesheet">

    <!--====== Vendor Css ======-->
    <link rel="stylesheet" href="{{ asset($theme_asset.'/css/vendor.css')}}">

    <!--====== Utility-Spacing ======-->
    <link rel="stylesheet" href="{{ asset($theme_asset.'/css/utility.css')}}">

    <!--====== App ======-->
    <link rel="stylesheet" href="{{ asset($theme_asset.'/css/app.css')}}">

    <!--====== Select2 ======-->
    <link rel="stylesheet" href="{{ asset($theme_asset.'/select2/css/select2.min.css')}}">
    <style>
        .page-link{
            list-style: none;
            color: #333333;
        }
        .page-item{
            list-style: none;
            display: inline;
            border-radius: 10px;
            margin: 15px;
        }
        .active{
            background-color: #F1F1F1;
        }
    </style>
</head><!--/head-->
<body class="config">
<div class="preloader is-active">
    <div class="preloader__wrap">
        <img class="preloader__img" src="{{ asset($theme_asset.'/images/preloader.png')}}" alt=""></div>
</div>

<!--====== Main App ======-->
<div id="app">

    <!--====== Main Header ======-->
    <header class="header--style-1">
        @include($theme.'.header')
    </header>


@if ($configs['site_status'])
        <section>

        @yield('breadcrumb')

        @yield('filter')

        @section('main')
            @include($theme.'.center')
        @show

        </section>
@else
        <section>
            <div class="container">
                <div class="row">
                    <div id="columns" class="container"  style="color:red;text-align: center;">
                        <img src="{{ asset('images/maintenance.png') }}"><br>
                        <h3><i class="fas fa-exclamation"></i>{{ trans('language.maintenance') }}</h3>
                        <!-- /.col -->
                    </div>
                </div>
            </div>
        </section>
@endif
    <!--====== Main Footer ======-->
    <footer>
        @include($theme.'.footer')
    </footer>

    <!--====== Modal Section ======-->
</div>
<!--====== End - Main App ======-->


<!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
<script>
    window.ga = function() {
        ga.q.push(arguments)
    };
    ga.q = [];
    ga.l = +new Date;
    ga('create', 'UA-XXXXX-Y', 'auto');
    ga('send', 'pageview')
</script>
<!--====== jquery ======-->
<script src="{{ asset($theme_asset.'/js/jquery.js')}}"></script>

<!--====== Vendor Js ======-->
<script src="{{ asset($theme_asset.'/js/vendor.js')}}"></script>

<!--====== jQuery Shopnav plugin ======-->
<script src="{{ asset($theme_asset.'/js/jquery.shopnav.js')}}"></script>

<!--====== App ======-->
<script src="{{ asset($theme_asset.'/js/app.js')}}"></script>

<!--====== Select2 ======-->
<script src="{{ asset($theme_asset.'/select2/js/select2.min.js')}}"></script>
<!--====== notify ======-->
<script src="{{ asset($theme_asset.'/js/notify.min.js')}}"></script>

@stack('scripts')
<script>
    $(document).ready(function() {
        $(".js-example-placeholder-single").select2({
            ajax: {
                url: "/search",
                dataType: 'json',
                delay: 250,
                type: 'post',
                data: function (params) {
                    return {
                        _token: '{{csrf_token()}}',
                        q: params.term, // search term
                        page: params.page
                    };
                },
                processResults: function (data, params) {

                    params.page = params.page || 1;

                    return {
                        results: data,
                        pagination: {
                            more: (params.page * 30) < data.total_count
                        }
                    };
                },
                cache: true
            },
            placeholder: "{{ trans('language.search') }}",
            minimumInputLength: 1,
        });
        $(".js-example-placeholder-single").on("select2:select", function (e) {
            window.open('/product/'+e.params.data.text+'_'+e.params.data.id, '_self');
        });

        //-- pages
        let pages = ['cart', 'home', 'wishlist'];
        let pathname = window.location.pathname;
        var pathname_1 = pathname.replace('.html', '');
        var pathname_1 = pathname_1.replace('/', '');
        $.each(pages, function(index, value){
            if(pathname_1 == '') {
                $(".home").addClass(' u-c-brand');
            }else if (pathname_1 == value){
                $("."+value).addClass(' u-c-brand');
            }
        });

        //---- cart qty
        $("#decrease").on('click', function (rowId, item_id) {
            var curr_qty = parseInt($('#item-'+item_id).val(), 10);
            curr_qty = curr_qty - 1;
            if(curr_qty <= 0)
                return;
            $('#item-'+item_id).val(curr_qty);
            updateCart(rowId, item_id);
        });
        $("#increase").on('click', function (rowId, item_id) {
            var curr_qty = parseInt($('#item-'+item_id).val(), 10);
            curr_qty = curr_qty + 1;
            $('#item-'+item_id).val(curr_qty);
            updateCart(rowId, item_id);
        });
        function updateCart(rowId,id) {
            var new_qty = $('#item-' + id).val();

            $.ajax({
                url: '{{ route('updateToCart') }}',
                type: 'POST',
                dataType: 'json',
                async: true,
                cache: false,
                data: {
                    id: id,
                    rowId: rowId,
                    new_qty: new_qty,
                    _token: '{{ csrf_token() }}'
                },
                success: function (data) {

                    error = parseInt(data.error);

                    if (error === 0) {
                        window.location.replace(location.href);
                    } else {

                        $('.item-qty-' + id).css('display', 'block').html(data.msg);
                    }

                },
                error: function (err) {
                }
            });
        }
        //
        $('.cat-0').addClass(' js-active');
        $('#cats-1').addClass(' js-active');
    });

</script>
<!--message-->
@if(Session::has('message'))
    <script type="text/javascript">
        $.notify("{!! Session::get('message') !!}", "success");
    </script>
@endif
@if(Session::has('error'))
    <script type="text/javascript">
        $.notify("{!! Session::get('error') !!}", "error");
    </script>
@endif
@if(Session::has('warning'))
    <script type="text/javascript">
        $.notify("{!! Session::get('warning') !!}", "warning");
    </script>
@endif
<!--//message-->
<!--ADD TO CART-->
<script type="text/javascript">
    function addToCart(id,instance = null,element = null){

        $.ajax({
            url: '{{ route('addToCart') }}',
            type: 'POST',
            dataType: 'json',
            data: {id: id,instance:instance, _token:'{{ csrf_token() }}'},
            async: false,
            success: function(data){
                error= parseInt(data.error);
                if(error ==0)
                {
                    $.notify("added successfully", "success");
                }else{
                    $.notify(data.msg, "warn");
                }

            }
        });
    }
</script>
<!--//check code-->
<script type="text/javascript">
    function checkCode() {

        check = document.getElementById("regcompanycode").value.length;
        companyName = document.getElementById("marketname");
        if(check > 0){

            code = document.getElementById("regcompanycode").value.trim();
            reg = document.getElementById("regcoButton");
            console.log(code);
            $.ajax({
                url:'/getcompanybyCode/'+code,
                type:'get',
                dataType:'json',
                beforeSend: function(xhr, type) {
                    if (!type.crossDomain) {
                        xhr.setRequestHeader('X-CSRF-Token','{{csrf_token()}}');
                    }},
                success:function(data){
                    companyName.value = data.data;
                    if(data.data == ''){
                        reg.removeAttribute('hidden');
                    } else{
                        reg.setAttribute('hidden','hidden');
                    }
                },
                error:function(err){
                    console.log(err);
                }
            });

        }
    }
</script>
<!--====== Noscript ======-->
<noscript>
    <div class="app-setting">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="app-setting__wrap">
                        <h1 class="app-setting__h1">JavaScript is disabled in your browser.</h1>

                        <span class="app-setting__text">Please enable JavaScript in your browser or upgrade to a JavaScript-capable browser.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</noscript>
</body>
</html>