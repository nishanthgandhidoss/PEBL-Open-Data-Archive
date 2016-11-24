<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<spring:eval var="approveConstant" expression="T(com.erp.utils.Constants).ACTION_APPROVE"/>
<spring:eval var="rejectConstant" expression="T(com.erp.utils.Constants).ACTION_REJECT"/>
<spring:eval var="editConstant" expression="T(com.erp.utils.Constants).ACTION_EDIT"/>
<spring:eval var="deleteConstant" expression="T(com.erp.utils.Constants).ACTION_DELETE"/>
<spring:eval var="viewConstant" expression="T(com.erp.utils.Constants).ACTION_VIEW"/>
<spring:eval var="productionConstant" expression="T(com.erp.utils.Constants).PRODUCTION"/>
<spring:eval var="inspectionConstant" expression="T(com.erp.utils.Constants).INSPECTION"/>
<spring:eval var="invoiceConstant" expression="T(com.erp.utils.Constants).INVOICE"/>

<link rel="stylesheet" href="${webapp_path}/css/datatable/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="${webapp_path}/css/datatable/responsive.bootstrap.min.css">

<script src="${webapp_path}/js/datatable/jquery.dataTables.min.js"> </script>
<script src="${webapp_path}/js/datatable/dataTables.bootstrap.min.js"> </script>
<script src="${webapp_path}/js/datatable/dataTables.responsive.min.js"> </script>
<script src="${webapp_path}/js/datatable/responsive.bootstrap.min.js"> </script>

<style>
	table.dataTable thead th, table.dataTable thead td {
	  padding: 5px;
	  border-bottom: 1px solid #111;
	}
	#listTableID_wrapper{
	    clear:both;
	}
	#tableID_info {
	   clear: none;
	}
	tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
   
	.input-group-addon{
	    background-color: #fff !important;
	}
	
	
	table.table-bordered.dataTable {
    border-collapse: collapse !important;
}
	
	
</style>
  
<script>
 	$(document).ready(function() {
 		// Setup - add a text input to each footer cell
 		$('#listTableID tfoot th').each(function() {
 	        var title = $(this).text();
 	        
 	        if(title!=="Action")
 	        	$(this).html('<input  type="text" style="max-width:200px;border: 1px solid #ccc;" />');
 	       else
 	    	  $(this).html("Search by column");
 		});
 		// DataTable
 	    var table = $('#listTableID').DataTable( {
			scrollX: false
		});
 		// Apply the search
 	    table.columns().every(function() {
 	        var columnObj = this;
 	        $('input', this.footer()).on('keyup change', function() {
 	            if(columnObj.search() !== this.value) {
 	            	columnObj.search( this.value ).draw();
 	            }
 	        });
 	    });
		$("a.tooltipLink,input.tooltipLink").tooltip();
		$('<div class="pull-right appblue white" style="margin-bottom:10px"><a href="${webapp_path}/${ADD_URL[0]}" class="white bld padding10">${ADD_URL[1]}<a/></div>').insertBefore("#listTableID_wrapper"); 
	});
</script>
  
