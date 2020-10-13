  @php
    $banners = \App\Models\Banner::where('status', 1)->where('type_id', 1)->sort()->get();
    $top3Images = \App\Models\Banner::where('status', 1)->where('type_id', 2)->sort()->get();
    $sideImage = \App\Models\Banner::where('status',1)->where('type_id',4)->sort()->first();
  @endphp
 @if (!empty($banners))
 <!--<script src="{{ asset('js/vue.js') }}"></script>
 <script>

 </script>!-->
 <style>
.fade-enter-active, .fade-leave-active {
  transition: all 0.8s ease;
  overflow: hidden;
  visibility: visible;
  opacity: 1;
  position: absolute;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
  visibility: hidden;
}
.carousel-item {
  height: 65vh;
  min-height: 300px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.portfolio-item {
  margin-bottom: 30px;
}

 </style>
 <!--<script src="{{asset('js/jquery.min.js')}}"></script> sprint 1 -->

 <section id="slider"><!--slider-->
    <div class="container">
    <div class="row row-no-gutters">
    <div class="col-sm-12">
      @foreach($top3Images as $key => $value )
       <div class="col-sm-4">
       <a href="{{$value->url}}"><img src="{{ asset($path_file.'') }}/{{ $value->image }}" class="top3img"></img></a>
      </div>
      @endforeach
    </div>
    </div>

    <br/>
      <div class="row row-no-gutters" style="margin-left:1px;margin-right:1px;">
        <div class="col-sm-8">
        <div class="col-sm-12" style="min-height: 249px;clear:both">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
       <!-- Indicators -->
       <ol class="carousel-indicators">
       @foreach($banners as $key => $banner) 
         <li data-target="#myCarousel" data-slide-to="{{$key}}" class="{{ ($key)?'':'active' }}"></li>
         @endforeach
       </ol>

       <!-- Wrapper for slides -->
       <div class="carousel-inner">
       @foreach($banners as $key => $banner) 
         <div  class="{{ ($key)?'item':'item active' }}">
          <a href="{{$banner->url}}"> <img src="{{ asset($path_file.'') }}/{{ $banner->image }}" alt="" class="girl img-responsive">
          </a>
           <div class="carousel-caption">
             {!! html_entity_decode($banner->html) !!}
           </div>
         </div>
       @endforeach
        </div>

       <!-- Left and right controls -->
       <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left"></span>
         <span class="sr-only">Previous</span>
       </a>
       <a class="right carousel-control" href="#myCarousel" data-slide="next">
         <span class="glyphicon glyphicon-chevron-right"></span>
         <span class="sr-only">Next</span>
       </a>
     </div>

      </div>
    </div>
      <div class="col-sm-4">
        @if(isset($sideImage))
     <a href="{{$sideImage->url}}"><img src="{{ asset($path_file.'') }}/{{ $sideImage->image }}" style="width:100%;height:320px;" ></img></a>
      @else
      <img src="{{ asset($path_file.'') }}/default/default_1.jpg" style="width:100%;height:320px;" ></img>
      
      @endif
      </div>
      </div>
      </div>
  </section><!--/slider-->

@endif
