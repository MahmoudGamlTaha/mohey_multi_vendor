@extends($theme.'.shop_layout')

@section('main')
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="about">
                                <div class="about__container">
                                    <div class="about__info">
                                        <h2 class="about__h2">{{ $title }}</h2>
                                        <div class="about__p-wrap">
                                            <p class="about__p">{!! $page->content !!}</p>
                                        </div>

                                        <a class="about__link btn--e-secondary" href="index.html" target="_blank">Shop Now</a>
                                    </div>
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
@endsection