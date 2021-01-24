@extends($theme.'.shop_layout')

@section('main')
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

                                <a href="index.html">Home</a></li>
                            <li class="is-marked">

                                <a href="checkout.html">Checkout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Section 1 ======-->


<!--    ====== Section 2 ======
    <div class="u-s-p-b-60">

        &lt;!&ndash;====== Section Content ======&ndash;&gt;
        <div class="section__content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div id="checkout-msg-group">
                            <div class="msg u-s-m-b-30">

                                        <span class="msg__text">Returning customer?

                                            <a class="gl-link" href="#return-customer" data-toggle="collapse">Click here to login</a></span>
                                <div class="collapse" id="return-customer" data-parent="#checkout-msg-group">
                                    <div class="l-f u-s-m-b-16">

                                        <span class="gl-text u-s-m-b-16">If you have an account with us, please log in.</span>
                                        <form class="l-f__form">
                                            <div class="gl-inline">
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="login-email">E-MAIL *</label>

                                                    <input class="input-text input-text&#45;&#45;primary-style" type="text" id="login-email" placeholder="Enter E-mail"></div>
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="login-password">PASSWORD *</label>

                                                    <input class="input-text input-text&#45;&#45;primary-style" type="text" id="login-password" placeholder="Enter Password"></div>
                                            </div>
                                            <div class="gl-inline">
                                                <div class="u-s-m-b-15">

                                                    <button class="btn btn&#45;&#45;e-transparent-brand-b-2" type="submit">LOGIN</button></div>
                                                <div class="u-s-m-b-15">

                                                    <a class="gl-link" href="lost-password.html">Lost Your Password?</a></div>
                                            </div>

                                            &lt;!&ndash;====== Check Box ======&ndash;&gt;
                                            <div class="check-box">

                                                <input type="checkbox" id="remember-me">
                                                <div class="check-box__state check-box__state&#45;&#45;primary">

                                                    <label class="check-box__label" for="remember-me">Remember Me</label></div>
                                            </div>
                                            &lt;!&ndash;====== End - Check Box ======&ndash;&gt;
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="msg">

                                        <span class="msg__text">Have a coupon?

                                            <a class="gl-link" href="#have-coupon" data-toggle="collapse">Click Here to enter your code</a></span>
                                <div class="collapse" id="have-coupon" data-parent="#checkout-msg-group">
                                    <div class="c-f u-s-m-b-16">

                                        <span class="gl-text u-s-m-b-16">Enter your coupon code if you have one.</span>
                                        <form class="c-f__form">
                                            <div class="u-s-m-b-16">
                                                <div class="u-s-m-b-15">

                                                    <label for="coupon"></label>

                                                    <input class="input-text input-text&#45;&#45;primary-style" type="text" id="coupon" placeholder="Coupon Code"></div>
                                                <div class="u-s-m-b-15">

                                                    <button class="btn btn&#45;&#45;e-transparent-brand-b-2" type="submit">APPLY</button></div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        &lt;!&ndash;====== End - Section Content ======&ndash;&gt;
    </div>-->
    <!--====== End - Section 2 ======-->


    <!--====== Section 3 ======-->
    <div class="u-s-p-b-60">

        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="container">
                <div class="checkout-f">
                    <div class="row">
                        <div class="col-lg-6">
                            <h1 class="checkout-f__h1">DELIVERY INFORMATION</h1>
                            <form class="checkout-f__delivery">
                                <div class="u-s-m-b-30">
                                    <div class="u-s-m-b-15">

                                        <!--====== Check Box ======-->
                                        <div class="check-box">

                                            <input type="checkbox" id="get-address">
                                            <div class="check-box__state check-box__state--primary">

                                                <label class="check-box__label" for="get-address">Use default shipping and billing address from account</label></div>
                                        </div>
                                        <!--====== End - Check Box ======-->
                                    </div>

                                    <!--====== First Name, Last Name ======-->
                                    <div class="gl-inline">
                                        <div class="u-s-m-b-15">

                                            <label class="gl-label" for="billing-fname">FIRST NAME *</label>

                                            <input class="input-text input-text--primary-style" type="text" id="billing-fname" data-bill=""></div>
                                        <div class="u-s-m-b-15">

                                            <label class="gl-label" for="billing-lname">LAST NAME *</label>

                                            <input class="input-text input-text--primary-style" type="text" id="billing-lname" data-bill=""></div>
                                    </div>
                                    <!--====== End - First Name, Last Name ======-->


                                    <!--====== E-MAIL ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-email">E-MAIL *</label>

                                        <input class="input-text input-text--primary-style" type="text" id="billing-email" data-bill=""></div>
                                    <!--====== End - E-MAIL ======-->


                                    <!--====== PHONE ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-phone">PHONE *</label>

                                        <input class="input-text input-text--primary-style" type="text" id="billing-phone" data-bill=""></div>
                                    <!--====== End - PHONE ======-->


                                    <!--====== Street Address ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-street">STREET ADDRESS *</label>

                                        <input class="input-text input-text--primary-style" type="text" id="billing-street" placeholder="House name and street name" data-bill=""></div>
                                    <div class="u-s-m-b-15">

                                        <label for="billing-street-optional"></label>

                                        <input class="input-text input-text--primary-style" type="text" id="billing-street-optional" placeholder="Apartment, suite unit etc. (optional)" data-bill=""></div>
                                    <!--====== End - Street Address ======-->


                                    <!--====== Country ======-->
                                    <div class="u-s-m-b-15">

                                        <!--====== Select Box ======-->

                                        <label class="gl-label" for="billing-country">COUNTRY *</label><select class="select-box select-box--primary-style" id="billing-country" data-bill="">
                                            <option selected value="">Choose Country</option>
                                            <option value="uae">United Arab Emirate (UAE)</option>
                                            <option value="uk">United Kingdom (UK)</option>
                                            <option value="us">United States (US)</option>
                                        </select>
                                        <!--====== End - Select Box ======-->
                                    </div>
                                    <!--====== End - Country ======-->


                                    <!--====== Town / City ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-town-city">TOWN/CITY *</label>

                                        <input class="input-text input-text--primary-style" type="text" id="billing-town-city" data-bill=""></div>
                                    <!--====== End - Town / City ======-->


                                    <!--====== STATE/PROVINCE ======-->
                                    <div class="u-s-m-b-15">

                                        <!--====== Select Box ======-->

                                        <label class="gl-label" for="billing-state">STATE/PROVINCE *</label><select class="select-box select-box--primary-style" id="billing-state" data-bill="">
                                            <option selected value="">Choose State/Province</option>
                                            <option value="al">Alabama</option>
                                            <option value="al">Alaska</option>
                                            <option value="ny">New York</option>
                                        </select>
                                        <!--====== End - Select Box ======-->
                                    </div>
                                    <!--====== End - STATE/PROVINCE ======-->


                                    <!--====== ZIP/POSTAL ======-->
                                    <div class="u-s-m-b-15">

                                        <label class="gl-label" for="billing-zip">ZIP/POSTAL CODE *</label>

                                        <input class="input-text input-text--primary-style" type="text" id="billing-zip" placeholder="Zip/Postal Code" data-bill=""></div>
                                    <!--====== End - ZIP/POSTAL ======-->
                                    <div class="u-s-m-b-10">

                                        <!--====== Check Box ======-->
                                        <div class="check-box">

                                            <input type="checkbox" id="make-default-address" data-bill="">
                                            <div class="check-box__state check-box__state--primary">

                                                <label class="check-box__label" for="make-default-address">Make default shipping and billing address</label></div>
                                        </div>
                                        <!--====== End - Check Box ======-->
                                    </div>
                                    <div class="u-s-m-b-10">

                                        <a class="gl-link" href="#create-account" data-toggle="collapse">Want to create a new account?</a></div>
                                    <div class="collapse u-s-m-b-15" id="create-account">

                                        <span class="gl-text u-s-m-b-15">Create an account by entering the information below. If you are a returning customer please login at the top of the page.</span>
                                        <div>

                                            <label class="gl-label" for="reg-password">Account Password *</label>

                                            <input class="input-text input-text--primary-style" type="text" data-bill id="reg-password"></div>
                                    </div>
                                    <div class="u-s-m-b-10">

                                        <label class="gl-label" for="order-note">ORDER NOTE</label><textarea class="text-area text-area--primary-style" id="order-note"></textarea></div>
                                    <div>

                                        <button class="btn btn--e-transparent-brand-b-2" type="submit">SAVE</button></div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-6">
                            <h1 class="checkout-f__h1">ORDER SUMMARY</h1>

                            <!--====== Order Summary ======-->
                            <div class="o-summary">
                                <div class="o-summary__section u-s-m-b-30">
                                    <div class="o-summary__item-wrap gl-scroll">
                                        @foreach($cart as $item)
                                            @php
                                                $n = (isset($n)?$n:0);
                                                $n++;
                                                $product = App\Models\ShopProduct::find($item->id);
                                                $uofms = \App\Models\UofmGroups::where('id', $product->uofm_groups)->first();
                                            @endphp
                                            <div class="o-card">
                                                <div class="o-card__flex">
                                                    <div class="o-card__img-wrap">

                                                        <a href="{{$product->getUrl() }}"><img class="u-img-fluid" src="{{asset($product->getImage())}}" alt=""></a></div>
                                                    <div class="o-card__info-wrap">

                                                            <span class="o-card__name">

                                                                <a href="{{$product->getUrl() }}"> {{ $product->getName() }}</a></span>

                                                        <span class="o-card__quantity">Quantity x {{$item->qty}}</span>

                                                        <span class="o-card__price" style="margin-right: 100px">{!! $product->showPrice() !!}</span></div>
                                                </div>

                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                <form class="shipping_address" id="form-order" role="form" method="POST" action="{{ route('storeOrder') }}">
                                    {{ csrf_field() }}
                                    <input type="hidden" name="address" value="{{ json_encode($address) }}">
                                    <input type="hidden" name="dataTotal" value="{{ json_encode($dataTotal) }}">
                                    <input type="hidden" name="payment" value="{{ $payment }}">
                                    <input type="hidden" name="shipping" value="{{ $shipping }}">
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__box">
                                            <table class="o-summary__table">
                                                <tbody>
                                                <tr>
                                                    <td>{{ trans('language.cart.to_name') }}:</td>
                                                    <td>{{ $address['toname'] }}</td>
                                                </tr>
                                                <tr>
                                                    <td>{{ trans('language.cart.phone') }}:</td>
                                                    <td>{{ $address['phone'] }}</td>
                                                </tr>
                                                <tr>
                                                    <td>{{ trans('language.cart.email') }}:</td>
                                                    <td>{{ $address['email'] }}</td>
                                                </tr>
                                                <tr>
                                                    <td>{{ trans('language.cart.address') }}:</td>
                                                    <td>{{ $address['address1'].' '.$address['address2'] }}</td>
                                                </tr>
                                                <tr>
                                                    <td>{{ trans('language.cart.note') }}:</td>
                                                    <td>{{ $address['comment'] }}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__box">
                                            <h3 class="checkout-f__h3">PAYMENT INFORMATION</h3>
                                            <div class="u-s-m-b-10">
                                                @if(isset($payment_term))
                                                    <select id="paymentTerm" class="select-box select-box--primary-style" name="paymentTerm">
                                                        <option value="0">Cash</option>
                                                        @foreach($payment_term as $key => $term)
                                                            <option value="{{$term->id}}" data-index="{{$term->rate}}" class="opt-{{$term->id}}">{{$term->paymentTerm()->first()->name}}</option>
                                                        @endforeach
                                                    </select>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__box">
                                            <table class="o-summary__table">
                                                <tr>
                                                    <tr>
                                                        <td>الفائده المضافه</td>
                                                        <td style="font-weight:bold" class="rate">0%</td>
                                                    </tr>
                                                    @foreach ($dataTotal as $key => $element)
                                                        @if ($element['value'] !=0)
                                                            @if ($element['code']=='total')
                                                                @php
                                                                    $value = $element['value'];
                                                                @endphp
                                                                <tr class="showTotal" style="background:#f5f3f3;font-weight: bold;">
                                                            @else
                                                                <tr class="showTotal">
                                                            @endif
                                                                <td>{!! $element['title'] !!}</td>
                                                                <td style="text-align: right" id="{{ $element['code'] }}" @if ($element['code']=='total')class="total"@endif>{{$element['text'] }}</td>
                                                            </tr>
                                                            @endif
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__box">
                                        <button id="submit-order" class="btn btn--e-brand-b-2" type="submit">PLACE ORDER</button></div>
                                    </div>
                                </form>
                            </div>
                            <!--====== End - Order Summary ======-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Content ======-->
    </div>
    <!--====== End - Section 3 ======-->
</div>
@endsection
@push('scripts')
    <script>
        $(document).ready(function (){
            var value = {{$value ?? 0}};
            $('#paymentTerm').change(function (){
                var id = $('#paymentTerm').val();
                var rate = $('.opt-'+id).data('index');
                console.log(id);
                if(id == 0) {
                    $('.total').html({{$value ?? 0}});
                    $('.rate').html('0%');
                }else{
                    $('.total').html('ج'+((rate * value) + value));
                    $('.rate').html( rate +'%');
                }
            });
        });
    </script>
@endpush