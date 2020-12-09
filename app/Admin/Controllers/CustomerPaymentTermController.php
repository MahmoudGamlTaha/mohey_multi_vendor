<?php
#app/Admin/Controller/ShopVendorController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CustomerPaymentTerm;
use App\Models\PaymentTerm;
use App\User;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class CustomerPaymentTermController extends Controller
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

            $content->header(trans('language.payments.client_payment_terms'));
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

            $content->header(trans('language.payments.client_payment_terms'));
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

            $content->header(trans('language.payments.client_payment_terms'));
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
        return Admin::grid(CustomerPaymentTerm::class, function (Grid $grid) {
            $grid->id('ID')->sortable();
            $grid->user()->username(trans('language.admin.name'))->sortable();
            $grid->rate(trans('language.payments.benefit'));
            $grid->paymentTerm()->name(trans('language.payments.payment_term'));
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
        return Admin::form(CustomerPaymentTerm::class, function (Form $form) {
            $users = User::where('active', 1)->pluck("username", "id");
            $paymentTerm = PaymentTerm::pluck("name", "id");
            $form->select('user_id', trans('language.admin.name'))->options($users)->rules('required');
            $form->select('payment_term_id', trans('language.payments.payment_term'))->options($paymentTerm)->rules('required');;
            $form->text('rate', trans('language.payments.benefit'));
            $form->saving(function (Form $form) {
                if($form->rate == null)
                {
                    $form->rate = PaymentTerm::where('id', $form->payment_term_id)->first()->rate;
                }

            });
            //$form->model()->company_id = $this->getUserCompany()[0]->id;
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->tools(function (Form\Tools $tools) {
                $tools->disableView();
            });
        });
    }

    public function update(Request $request, $id){
        $arr = $request->all();
        if(!is_numeric($id)){
            abort(404);
        }
        try{
            $payment = CustomerPaymentTerm::findOrFail($id);
            if(isset($arr['user_id'])){
                $payment->user_id = $arr['user_id'];
            }
            if(isset($arr['rate'])){
                $payment->rate = $arr['rate'];
            }
            if(isset($arr['payment_term_id'])){
                $payment->payment_term_id = $arr['payment_term_id'];
            }
            if($arr['rate'] == null)
            {
                $payment->rate = PaymentTerm::where('id', $arr['payment_term_id'])->first()->rate;
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
            $content->body(Admin::show(CustomerPaymentTerm::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
