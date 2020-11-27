
       <table class="table box table-bordered" style="align-item=center">
         <thead>
         <tr>
           <th>code</th>
           <th>name</th>
           <th>amount_in_base</th>
         </tr>
         </thead>
         <tbody>
        @foreach ($datas as $data)
        <tr>
          <td>
            <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['codeField'] }}" data-type="{{ $data['type'] }}" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['codeValue'] }}"></a>
          </td>
          <td>
            <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['nameField'] }}" data-type="{{ $data['type'] }}" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['value'] }}"></a>
          </td>
          <td>
            <a href="#" class="{{ !empty($data['disabled'])?'editable-disabled':'' }} {{ ($data['required'])?'fied-required':'no-required' }}" data-name="{{ $data['amountField'] }}" data-type="number" data-pk="{{ $data['key'] }}" data-source ="{{ $data['source'] }}" data-url="{{ $data['url'] }}" data-title="{!! trans(htmlentities($data['title'])) !!}" data-value="{{ $data['amount'] }}"></a>
          </td>
        </tr>
        @endforeach
        <tr class="test"></tr>
        </tbody>
         <tfoot>
        <tr>
          <td colspan="3">  
            <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addNewUOF"  rel="tooltip" data-original-title="" title="Add new item"><i class="fa fa-plus"></i> {{trans('language.attribute.add_more')}}</button>
          
          </td>

        </tr>
         </tfoot>
      </table>
      <div class="modal fade" id="addNewUOF" tabindex="-1" role="dialog" aria-labelledby="addNewUOF" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
           <div class="modal-header">
             <h3>{{trans('language.admin.add_new_item')}}</h3>
             <span id='uofmError' style='color:red'></span>
           </div>
           <div class="model-body">
              
                  <div class="container-fluid">
                <label style="margin-left: 68px">{{trans('language.admin.code')}}</label><input type="text" id="uofmCode" name="code"  class="form-control is-invalid"></input>
                  <br/><br/>
                <label style="margin-left: 64px">{{trans('language.admin.unit_name')}}</label><input type="text" id="uofmName" name="name" class="form-control"></input>
                <br/><br/>
                <label>amount in base </label> <input type="number" id="uofmAmount" name="amount_base"  class="form-control"></input>
                <br/><br/>
           
        </div>
        </div>
          
        <div class="modal-footer">
           <button type="button" class="btn btn-primary" id="saveChanges">Save changes</button>
           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </div>
   
    </div>
  </div>
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

    $("#saveChanges").on("click", function (){
      var code = $("#uofmCode").val();
      var name = $("#uofmName").val();
      var amount = $("#uofmAmount").val();
      saveToTheDB(code , name , amount);
    });

    function saveToTheDB(code , name, amount) {
      $.ajaxSetup({
          headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
      });
      $.ajax({
          url: 'addNewUofm',
          method: "POST",
          dataType: 'json',
          data: {
              _token: '{{csrf_token()}}',
              code : code ,
              name : name,
              amount : amount,
          },
          success: function (result)
          {
            $("#saveChanges").attr('data-dismiss', 'modal');
            $(".test").before('<tr><td><a>'+code+'</a></td><td><a>'+name+'</a></td><td><a>'+amount+'</a></td></tr>');
            $("#uofmCode").val('');
            $("#uofmName").val('');
            $("#uofmAmount").val('');
            $("#uofmError").html('');
          },
          error:function(error){
            $("#uofmError").html(error.responseJSON.message);
          }
      });
    }
});
</script>
<script>
  function morItem(id){
    
          $("#no-item-"+id).remove();
      //$("tr#addnew-"+id).before("<tr><td><span><span class=\"input-group\"><input  type=\"text\" name=\"group["+id+"][name][]\" value=\"\" class=\"form-control\" placeholder=\"$detail_name\"></span></span></td><td><button onclick=\"removeItemForm(this);\" class=\"btn btn-danger btn-xs\" data-title=\"Delete\" data-toggle=\"modal\"  data-placement=\"top\" rel=\"tooltip\" data-original-title=\"\" title=\"Remove item\"><span class=\"glyphicon glyphicon-remove\"></span> $remove</button></td></tr>");
      }

      function removeItemForm(elmnt){
        elmnt.closest("tr").remove();
      }

</script>
