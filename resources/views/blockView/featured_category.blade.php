<div class="row">
    <div class="row">
        <div class="col-sm-1">
            &nbsp;
        </div>
        <div class="col-sm-10 home-fdep-section">
            <div class="row home-fdep-section-title">

                <h4  style="font-size: 24px; text-align: center;color: #10243f;">{{trans("language.featured_categories")}}</h4>
            </div>
            @php $count = 0 @endphp
            @foreach($categoryList as $key => $value)
            <div class="col-sm-2 home-bottom-row-fdep" style="padding: 0">
                <a href="{{$value[0]->getUrl()}}"><img src="{{ $value[0]->getThumb() }}" alt="" class="block-center" />
                    <p class="text-center" style="color: white; padding: 5px ; background-color: #10243f;">{{$value[0]->name}}</p>
                </a><br>
            </div>
            @php
            $count++;
            if($count >= 12)
            break;
            @endphp
            @endforeach
        </div>
        <div class="col-sm-1">
            &nbsp;
        </div>
    </div>
</div>