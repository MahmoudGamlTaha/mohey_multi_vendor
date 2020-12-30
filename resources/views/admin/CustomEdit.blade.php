<table class="table box table-bordered">
    @if(isset($contacts))
        @foreach ($contacts as $data)
            <tr>
                <td style="width: 200px;">{!! trans(htmlentities($data['name'])) !!}:</td>
                <td>
                    <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['name'] }}" data-type="text" data-pk="{{ $data['id'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['name'])) !!}" data-value="{{ $data['value'] }}"></a>
                </td>
            </tr>
            @php
                $test = 1;
            @endphp
        @endforeach
        <tr class="test"></tr>
        <tfoot>
        <tr>
            <td colspan="3">
                <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addContact"  rel="tooltip" data-original-title="" title="Add new item"><i class="fa fa-plus"></i> {{trans('language.attribute.add_more')}}</button>
            </td>
        </tr>
        </tfoot>
        <div class="modal fade" id="addContact" tabindex="-1" role="dialog" aria-labelledby="addContact" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>{{trans('language.admin.add_new_contact')}}</h3>
                    </div>
                    <div class="model-body">

                        <div class="container-fluid">
                            <label style="margin-left: 68px">{{trans('language.admin.unit_name')}}</label><input type="text" class="form-control is-invalid contactName"></input>
                            <br/><br/>
                            <label style="margin-left: 64px">{{trans('language.admin.value')}}</label><input type="text" class="form-control contactValue"></input>
                            <br/><br/>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary saveContact" >Save changes</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    @else
        @foreach ($datas as $data)
            <tr>
                <td style="width: 200px;">{!! trans(htmlentities($data['title'])) !!}:</td>
                <td>
                    <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['field'] }}" data-type="{{ $data['type'] }}" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['value'] }}"></a>
                </td>
            </tr>
        @endforeach
    @endif
</table>
<script type="text/javascript">
    $(document).ready(function() {
        $('.no-required').editable({});
        $('.fied-required').editable({
            validate: function(value) {
                if (value == '') {
                    return '{{  trans('language.admin.not_empty') }}';
                }
            }
        });
        var contacts = {{$test ?? 0}};
        if(contacts !== 0) {
            $(".saveContact").on("click", function () {
                var name = $(".contactName").val();
                var value = $(".contactValue").val();
                $.ajax({
                    url: 'updateContactUs',
                    method: "POST",
                    dataType: 'json',
                    data: {
                        _token: '{{csrf_token()}}',
                        name: name,
                        value: value,
                    },
                    success: function (result) {
                        $(".saveContact").attr('data-dismiss', 'modal');
                        $(".test").before('<tr><td>' + name + '</td><td><a>' + value + '</a></td></tr>');
                        $(".contactName").val('');
                        $(".contactValue").val('');
                    },
                });
            }).attr('data-dismiss', 'modal');
        }
    });
</script>