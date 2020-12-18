<?php
#app/Http/Admin/Controllers/ProcessController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopProduct;
use App\Models\ShopProductDescription;
use App\Models\ShopSpecialPrice;
use App\Models\UofmGroups;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Excel;
use Illuminate\Http\Request;

class ProcessController extends Controller
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
            ->header('Index')
            ->description(' ')
            ->body('');
    }

    public function importProduct(Content $content, Request $request)
    {
        if ($request->getMethod() == 'POST') {
            $validatedData = \Validator::make($request->all(), [
                'import_file' => 'required|mimes:xlsx',
            ]);
            if ($validatedData->fails()) {
                return redirect()->back()->withErrors($validatedData->errors());
            } else {
                Excel::load($request->file('import_file'), function ($reader) use ($request) {
                    $reader->skipRows(1); //
                    $arrError   = array();
                    $arrSuccess = array();
                    $row_num = 0;
                    $id = 0;
                    foreach ($reader->toArray() as $key => $row) {
                        $errorsarr = array();
                        ++$row_num;
                        if (!Company::where('id', $row['company_id'])->first()) {
                            $arrError[] = 'import error - row number ' . $row_num.' : company id ('.$row['company_id'] .') doesn\'t match any record';
                            $errorsarr[] = $row_num;
                        }
                        if (!ShopCategory::where('id', $row['category_id'])->first()) {
                            $arrError[] = 'import error - row number ' . $row_num . ': category id ('. $row['category_id'].') doesn\'t exists !';
                            $errorsarr[] = $row_num;
                        }
                        if (!ShopBrand::where('id', $row['brand_id'])->first()) {
                            $arrError[] = 'import error - row number ' . $row_num.' : brand id '.$row['brand_id'] .' doesn\'t exists !';
                            $errorsarr[] = $row_num;
                        }
                        if (!UofmGroups::where('id', $row['uofm_groups'])->first()) {
                            $arrError[] = 'import error - row number ' . $row_num.' : uofm id '.$row['uofm_groups'] .' doesn\'t exists !';
                            $errorsarr[] = $row_num;
                        }
                        if (!empty($errorsarr)) {
                            continue;
                        }
                        try {
                            if (!$this->checkSuperUser()) {
                                $company = $this->getUserCompany()[0]->id;
                            } else {
                                $company = (int)$row['company_id'];
                            }

                            $arrMapping = array();
                            $arrMapping['sku'] = $row['sku'];
                            $arrMapping['price'] = (double)$row['price'];
                            $arrMapping['cost'] = (double)$row['cost'];
                            $arrMapping['stock'] = (double)$row['stock'];
                            $arrMapping['category_id'] = (int)$row['category_id'];
                            $arrMapping['brand_id'] = (int)$row['brand_id'];
                            //$arrMapping['vendor_id']   = (int) $row['vendor_id'];
                            $arrMapping['company_id'] = $company;
                            $arrMapping['uofm_groups'] = (int)$row['uofm_groups'];
                            $shopProduct = ShopProduct::where('sku', $row['sku'])->first();
                            if ($shopProduct) {
                                $product = ShopProduct::find($shopProduct->id);
                                $product->update($arrMapping);
                                $id = $product->id;
                            } else {
                                $id = ShopProduct::insertGetId($arrMapping);
                            }
                            $descriptons = [
                                'product_id' => $id,
                                'company_id' => $company,
                                'name' => $row['name'],
                                'description' => $row['description'],
                                'keyword' => $row['keyword'],
                                'content' => $row['content'],
                                'lang_id' => (int)$row['language'],
                            ];
                            $productDesc = ShopProductDescription::where('product_id', $id);
                            if ($productDesc->first()) {
                                $productDesc->update($descriptons);
                            } else {
                                ShopProductDescription::insert($descriptons);
                            }
                            if ($row['special_price']) {
                                $ShopSpecialPrice = ShopSpecialPrice::where('product_id', $id);
                                if ($ShopSpecialPrice->first()) {
                                    $ShopSpecialPrice->update([
                                        'company_id' => $company,
                                        'price' => $row['special_price'],
                                        'status' => 1,
                                    ]);
                                } else {
                                    ShopSpecialPrice::insert([
                                        'product_id' => $id,
                                        'company_id' => $company,
                                        'price' => $row['special_price'],
                                        'status' => 1,
                                    ]);
                                }
                            }
                            if(!in_array($row_num, $errorsarr)) {
                                $arrSuccess[] = 'import success product sku ' . $row['sku'] . ' - row number ' . $row_num;
                            }
                        } catch (\Exception $e) {
                            // $arrError[] = $row['sku'] . ': have error ' . $e->getMessage();
                            $arrError[] = $row['sku'] . ': have error';
                        }
                    }
                    if ($arrSuccess) {
                        $request->session()->flash('import_success', $arrSuccess);
                    }
                    if ($arrError) {
                        $request->session()->flash('import_error', $arrError);
                    }
                    return back();
                });
            }
        }

        return $content
            ->header(trans('language.process.productImport'))
            ->description(' ')
            ->body($this->getImportProduct());
    }

    public function getImportProduct()
    {
        return view('admin.ImportProduct')->render();

    }

}
