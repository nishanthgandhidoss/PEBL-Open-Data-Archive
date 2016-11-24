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
</style>
  
<script>
 	$(document).ready(function() {
 		// Setup - add a text input to each footer cell
 		 $('#listTableID tfoot th').each(function() {
 	        var title = $(this).text();
 	         var arr=["Invoice No.","Route Card No."]
 	      
 	        if(isInArray(arr, title)){
 	           $(this).html('<input class="tooltipLink" data-toggle="tooltip" type="text" style="max-width:200px;border: 1px solid #ccc;" placeholder="'+title+'" title="Search '+title+'"/>');
 	        }
 	    }); 
 		// DataTable
 	    var table = $('#listTableID').DataTable( {
			scrollX: false
		});
 		// Apply the search
 	    table.columns().every(function() {
 	        var column = this;
 	        
 	       //var idx = this.index().column;
 	      // var title = this.header();
 	       
 	      // alert($(title).html())
 	        
 	        $('input', this.footer()).on('keyup change', function() {
 	        	
 	            if(column.search() !== this.value) {
 	            	column .search( this.value ).draw();
 	            }
 	        });
 	    });
		$("a.tooltipLink,input.tooltipLink").tooltip();
		$('<div class="pull-right appblue white" style="margin-bottom:10px"><a href="${webapp_path}/${ADD_URL[0]}" class="white bld padding10">${ADD_URL[1]}<a/></div>').insertBefore("#listTableID_wrapper"); 
	});
 	
 	
 	function isInArray(array, search)
 	{
 	    return array.indexOf(search) >= 0;
 	}
 	
</script>
  
<c:if test="${fn:length(OBJECT_LIST)>0}">
	<div class="container-fluid">
		<form id="listFormId">
			<input type="hidden" id="hiddenObjId" name="id"/>
			<input type="hidden" id="hiddenObjFrom" name="from"/>
			<input type="hidden" id="hiddenObjInvoiceId" name="invoiceId"/>
			<c:if test="${actionMp.key==approveConstant}">
				<input type="hidden" id="hiddenApprovalStatus" name="isApproved"/>
			</c:if>
			<div class="center"><h4>${LIST_HEADER}</h4></div>
			<table id="listTableID" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
		        <thead>
		            <tr>
			            <c:forEach var="headerName" items="${TBL_HEADER_LIST}">
			                <th>${headerName}</th>
			            </c:forEach>
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
		                <td>${obj.invoiceNumber}</td>
		                
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
				              <c:if test="${actionMp.key==editConstant && obj.isEditable=='Y'}">
				               	   <a href="javascript:void(0)"  onclick="edit(${obj.routeCardNo},${obj.id},'${invoiceConstant}','${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Edit"><span style="color:#3291d1" class="glyphicon glyphicon-edit paddingleft10"></span></a>
				              </c:if>
				              
				              <!-- Production -->
				              <c:if test="${actionMp.key==productionConstant && obj.isEditable=='Y'}">
				               	   <a href="javascript:void(0)"  onclick="production(${obj.id},'Y','${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Production"><span style="color:#7E5D0D" class="glyphicon glyphicon-wrench paddingleft10"></span></a>
				              </c:if>
				              
				              <!-- Inspection -->
							  <c:if test="${actionMp.key==inspectionConstant && obj.isEditable=='Y'}">
								   <a href="javascript:void(0)"  onclick="inspection(${obj.id},'N','${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Inspection"><span style="color:#2DB138" class="glyphicon glyphicon-thumbs-up paddingleft10"></span></a>
							  </c:if>
				              
				              <!-- View -->
							  <c:if test="${actionMp.key==viewConstant && obj.isEditable=='Y'}">
								   <a href="javascript:void(0)"  onclick="view(${obj.id},'${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="View"><span style="color:#dc446e" class="glyphicon glyphicon-eye-open paddingleft10"></span></a>
							  </c:if>
							  
							  <!-- Invoice -->
							  <c:if test="${actionMp.key==invoiceConstant && obj.isEditable=='Y'}">
								   <a href="javascript:void(0)"  onclick="invoice(${obj.id},${obj.remainingTotalQuantity},'${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Invoice"><span style="color:#858683" class="glyphicon glyphicon-export paddingleft10"></span></a>
							  </c:if>
				              <!-- Delete -->
				                    
				              <c:if test="${actionMp.key==deleteConstant && obj.isRemovable=='Y'}">
			                   		<a href="javascript:void(0)" onclick="delete(${obj.id},'${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Delete"><span style="color:#dc446e" class="glyphicon glyphicon-trash paddingleft10"></span></a>
			                  </c:if>
			                   
		                </c:forEach>
			            <!-- Barcode -->
				              <a href="javascript:void(0)" onclick="loadBarcodeImg(${obj.invoiceNumber})"  class="tooltipLink"  title="Print Invoice Barcode"><span style="color:#333" class="glyphicon glyphicon-barcode paddingleft10"></span></a>
		               	</td>
		                <td><a href="javascript:void(0)" onclick="viewRouteCard(${obj.routeCardNo})"  class="tooltipLink"  title="View Route Card"><b>${obj.routeCardNo}</b></a></td>
						<td>${obj.invoiceDate}</td>
						<td>${obj.quantity}</td>
						<td title="${obj.fullNameWithUserName}">${obj.firstName}</td>
						<td>${obj.createdDate}</td>
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
	function edit(routeCardNo,invoiceId,from,url){
	   $("#hiddenObjId").val(routeCardNo);
	   $("#hiddenObjFrom").val(from);
	   $("#hiddenObjInvoiceId").val(invoiceId);
	   $("#listTableID_length").empty(); // Inorder to remove listTableID_length appearing on the url
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   $("#listFormId").submit();
	}
   function viewRouteCard(routeCardNo) {
	   $("#hiddenObjId").val(routeCardNo);
	   $("#hiddenObjIsProd").remove();
	   $("#hiddenObjInvoiceId").remove();
	   $("#listTableID_length").empty(); // Inorder to remove listTableID_length appearing on the url
	   var url = "${webapp_path}/viewRouteCard.sp";
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   $("#listFormId").submit();
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
   
</script>