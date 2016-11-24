
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

</style>
  
  <script>
  
	  $(document).ready(function() {
		  $('#tableID').DataTable( {
			  scrollX: false
			} );
		  
		  $("a.tooltipLink").tooltip();
		  $('[data-toggle="modal"][title]').tooltip();// For tooltip over barcode glyphicon Alone
		  
		  $('<div class="pull-right appblue white" style="margin-bottom:10px"><a href="${webapp_path}/admin/pricingTool.sp" class="white bld padding10">Add Part Number<a/></div>').insertBefore("#tableID_wrapper");
		  
		 
		 // $("#tableID_info").detach().prependTo('#example_wrapper');
		 // $("#tableID_paginate").detach().prependTo('#example_wrapper');
		  
		 // $("#tableID_info").detach().prependTo('#tableID_wrapper');
		
	  });
		  
  </script>
  
  
  <script>
  
   function editPartNumber(id){
	   
	   var url="${webapp_path}/admin/editPricing.sp";
	   $("#id_hiddenID").val(id);
	   $("#tablefrmId").attr("method","post");
	   $("#tablefrmId").attr("action",url);
	   $("#tablefrmId").submit();
   }
   
   </script>
 
<style>

.glyphicon{
  
    font-size:16px;
    padding:5px;
}

</style>

<c:if test="${fn:length(PRICING_LIST)>0}">
<div class="container-fluid">
<form id="tablefrmId">
<input type="hidden" name="id" id="id_hiddenID">

<table id="tableID" class="table  table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
            <tr>
              
            <c:forEach var="headerName" items="${HEADER_LIST}">
                <th>${headerName}</th>
            </c:forEach>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="pricingObj" items="${PRICING_LIST}">
            <tr>
                <td>${pricingObj.partNumber}</td>
                
                <td>
                    <%-- <a href="javascript:void(0)" onclick="loadQC(${grnObj.grnNo},${grnObj.noOfBags})" class="tooltipLink" data-toggle="tooltip" title="Quality Check"><span style="color:#4caf50" class="glyphicon glyphicon-check"></span></a>
	                <a href="javascript:void(0)" onclick="loadBarcodeImg(${grnObj.grnNo})"  class="tooltipLink"  title="Print GRN Barcode"><span style="color:#333"class="glyphicon glyphicon-barcode"></span></a> --%>
	                <a href="javascript:void(0)" onclick="editPartNumber(${pricingObj.id})" class="tooltipLink" data-toggle="tooltip" title="Edit"><span style="color:#3291d1" class="glyphicon glyphicon-edit"></span></a>
	                <a href="javascript:void(0)" class="tooltipLink" data-toggle="tooltip" title="Delete"><span style="color:#dc446e" class="glyphicon glyphicon-trash"></span></a>
                </td>
                
                <td>${pricingObj.partName}</td>
                <td>${pricingObj.modelName}</td>
                <td>${pricingObj.quantityPerPacket}</td>
                <td>${pricingObj.partPrice}</td>
            </tr>
         </c:forEach>
        </tbody>
    </table>
    
    </form>
    </div>
	</c:if>
	
	
	
	<c:if test="${fn:length(PRICING_LIST)==0}">
	
	<div class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px">
                           No Records Found &#9785;
    </div>
	
	
   </c:if>
