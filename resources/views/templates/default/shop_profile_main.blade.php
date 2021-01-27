@extends($theme.'.shop_layout')
@section('main')
    @php
        $ImageUp = \App\Models\Banner::where('status',1)->where('type_id',5)->sort()->first();
        $ImageDown = \App\Models\Banner::where('status',1)->where('type_id',6)->sort()->first();
        $ImageLeft = \App\Models\Banner::where('status',1)->where('type_id',7)->sort()->first();
    @endphp
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-y-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="breadcrumb">
                        <div class="breadcrumb__wrap">
                            <ul class="breadcrumb__list">
                                <li class="has-separator">

                                    <a href="{{route('home')}}">Home</a></li>
                                <li class="is-marked">

                                    <a href="dash-my-profile.html">My Account</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section 1 ======-->


        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="dash">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-12">

                                <!--====== Dashboard Features ======-->
                                <div class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30">
                                    <div class="dash__pad-1">

                                        <span class="dash__text u-s-m-b-16">Hello, {{$user->name ?? 'none'}}</span>
                                        <ul class="dash__f-list">
                                            <li>

                                                <a>Manage My Account</a></li>
                                            <li>

                                                <a>My Profile</a></li>
                                            <li>

                                                <a>My Orders</a></li>
                                            <li>

                                                <a>My Payment Options</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="dash__box dash__box--bg-white dash__box--shadow dash__box--w">
                                    <div class="dash__pad-1">
                                        <ul class="dash__w-list">
                                            <li>
                                                <div class="dash__w-wrap">

                                                    <span class="dash__w-icon dash__w-icon-style-1"><i class="fas fa-cart-arrow-down"></i></span>

                                                    <span class="dash__w-text">{{count($orders)}}</span>

                                                    <span class="dash__w-name">Orders Placed</span></div>
                                            </li>
                                            <li>
                                                <div class="dash__w-wrap">

                                                    <span class="dash__w-icon dash__w-icon-style-2"><i class="fas fa-times"></i></span>

                                                    <span class="dash__w-text">0</span>

                                                    <span class="dash__w-name">Cancel Orders</span></div>
                                            </li>
                                            <li>
                                                <div class="dash__w-wrap">

                                                    <span class="dash__w-icon dash__w-icon-style-3"><i class="far fa-heart"></i></span>

                                                    <span class="dash__w-text">{{count($wishList)}}</span>

                                                    <span class="dash__w-name">Wishlist</span></div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--====== End - Dashboard Features ======-->
                            </div>
                            <div class="col-lg-9 col-md-12">
                                <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                    <div class="dash__pad-2">
                                        <h1 class="dash__h1 u-s-m-b-14">My Profile</h1>

                                        <span class="dash__text u-s-m-b-30">Look all your info, you could customize your profile.</span>
                                            <input type="text" class="user" name="user" value="{{$user->id}}" hidden>
                                            <div class="row">
                                                <div class="col-lg-4 u-s-m-b-30">
                                                    <h2 class="dash__h2 u-s-m-b-8">Full Name</h2>

                                                    <input class="input-text input-text--primary-style inputEdit fullName" name="fullName" style="background-color: #ffffff;outline:none;border:none;border-radius:5px" value="{{$user->name ?? 'none'}}" readonly>
                                                </div>
                                                <div class="col-lg-4 u-s-m-b-30">
                                                    <h2 class="dash__h2 u-s-m-b-8">E-mail</h2>

                                                    <input class="input-text input-text--primary-style inputEdit email" type="email" name="email" style="background-color: #ffffff;outline:none;border:none;border-radius:5px" value="{{$user->username ?? 'none'}}">
                                                </div>
                                                <div class="col-lg-4 u-s-m-b-30">
                                                    <h2 class="dash__h2 u-s-m-b-8">Company</h2>

                                                    <input class="input-text input-text--primary-style inputEdit company" name="company" style="background-color: #ffffff;outline:none;border:none;border-radius:5px" value="{{$user->company()->first()->name ?? 'none'}}">
                                                </div>
                                                <div class="col-lg-4 u-s-m-b-30">
                                                    <h2 class="dash__h2 u-s-m-b-8">Phone</h2>

                                                    <input class="input-text input-text--primary-style inputEdit phone" name="phone" style="background-color: #ffffff;outline:none;border:none;border-radius:5px" value="{{$user->mobile}}">

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="u-s-m-b-16">

                                                        <button style="border-radius: 6px;font-weight: 600;padding: 16px 46px;" class="btn btn--e-brand-b-2 saveBtn" type="submit" hidden>SAVE</button></div>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="u-s-m-b-16">

                                            <a class="dash__custom-link btn--e-transparent-brand-b-2 editBtn">Edit Profile</a></div>
                                    </div>
                                </div>
                                <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                    <div class="dash__pad-2">
                                        <h1 class="dash__h1 u-s-m-b-14">My Orders</h1>

                                        <span class="dash__text u-s-m-b-30">Here you can see all products that have been delivered.</span>
                                            <div class="m-order__list">
                                        @foreach($orders as $key => $order)
                                                <div class="m-order__get">
                                                    <div class="manage-o__header u-s-m-b-30">
                                                        <div class="dash-l-r">
                                                            <div>
                                                                <div class="manage-o__text-2 u-c-secondary">Order {{$order->order_id}}</div>
                                                                <div class="manage-o__text u-c-silver">Placed on {{$order->created_at}}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="manage-o__description">
                                                        <div class="description__container">
                                                            <div class="description__img-wrap">

                                                                <a href="{{ $order->product()->first()->getUrl() }}"><img style="height:100%" class="u-img-fluid" src="{{asset($order->product()->first()->getImage())}}" alt=""></a></div>
                                                            <div class="description-title">{{$order->product()->first()->name ?? 'none'}}</div>
                                                        </div>
                                                        <div class="description__info-wrap">
                                                            @if(($order->status == 0))
                                                                <div>

                                                                    <span class="manage-o__badge badge--processing">قيد المراجعة </span>
                                                                </div>
                                                            @elseif(($order->status) == 1)
                                                                <div>

                                                                    <span class="manage-o__badge badge--processing">  جاري التحضير</span>
                                                                </div>
                                                            @elseif($order->status == 3 )
                                                                <div>

                                                                    <span class="manage-o__badge badge--processing">تم الالغاء</span>
                                                                </div>
                                                            @elseif($order->status == 4 )
                                                                <div>

                                                                    <span class="manage-o__badge badge--processing">تم التسليم</span>
                                                                </div>
                                                            @endif
                                                        </div>
                                                        <div class="description__info-wrap">
                                                            <div>

                                                                <span class="manage-o__text-2 u-c-silver">Total:

                                                                    <span class="manage-o__text-2 u-c-secondary">EGP {{$order->price}}</span></span></div>
                                                            <div>

                                                                <span class="manage-o__text-2 u-c-silver">Quantity:

                                                                    <span class="manage-o__text-2 u-c-secondary">{{$order->qty}}</span></span></div>
                                                        @php
                                                            $OrderProd = \App\Models\ShopOrder::where('id', $order->order_id)->first();
                                                            $test = $OrderProd->payment_term;
                                                        @endphp
                                                        @if($test != 0)
                                                            @php
                                                                $CustomerPaymentTerm = \App\Models\CustomerPaymentTerm::where('id', $test)->first();
                                                                $rate = $CustomerPaymentTerm->rate;
                                                                $id = $CustomerPaymentTerm->payment_term_id;
                                                                $paymentTerm = \App\Models\paymentTerm::where('id', $id)->first();
                                                            @endphp
                                                            <div>

                                                                <span class="manage-o__text-2 u-c-silver">{{$paymentTerm->name}}

                                                                    <span class="manage-o__text-2 u-c-secondary">{{$rate}}%</span></span></div>
                                                        @else
                                                            <div>

                                                                <span class="manage-o__text-2 u-c-silver">Cash

                                                                    <span class="manage-o__text-2 u-c-secondary">0%</span></span></div>
                                                        @endif
                                                        <div>

                                                                <span class="manage-o__text-2 u-c-silver">Discount

                                                                    <span class="manage-o__text-2 u-c-secondary">{{$OrderProd->discount}}</span></span></div>
                                                        <div>

                                                                <span class="manage-o__text-2 u-c-silver">Total price

                                                                    <span class="manage-o__text-2 u-c-secondary">EGP {{$order->total_price}}</span></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                                <div class="dash__pad-2">
                                    <h1 class="dash__h1 u-s-m-b-14">My Payment Options</h1>

                                    <span class="dash__text">No payment options</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 2 ======-->
    </div>
    <!--====== End - App Content ======-->