<c:if test="${fn:length(OBJECT_LIST)>0}">
<div class="container-fluid">
	<form id="listFormId">
		<input type="hidden" id="hiddenObjId" name="id"/>
		<input type="hidden" id="hiddenObjIsProd" name="prodFlag"/>
		<c:if test="${actionMp.key==approveConstant}">
			<input type="hidden" id="hiddenApprovalStatus" name="isApproved"/>
		</c:if>
		<div class="center"><h4>${LIST_HEADER}</h4></div>
		<table id="listTableID" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
	        <thead>
	            <tr class="headerCss">
	                    <th title="ID">ID</th>
	                    <th style="white-space:pre-wrap ; word-wrap:break-word;" title="Action">Action</th> 
						<th style="white-space:pre-wrap ; word-wrap:break-word;"title="Created By">Created Date</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;"title="Part Name">Part &nbsp; Name</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Machine Name">Mc Name</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="GRN No.">GRN No</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="RM Issued(KG)">Issued RM(KG)</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Planned Qty">Plan Qty</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Produced Qty">Prod. Qty</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="OK Qty">OK Qty</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Rejected Qty">Reject Qty</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Total Inspected Qty">Inspect Qty</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Dispatched Qty">Dispatched Qty</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;"title="Remaining Qty">Remaining Qty</th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="RM Issued By">RM Issued By : </th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="RM Received By">RM Received By : </th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Created By">Created By : </th>
						<th style="white-space:pre-wrap ; word-wrap:break-word;" title="Operation Name">Operation Name : </th>
	                        
		            <%-- <c:forEach var="headerName" items="${TBL_HEADER_LIST}">
		                <th>${headerName}</th>
		            </c:forEach> --%>
	            </tr>
	        </thead>
	        <tfoot>
	            <tr>
		            <c:forEach var="headerName" items="${TBL_HEADER_LIST}">
		                <th>${headerName}</th>
		            </c:forEach>
	            </tr>
	        </tfoot>
	        <tbody>
	        <c:forEach var="obj" items="${OBJECT_LIST}">
	            <tr>
	                <td>${obj.routeCardNo}</td>
	                
	                <td>
	               	<c:forEach var="actionMp" items="${ACTIONS}">
		               
		                  <!-- Approve/reject -->
		                  <c:if test="${actionMp.key==approveConstant && obj.isApproved=='N'}">
			                  <a href="javascript:void(0)" onclick="approve(${obj.id},'${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Approve"><span style="color:#4caf50" class="glyphicon glyphicon-thumbs-up paddingleft10"></span></a>
			              </c:if>
			              <c:if test="${actionMp.key==approveConstant && obj.isApproved=='Y'}">
			                   <a href="javascript:void(0)" onclick="reject(${obj.id},'${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Reject"><span style="color:#dc446e" class="glyphicon glyphicon-thumbs-down paddingleft10"></span></a>
			              </c:if>
			              
			              <!-- Edit -->
			              <c:if test="${actionMp.key==editConstant && obj.isEditable=='Y' && (sessionScope.user.userRole eq 'Approver' || sessionScope.user.userRole eq 'App Admin')}">
			               	   <a href="javascript:void(0)"  onclick="edit(${obj.id},'${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Edit"><span style="color:#3291d1" class="glyphicon glyphicon-edit paddingleft10"></span></a>
			              </c:if>
			              
			              <!-- Production -->
			              <c:if test="${actionMp.key==productionConstant && obj.isEditable=='Y'}">
			               	   <a href="javascript:void(0)"  onclick="production(${obj.id},'Y','${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Production"><span style="color:#7E5D0D" class="glyphicon glyphicon-wrench paddingleft10"></span></a>
			              </c:if>
			              
			              <!-- Inspection -->
						  <c:if test="${actionMp.key==inspectionConstant && obj.isEditable=='Y'}">
							   <a href="javascript:void(0)"  onclick="inspection(${obj.id},'N','${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Inspection"><span style="color:#2DB138" class="glyphicon glyphicon-search paddingleft10"></span></a>
						  </c:if>
			              
			              <!-- View -->
						  <c:if test="${actionMp.key==viewConstant && obj.isEditable=='Y'}">
							   <a href="javascript:void(0)"  onclick="view(${obj.id},'${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="View"><span style="color:#dc446e" class="glyphicon glyphicon-eye-open paddingleft10"></span></a>
						  </c:if>
						  
						  <!-- Invoice -->
						  <c:if test="${actionMp.key==invoiceConstant && obj.isEditable=='Y'}">
							   <a href="javascript:void(0)"  onclick="invoice(${obj.id},${obj.remainingTotalQuantity},'${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Invoice"><span style="color:#858683" class="glyphicon glyphicon-file paddingleft10"></span></a>
						  </c:if>
			              <!-- Delete -->
			                    
			              <c:if test="${actionMp.key==deleteConstant && obj.isRemovable=='Y'}">
		                   		<a href="javascript:void(0)" onclick="delete(${obj.id},'${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Delete"><span style="color:#dc446e" class="glyphicon glyphicon-trash paddingleft10"></span></a>
		                  </c:if>
		                   
	                  </c:forEach>
		              
		              <!-- Barcode -->
			              <a href="javascript:void(0)" onclick="loadBarcodeImg('${obj.routeCardNo}')"  class="tooltipLink"  title="Print Barcode"><span style="color:#333" class="glyphicon glyphicon-barcode paddingleft10"></span></a>
			        </td>
	                <%-- <c:forEach var="prop" items="${PROPERTIES_LIST}">   
	                	<td>${obj[prop]}</td>
	                </c:forEach> --%>
	                <td>${obj.createdDate}</td>
	                <td style="white-space:pre-wrap ; word-wrap:break-word;">${obj.partName}</td>
	                <td>${obj.machineName}</td>
	                <td><a href="javascript:void(0)" onclick="viewGrn(${obj.grnId})"  class="tooltipLink clickableTd"  title="View GRN"><b>${obj.grnNo}</b></a></td>
	                <td>${obj.issuedQuantity}</td>
	                <td>${obj.planQuantity}</td>
	                <td>${obj.producedQuantity}</td>
	                <td style="color:#2DB138">${obj.totalInspectOkQty}</td>
	                <td style="color:#dc446e">${obj.totalInspectRejQty}</td>
	                <td>${obj.totalInspectQty}</td>
	                <td>${obj.despatchedQuantity}</td>
	                <td>${obj.remainingTotalQuantity}</td>
	                <td>${obj.userBOList[0].fullName}</td> <!-- Rm Issued BY -->
	                <td>${obj.userBOList[1].fullName}</td> <!-- RM Received By -->
	                <td>${obj.createdBy}</td>
	                <td>${obj.operationName}</td>
	                
	                
				<%-- 	<td>${obj.rmName}</td>
					<td>${obj.rmGrade}</td>
					<td>${obj.modelName}</td>
					<td>${obj.rmSpecification}</td>
					<td>${obj.rmLotNo}</td> --%>
					
				</tr>
	         </c:forEach>
	        </tbody>
	    </table>
	</form>
	</div>
