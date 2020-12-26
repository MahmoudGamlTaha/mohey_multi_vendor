<?php
#app/Admin/Controller/ShopVendorController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\PaymentTerm;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class PaymentTermController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header(trans('language.payments.payment_terms'));
            $content->description(' ');

            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header(trans('language.payments.payment_terms'));
            $content->description(' ');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header(trans('language.payments.payment_terms'));
            $content->description(' ');

            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(PaymentTerm::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->name(trans('language.admin.name'))->sortable();
            $grid->rate(trans('language.payments.benefit'));
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
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(PaymentTerm::class, function (Form $form) {

            $form->text('name', trans('language.payments.payment_term'))->rules('required');
            $form->text('rate', trans('language.admin.payment_benefit'))->rules('required|numeric|min:0')->default(0);
            //$form->model()->company_id = $this->getUserCompany()[0]->id;
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->tools(function (Form\Tools $tools) {
                $tools->disableView();
            });
            $form->saving(function (Form $form) {
                if($form->rate > 1)
                {
                    $form->rate = $form->rate/100 ;
                }
            });
        });
    }

   public function update(Request $request, $id){
      $arr = $request->all();
      if(!is_numeric($id)){
          abort(404);
      }
      try{
       $payment = PaymentTerm::findOrFail($id);
       if(isset($arr['rate'])){
         $payment->rate = $arr['rate']/100 ;
       }
       if(isset($arr['name'])){
          $payment->name = $arr['name'];
       }
       $payment->save();
      }catch(\Exception $ex){
          return $this->sendError($ex->getMessage(), 400);
      }
   }
    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(PaymentTerm::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