@endsection
@push('scripts')
        <script>
            $(document).ready(function(){
                $('.editBtn').on('click', function (){
                    $('.inputEdit').attr('readonly', false)
                        .css({'background-color': '#F1F1F1', 'border': '2px solid #FF4500'});
                    $('.saveBtn').show();
                });

                //
                $('.saveBtn').on('click', function(){
                    let id = $('.user').val();
                    let fullName = $('.fullName').val();
                    let email = $('.email').val();
                    let company = $('.company').val();
                    let phone = $('.phone').val();
                    $.ajax({
                        url: '{{route('updateProfileInfo')}}',
                        dataType: 'json',
                        type: 'post',
                        data: {
                            _token: '{{csrf_token()}}',
                            id: id,
                            fullName: fullName,
                            email: email,
                            company: company,
                            phone: phone
                        },
                        success: function (data){
                            if(data.error === 1) {
                                for(let i =0; i < data.key.length; i++ ) {
                                    if($('.' + data.key[i]).hasClass('hasError') != true) {
                                        $('.' + data.key[i]).after("<div style='color:red' class='invalid-feedback'>" + data.msg[data.key[i]] + "</div>")
                                        $('.' + data.key[i]).addClass('hasError');
                                    }
                                }
                            }else{
                                $.notify(data.msg, "success");
                                $('.inputEdit').attr('readonly', true)
                                    .css({'background-color': '#ffffff', 'border': 'none'});
                                $('.saveBtn').hide();
                                $('.invalid-feedback').remove();
                            }
                        },
                        failed: function (data){
                            $.notify(data.msg, "warn");
                        }
                    });
                });
            });
        </script>
@endpush