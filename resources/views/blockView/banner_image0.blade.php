  @php
    $banners = \App\Models\Banner::where('status', 1)->sort()->get()
  @endphp
 @if (!empty($banners))
 <script src="{{ asset('js/vue.js') }}"></script>
 <script>
   window.onload = function () {
   var app = new Vue({

     el:'#slider',
     data:{
      images: [],
      banner:"{{ asset($path_file)}}/banner/slide.jpg",
      currentNumber:0,
       timer: null
     },
     computed:{
      currentImage: function() {
      	return "{{ asset($path_file)}}/"+this.images[Math.abs(this.currentNumber) % this.images.length];
      }
     },
     methods:{
       datax:function(){
           //this.images.push('{{$banners[0]->image}}');
           //this.images.push('{{$banners[1]->image}}');
          // this.images.push('{{$banners[2]->image}}');
           this.images.push('/banner/test.jpg');
           this.images.push('/banner/test2.jpg');
           this.images.push('/banner/test3.jpg');
     },
     // startRotation:function(){
     //  this.timer = setInterval(this.next, 3000);
     // },
     // stopRotation: function() {
     //        clearTimeout(this.timer);
     //        this.timer = null;
     //    },
        next: function() {
            this.currentNumber += 1%this.images.length;
        },
        prev: function() {
            this.currentNumber += 1%
        },
        first:function()
        {
          this.currentImage=0;
          alert('0');
        },
        second:function()
        {
          this.currentImage=1;
          alert('1');
        },
        last:function()
        {
          this.currentImage=2;
          alert('2');
        }

    },
     created() {
       this.datax();
    },
    mounted: function () {
        this.startRotation();
    },
    showat: function(x)
    {
      this.currentNumber=x;
    }

   })
  }

 </script>
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
 </style>
 <!--<script src="{{asset('js/jquery.min.js')}}"></script> sprint 1 -->

 <section id="slider"><!--slider-->
    <div class="container">
    <div class="row row-no-gutters">
    <div class="col-sm-12">
      <div class="col-sm-4">
          <img src="{{ asset($path_file.'')}}/testbanner/test.png" class="top3img" style="width:100%;"></img>
      </div>
      <div class="col-sm-4">
      <img src="{{ asset($path_file.'')}}/testbanner/test.png" class="top3img" style="width:100%;"></img>
      </div>
      <div class="col-sm-4">
        <img src="{{ asset($path_file.'')}}/testbanner/test.png" class="top3img" style="width:100%;"></img>
      </div>
    </div>
    </div>
    </div>
      <div class="row row-no-gutters" style="margin-left:60px;margin-right:60px;">
        <div class="col-sm-8">
        <div class="col-sm-12" style="min-height: 249px;clear:both">
        <transition  name="fade" mode="out-in" tag='div'>
       <div class="col-sm-12"
       v-for="number in [currentNumber]"
       :key='number'
       >
         <img
             :src="currentImage"
             v-on:mouseover="stopRotation"
             v-on:mouseout="startRotation"
             style="height: 249px;width:100%;"
             />
             <ol class="carousel-indicators">
               <li id="carouselExampleIndicator1" v-on:click="first"  class="active"></li>
               <li id="carouselExampleIndicator2" v-on:click="second" ></li>
               <li id="carouselExampleIndicator3"v-on:click="last" ></li>
             </ol>
       </div>
    </transition>

        </div>
         <!-- <div class="bxslider"> sprint 1
	           @foreach ($banners as $key => $banner)
		     	   <div>
                <img data-u="image" src="{{ asset($path_file.'') }}/{{ $banner->image }}"></img>
            </div>
			@endforeach
          </div>   -->
        </div>
      <div class="col-sm-3">
      <img :src="banner" ></img>
      </div>
      </div>
      <div class="col-sm-12">

      </div>
  </section><!--/slider-->

@endif
