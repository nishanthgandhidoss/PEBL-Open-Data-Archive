
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

#tableID_wrapper{
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
  
 table.table-bordered.dataTable {
    border-collapse: collapse !important;
}
 
    
</style>
  
  <script>
  
	  $(document).ready(function() {
		  /*  var table = $('#listTableID').DataTable( {
				scrollX: false
			});  */
			// Setup - add a text input to each footer cell
		    $('#listTableID tfoot th').each( function () {
		        var title = $(this).text();
		        if(title!=="Actions")
		 	        $(this).html('<input  type="text" style="max-width:200px;border: 1px solid #ccc;"/>');
		        else
		        	 $(this).html("Search by column");
		    } );
		 
		    // DataTable
		   // var table = $('#listTableID').DataTable();
		    
		    /*$('#listTableID').DataTable( {
		    	  "columnDefs": [
		    	    { "width": "2%", "targets":5 },
		    	    { "width": "2%", "targets":10 }
		    	  ]
		    	} );*/
		    
		    var table = $('#listTableID').DataTable({"autoWidth": false});
		    // Apply the search
		    table.columns().every( function () {
		        var that = this;
		 
		        $( 'input', this.footer() ).on( 'keyup change', function () {
		            if ( that.search() !== this.value ) {
		                that
		                    .search( this.value )
		                    .draw();
		            }
		        } );
		    } );
	 	   
		  $("a.tooltipLink").tooltip();
		 // $('[data-toggle="modal"][title]').tooltip();// For tooltip over barcode glyphicon Alone
		  
		  $('<div class="pull-right appblue white" style="margin-bottom:10px"><a href="${webapp_path}/addgrn.sp" class="white bld padding10">Add GRN<a/></div>').insertBefore("#tableID_wrapper");
		
	  });
		  
  </script>
  
  
  <script>
  
   function loadQC(grnNo,noOfBags,callFor){
	   
	   var url="${webapp_path}/qualitycheck.sp";
	   $("#grnNo_hiddenID").val(grnNo);
	   $("#totalBags_hiddenID").val(noOfBags);
	   $("#callFor_hiddenID").val(callFor);
	   $("#tablefrmId").attr("method","post");
	   $("#tablefrmId").attr("action",url);
	   $("#tablefrmId").submit();
	   
   }
   
   function loadBarcodeImg(grnNo){
	   
	   $("#grnNo_hiddenID").val(grnNo);
	   var url="${webapp_path}/getbarcode.sp";
	   document.getElementById("barcodeImgID").src="${webapp_path}/getbarcode.sp?grnNo="+grnNo;
	   $("#modalGrnNoID").html("GRN No : "+grnNo);
	   $("#modalBarcodeImgID").modal('show');
   }
   
   
   /*function printGRNBarcode(){
	   
	  var grnNo=$("#grnNo_hiddenID").val();
	  var noOfCopies = $("#noOfCopies").val();
      $("#noOfCopiesHidden").val(noOfCopies);
      $("#grnNoId").val(grnNo);
	  var url="${webapp_path}/printbarcode.sp";
	 
	  $("#tablefrmId").attr("action",url);
	  $("#tablefrmId").submit();
	  
   }*/
   
   function printGRNBarcode(){
	   
		  var grnNo=$("#grnNo_hiddenID").val();
		  var noOfCopies = $("#noOfCopies").val();
		  //var printerName = $("#printerNameId").val();
		  var url="${webapp_path}/printbarcode.sp";
		  $.get(url,{grnNo:grnNo,noOfCopies:noOfCopies},function(data,status){
			  
			   
		  })
	   }
	   
   
   
   function editGrn(id){
	   
	   var url="editGrn.sp";
	   $("#grnNo_hiddenID").val(id)
	   $("#tablefrmId").attr('action', url);
	   $("#tablefrmId").attr('method', "POST");
	   $("#tablefrmId").submit();
	   
   }
   
  </script>
  

<c:if test="${fn:length(GRN_LIST)>0}">
<div class="container-fluid">
<form id="tablefrmId">
<input type="hidden" name="id" id="grnNo_hiddenID">
<input type="hidden" name="noOfBags" id="totalBags_hiddenID">
<input type="hidden" name="callFor" id="callFor_hiddenID">
<input type="hidden" name="noOfCopies" id="noOfCopiesHidden">
<input type="hidden" name="grnNo" id="grnNoId">