</c:if>
	
<c:if test="${fn:length(OBJECT_LIST)==0}">
	<div class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px">
                           No Records Found &#9785;
    </div>
</c:if>

<!--      Barcode Image popup starts      -->
   <div class="modal fade" id="modalBarcodeImgID" tabindex="-1" role="dialog" aria-labelledby="modalGrnID">
     <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <h3 class="modal-title" style="color:#dc446e" ><span>Generated Barcode</span></h3>
                 <h4 class="modal-title" id="modalGrnNoID">Route Card NO :</h4>
            </div>
            <div class="modal-body">
	       		 <div class="form-group">
	       		 	<img id="barcodeImgID" src=""/>
	       		 </div>
	       		 <div class="form-group">
                   <label>No of Copies</label>
                   <input type="text" class="form-control" style="width:100px" name="noOfCopies" id="noOfCopies">
                 </div>
      	    </div>
		    <div class="modal-footer">
		  	    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="printBarcode()">Print</button>
		    </div>
    	</div>
 	 </div>
	</div>
<!--      Barcode Image popup ends      -->

<script>
   function approve(id,url){
	  $("#hiddenObjId").val(id)
	  $("#hiddenApprovalStatus").val("Y")
	  updateApprovalStatusAjax(url);
   }
   function reject(id,url){
	   $("#hiddenObjId").val(id)
	   $("#hiddenApprovalStatus").val("N")
	   updateApprovalStatusAjax(url);
   }
   function edit(id,url){
	   $("#hiddenObjId").val(id)
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   $("#listFormId").submit();
   }
   function production(id,prodFlag,url){
	   $("#hiddenObjId").val(id);
	   $("#hiddenObjIsProd").val(prodFlag);
	   $("#listTableID_length").empty(); // Inorder to remove listTableID_length appearing on the url
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   $("#listFormId").submit();
   }
   function inspection(id,prodFlag,url){
	   $("#hiddenObjId").val(id);
	   $("#hiddenObjIsProd").val(prodFlag);
	   $("#listTableID_length").empty(); // Inorder to remove listTableID_length appearing on the url
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   $("#listFormId").submit();
   }
   function view(id, url) {
	   $("#hiddenObjId").val(id);
	   $("#listTableID_length").empty(); // Inorder to remove listTableID_length appearing on the url
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   $("#listFormId").submit();
   }
   function invoice(id,remTotQuantity, url) {
	   $("#hiddenObjId").val(id);
	   $("#listTableID_length").empty(); // Inorder to remove listTableID_length appearing on the url
	   if(remTotQuantity > 0) {
		   $("#listFormId").attr('action', url);
		   $("#listFormId").attr('method', "POST");
		   $("#listFormId").submit();
	   } else {
		  	BootstrapDialog.show({
		    	type   :   BootstrapDialog.TYPE_DANGER,
		   draggable   :   true,
		    	size   :   BootstrapDialog.SIZE_NORMAL,
	            title  :   'Message',
	           message :   "<h4>There is no quantity left to despatch/create invoice.</h4>",
	          closable :   true,
	   closeByBackdrop :   true,
	   closeByKeyboard :   true,
	   		   buttons : 	[{
								label : 'OK',
							 cssClass : "dialogBoxError",
							   action : function(dialog) {
								   			dialog.close();
							   			}
							}]
		  });
	   }
   }
   function getRemainingQuantity(id) {
		var url = "getRemainingTotalQuantityById.sp", quantity = 0, isSuccess = false;
		$.get(url,{"id":id},function(data){
		   $.each(data, function (key, jObject) {
			  if(key=="rcBO" && jObject.remainingTotalQuantity > -1)
				  quantity = parseInt(jObject.remainingTotalQuantity);
			});
		});
		return quantity;
	}
   function loadBarcodeImg(id){
	   $("#hiddenObjId").val(id);
	   var url="${webapp_path}/getbarcode.sp";
	   document.getElementById("barcodeImgID").src="${webapp_path}/getbarcode.sp?grnNo="+id;
	   $("#modalGrnNoID").html("Route Card No : "+id);
	   $("#modalBarcodeImgID").modal('show');
   }
   function printBarcode(){
	  var id=$("#hiddenObjId").val();
	  var noOfCopies = $("#noOfCopies").val();
	  var url="${webapp_path}/printbarcode.sp";
	  $.get(url,{grnNo:id,noOfCopies:noOfCopies},function(data,status){});
   }
   function updateApprovalStatusAjax(url){
	   
	       var formId="listFormId"
		    var actionUrl="${webapp_path}"+url;
		    
		 
			var jsondata=submitFrm(formId,actionUrl);
			
			if(jsondata!=null && jsondata!='undefined'){
			BootstrapDialog.show({
			    	type   :   BootstrapDialog.TYPE_INFO,
			   draggable   :   true,
			    	size   :   BootstrapDialog.SIZE_SMALL,
		            title  :   'Message',
		           message :   "success",
		          closable :   true,
		   closeByBackdrop :   false,
		   closeByKeyboard :   false
			  });
			$("#includeDiv").html(jsondata)
			
			}	
			
   }
   function submitFrmGet(formObj,url){
   		var frmdata=$(formObj).serialize();
	    var jsonData;
	    $.ajax({
	        url: url,
	        data:frmdata,
	        cache: false,
	        async: false,
	        success: function (data) {
	        	jsonData=data;
	        }
        });
        return jsonData;
	}
   function viewGrn(id){
	 var url="editGrn.sp";
	 $("#hiddenObjId").val(id)
	 $("#listFormId").attr('action', url);
	 $("#listFormId").attr('method', "POST");
	 $("#listFormId").submit();
 }
   
</script>