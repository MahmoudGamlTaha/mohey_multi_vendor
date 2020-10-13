<div class="row">
    <div class="row">
        <div class="col-sm-2">
            &nbsp;
        </div>
        <div class="col-sm-8 home-fdep-section">
            <div class="row home-fdep-section-title">

                <h4>{{trans("language.featured_categories")}}</h4>
            </div>
            @php $count = 0 @endphp
            @foreach($categoryList as $key => $value)
            <div class="col-sm-2 home-bottom-row-fdep">
                <a href="{{$value[0]->getUrl()}}"><img src="{{ $value[0]->getThumb() }}" alt="" class="block-center" />
                    <p class="text-center">{{$value[0]->name}}</p>
                </a><br>
            </div>
            @php
            $count++;
            if($count >= 12)
            break;
            @endphp
            @endforeach
        </div>
        <div class="col-sm-2">
            &nbsp;
        </div>
    </div>
</div>