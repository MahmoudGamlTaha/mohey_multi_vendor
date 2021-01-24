<!--====== Main Footer ======-->
<footer>
    <div class="outer-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="outer-footer__content u-s-m-b-40">

                        <span class="outer-footer__content-title">{{trans('language.admin.ContactUs')}}</span>
                        @php
                            $contacts = \App\Models\ContactUs::all()??array();
                        @endphp
                        @foreach($contacts as $contact)
                            <div class="outer-footer__text-wrap">

                                <span>{{trans('language.admin.'.$contact->name)}} : {{ $contact->value }}</span></div>
                        @endforeach
                        <div class="outer-footer__social">
                            <ul>
                                <li>

                                    <a class="s-fb--color-hover" href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li>

                                    <a class="s-tw--color-hover" href="#"><i class="fab fa-twitter"></i></a></li>
                                <li>

                                    <a class="s-youtube--color-hover" href="#"><i class="fab fa-youtube"></i></a></li>
                                <li>

                                    <a class="s-insta--color-hover" href="#"><i class="fab fa-instagram"></i></a></li>
                                <li>

                                    <a class="s-gplus--color-hover" href="#"><i class="fab fa-google-plus-g"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                @php
                    $lang = App\Models\Language::where('code', app()->getLocale())->first();

                    $columns = \App\Models\ShopPageDescription::where('lang_id', $lang->id)->get();
                @endphp
                <div class="col-lg-3 col-md-5">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="outer-footer__content u-s-m-b-40">
                                <span class="outer-footer__content-title">{{trans('language.aboutUs')}}</span>
                                <div class="outer-footer__list-wrap">
                                    @if(count($columns) > 0)
                                    <ul>
                                    @for($i = 0; $i < 3; $i++)
                                        <li><a href="{{$columns[$i]['keyword'].'.html'}}">{{$columns[$i]['title']}}</a></li>
                                    @endfor
                                    <li><a href="/login">{{trans('language.joinUs')}}</a>
                                    </ul>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @if($columns->count() > 4)
                    <div class="col-lg-3 col-md-5">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="outer-footer__content u-s-m-b-40">
                                    <span class="outer-footer__content-title">{{trans('language.clientService')}}</span>
                                    <div class="outer-footer__list-wrap">
                                        <ul>
                                            @for($i = 3; $i < $columns->count(); $i++)
                                                <li><a href="{{$columns[$i]['keyword'].'.html'}}">{{$columns[$i]['title']}}</a></li>
                                            @endfor
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="col-lg-3 col-md-12">
                    <div class="outer-footer__content">

                        <span class="outer-footer__content-title">Join our Newsletter</span>
                        <form class="newsletter">
                            <div class="u-s-m-b-15">
                                <div class="radio-box newsletter__radio">

                                    <input type="radio" id="male" name="gender">
                                    <div class="radio-box__state radio-box__state--primary">

                                        <label class="radio-box__label" for="male">Male</label></div>
                                </div>
                                <div class="radio-box newsletter__radio">

                                    <input type="radio" id="female" name="gender">
                                    <div class="radio-box__state radio-box__state--primary">

                                        <label class="radio-box__label" for="female">Female</label></div>
                                </div>
                            </div>
                            <div class="newsletter__group">

                                <label for="newsletter"></label>

                                <input class="input-text input-text--only-white" type="text" id="newsletter" placeholder="Enter your Email">

                                <button class="btn btn--e-brand newsletter__btn" type="submit">SUBSCRIBE</button></div>

                            <span class="newsletter__text">Subscribe to the mailing list to receive updates on promotions, new arrivals, discount and coupons.</span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="lower-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="lower-footer__content">
                        <div class="lower-footer__copyright">
                            <span>Copyright © 2019</span>
                            <a href="{{ config('scart.homepage') }}" style="color: #f69620;">{{ config('scart.name') }} {{ config('scart.version') }}</a>
                            <span>All Right Reserved</span>
                            <br>
                            <span>Hosted by <a target="_blank" href="https://highcoder.com" >highcoder</a></span></div>
                        <div class="lower-footer__payment">
                            <ul>
                                <li><i class="fab fa-cc-stripe"></i></li>
                                <li><i class="fab fa-cc-paypal"></i></li>
                                <li><i class="fab fa-cc-mastercard"></i></li>
                                <li><i class="fab fa-cc-visa"></i></li>
                                <li><i class="fab fa-cc-discover"></i></li>
                                <li><i class="fab fa-cc-amex"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
