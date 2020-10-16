<?php
#app/Http/Admin/Controllers/BannerController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\BannerType;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\Field\Image;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\MessageBag;

class BannerController extends Controller
{
    use HasResourceActions;
    /**
     * Index interface.
     *
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('language.admin.banner_manager'))
            ->description(' ')
            ->body($this->grid());
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('language.admin.banner_manager'))
            ->description(' ')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('language.admin.banner_manager'))
            ->description(' ')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Banner);
        $grid->id('ID')->sortable();
        $grid->image(trans('language.admin.image'))->image('', 50);
        $grid->url('URL');
       // print_r((new Banner())->type()->get());die;
        $grid->type()->name_ar('type');
        $grid->html('HTML')->display(function ($text) {
           return htmlentities($text);
        })->style('max-width:200px;word-break:break-all;');
        $grid->status(trans('language.admin.status'))->switch();
        $grid->sort(trans('language.admin.sort'))->sortable();
        $grid->disableRowSelector();
        $grid->disableFilter();
        $grid->tools(function ($tools) {
            $tools->disableRefreshButton();
        });
        $grid->disableExport();
        $grid->actions(function ($actions) {
            $actions->disableView();
        });
        $grid->model()->orderBy('id', 'desc');
        return $grid;
    }
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($id = null)
    {  
        $form = new Form(new Banner);
		 if(isset($id)){
		// print_r(Banner::findOrFail($id));die;
		 $form = new Form(Banner::findOrFail($id));
        }
        $bannerTypes = BannerType::pluck('name_ar', 'id')->all();
        $form->image('image', trans('language.admin.image'))->uniqueName()->move('banner')->removable();
        $form->textarea('html', 'html');
        $form->text('url', 'Url');
        $form->select('type_id', trans('admin.Imglocation'))->options($bannerTypes)
        ->rules('required');
        $form->switch('status', trans('language.admin.status'));
        $form->number('sort', trans('language.admin.sort'))->rules('numeric|min:0')->default(0);
       // $form->display('created_at', trans('language.admin.created_at'));
       // $form->display('updated_at', trans('language.admin.last_modify'));
     //  $banner->path =  Storage::disk(config('admin.upload.disk'))->url(''); 
        $form->disableViewCheck();
        $form->disableEditingCheck();
        
        $form->saving(function (Form $form)  {
           $form->model()->path = Storage::disk(config('admin.upload.disk'))->url('');
           if($form->model()->type_id == 2){
               $count = Banner::where('type_id', 2)->where('status', 1)->count();
               if($count >= 3){
                $this->admin_toastr("you can't add more 3 image  home3ads ", 'error');
                  die;
               }
                
           }
        });
        $form->tools(function (Form\Tools $tools) {
            $tools->disableView();
        });
        return $form;
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description(' ')
            ->body($this->form($id));
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Banner::findOrFail($id));
        return $show;
    }

    public function update($id, Request $request)
    {
        $data = $request->all();
        $banner = Banner::findOrFail($id);
         if(isset($data['html']))
           $banner->html = $data['html'];
        
        if(isset($data['url']))
           $banner->url = $data['url'];
        if(isset($data['type_id']))
           $banner->type_id = $data['type_id'];
          
           if(isset($request->status))
           $banner->status =$request->status == 'on'? 1 : 0;
           
        if(isset($request->image)){
        $banner->path =  Storage::disk(config('admin.upload.disk'))->url('');
        $uploadedImage = new Image($request->image) ;
        $uploadedImage->uniqueName();
        $uploadedImage->move('banner');
        $banner->image = $uploadedImage->prepare($request->image);
        }
        if( $banner->type_id){
        $count = Banner::where('type_id', 2)->where('status', 1)->count();
        if($count >= 3 && $banner->type_id == 2){
         $this->sendResppose("you can't add more 3 image  home3ads ", 'error');
         return;
        }
      }
        $banner->save();
        return $this->detail($banner->id);
    }

    public function getFactoryBanner(){
        $banner = Banner::all();
        return $this->sendResponse($banner, 200);
    }

    function admin_toastr($message = '', $type = 'success', $options = [])
    {
        $toastr = new MessageBag(get_defined_vars());

        session()->flash('toastr', $toastr);
    }

}
