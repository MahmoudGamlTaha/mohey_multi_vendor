<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\ExcelExpoter;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\ShopAttributeGroup;
use App\Models\ShopCurrency;
use App\Models\ShopOrder;
use App\Models\ShopOrderDetail;
use App\Models\ShopOrderHistory;
use App\Models\ShopOrderStatus;
use App\Models\ShopOrderTotal;
use App\Models\ShopPaymentStatus;
use App\Models\ShopProduct;
use App\Models\ShopShippingStatus;
use App\User;
use DB;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class ShopOrderDetailController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        $keyword = \Request::input('keyword');
        $keyword = empty($keyword) ? "" : $keyword;
        return Admin::content(function (Content $content) use ($keyword) {

            $content->header(trans('language.admin.order_manager'));
            $content->description(' ');
            if ($keyword != "") {
                $content->description(trans('language.order.search_keyword') . ': "' . $keyword . '"');
            }

            $content->body($this->grid($keyword));
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid($keyword)
    {
        return Admin::grid(ShopOrderDetail::class, function (Grid $grid) use ($keyword) {

            $grid->order_id(trans('language.order.order_id'))->display(function ($order_id) {
                return empty($order_id) ? 0 : '<div style="max-width:100px; overflow:auto;word-wrap: break-word;">' . $order_id . '</div>';
            });
            if($this->checkSuperUser()) {
                $grid->company_id('company')->display(function ($company_id) {
                    $company_name = Company::where('id', $company_id)->first();
                    return empty($company_name->name) ? 'N/A' : '<div style="max-width:150px; overflow:auto;word-wrap: break-word;">' . $company_name->name . '</div>';
                });
            }
            $grid->product_id(trans('language.order.product_id'))->display(function ($product_id) {
                return empty($product_id) ? 0 : '<div style="max-width:100px; overflow:auto;word-wrap: break-word;">' . $product_id . '</div>';
            });
            $grid->name(trans('language.order.product_name'))->display(function ($name) {
                return empty($name) ? 0 : '<div style="max-width:100px; overflow:auto;word-wrap: break-word;">' . $name . '</div>';
            });
            $grid->sku(trans('language.order.sku'))->display(function ($sku) {
                return empty($sku) ? 0 : '<div style="max-width:100px; overflow:auto;word-wrap: break-word;">' . $sku . '</div>';
            });
            $grid->qty(trans('language.order.qty'))->display(function ($qty) {
                return empty($qty) ? 0 : '<div style="max-width:100px; overflow:auto;word-wrap: break-word;">' . $qty . '</div>';
            });
            $grid->total_price(trans('language.order.total_price'))->display(function ($total_price) {
                return empty($total_price) ? 0 : '<div style="max-width:100px; overflow:auto;word-wrap: break-word;">' . $total_price . '</div>';
            });

            $grid->disableActions();
            $grid->disableCreateButton();

            $grid->created_at(trans('language.admin.created_at'));
            $grid->model()->orderBy('id', 'desc');
            if (!$this->checkSuperUser()) {
                $grid->model()
                    ->where('company_id', $this->getUserCompany()[0]->id);
            }
            if ($keyword != "") {
                $grid->model()
                    ->where('company_id', $this->getUserCompany()[0]->id)
                    //   ->orwhere('toname', 'like', '%' . $keyword . '%')
                    //->orWhere('phone', 'like', '%' . $keyword . '%')
                    ->Where('email', 'like', '%' . $keyword . '%')
                    ->Where('id', (int) $keyword);
            }
        });
    }
}