<table id="listTableID" class="table compact table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
            <tr class="headerCss">
	            <c:forEach var="headerName" items="${HEADER_LIST}">
	                <th>${headerName}</th>
	            </c:forEach>
            </tr>
        </thead>
        <tfoot>
            <tr>
	            <c:forEach var="headerName" items="${HEADER_LIST}">
	                <th>${headerName}</th>
	            </c:forEach>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach var="grnObj" items="${GRN_LIST}">
            <tr>
                <td>${grnObj.grnNo}</td>
                
                <td>
               	<c:choose>
               		<c:when test="${grnObj.approvedFlag eq 'Y' && (sessionScope.user.userRole eq 'Approver' || sessionScope.user.userRole eq 'App Admin')}">
                    	<a href="javascript:void(0)" onclick="loadQC(${grnObj.id},${grnObj.noOfBags},'editQC')" class="tooltipLink" data-toggle="tooltip" title="QC Approved GRN"><span style="color:#4caf50" class="glyphicon glyphicon-check paddingleft10"></span></a>
	            	</c:when>
	            	<c:when test="${grnObj.approvedFlag eq 'N' && (sessionScope.user.userRole eq 'Approver' || sessionScope.user.userRole eq 'App Admin')}">
	            		<a href="javascript:void(0)" onclick="loadQC(${grnObj.id},${grnObj.noOfBags},'loadQC')" class="tooltipLink" data-toggle="tooltip" title="Send for QC Approval"><span style="color:#cc0000" class="glyphicon glyphicon-share-alt paddingleft10"></span></a>
	            	</c:when>
	            </c:choose>
	                <a href="javascript:void(0)" onclick="loadBarcodeImg('${grnObj.grnNo}')"  class="tooltipLink"  title="View | Print GRN Barcode"><span style="color:#333"class="glyphicon glyphicon-barcode paddingleft10"></span></a>
	                <a href="javascript:void(0)" onclick="editGrn(${grnObj.id})" class="tooltipLink" data-toggle="tooltip" title="View | Edit GRN"><span style="color:#3291d1" class="glyphicon glyphicon-screenshot paddingleft10"></span></a>
	                <a href="javascript:void(0)" class="tooltipLink" data-toggle="tooltip" title="Delete"><span style="color:#dc446e;padding-left:10px" class="glyphicon glyphicon-trash"></span></a>
                </td>
                
                <td>${grnObj.grnDate}</td>
                <td>${grnObj.fullName}</td>
                <td>${grnObj.rmName}</td>
                <td>${grnObj.rmGradeName}</td>
                <td>${grnObj.quantity}</td>
                <td>${grnObj.remainingQuantity}</td>
                <td>${grnObj.supplierName}</td>
                <td>${grnObj.invoiceDate}</td>
                <td>${grnObj.invoiceNo}</td>
                <td>${grnObj.noOfBags}</td>
                <td>${grnObj.qcApprovedBags}</td>
              
               
              <%--   <td>${grnObj.rmLotNo}</td> --%>
              	<%-- <td>${grnObj.rmTestReportNo}</td> --%>
               <%--  <td>${grnObj.rmManufactureDate}</td> --%>
                <%-- <td>${grnObj.qcApprovedBags}</td>
                <td>${grnObj.noOfBags}</td> --%>
            </tr>
         </c:forEach>
        </tbody>
    </table>
    
    </form>
    </div>
	</c:if>
	
	
	
	<c:if test="${fn:length(GRN_LIST)==0}">
	
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
                  <h3 class="modal-title" style="color:#dc446e" >Generated Barcode</span></h3>
                  <h4 class="modal-title" id="modalGrnNoID">GRN NO :</h4>
            </div>
            
     		<div class="modal-body">
     		
     		
     		        <div class="form-group">
					    <img class="" id="barcodeImgID"  src=""/>
					</div>
					
					
					<!-- <div class="form-group">
	                       <label>Select Printer</label>
	                       <select class="form-control" id="printerNameId" name="printerName" style="width:auto">
	                        <option value="0">Select </option>
	                        <option value="POSTEK">POSTEK</option>
	                       </select>
                     </div> -->
					
	       			 <div class="form-group">
                       <label>No of Copies</label>
                       <input type="text" class="form-control" style="width:100px" name="noOfCopies" id="noOfCopies">
                     </div>
                     
      	    </div>
      		  
      			  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="printGRNBarcode()">Print</button>
      </div>
    </div>
  </div>
</div>


 <!--      Barcode Image popup ends      -->
   