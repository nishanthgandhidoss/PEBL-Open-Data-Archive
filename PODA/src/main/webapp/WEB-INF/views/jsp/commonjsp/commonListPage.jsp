
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:eval var="approveConstant" expression="T(com.erp.utils.Constants).ACTION_APPROVE"/>
<spring:eval var="rejectConstant" expression="T(com.erp.utils.Constants).ACTION_REJECT"/>
<spring:eval var="editConstant" expression="T(com.erp.utils.Constants).ACTION_EDIT"/>
<spring:eval var="deleteConstant" expression="T(com.erp.utils.Constants).ACTION_DELETE"/>

<link rel="stylesheet" href="${webapp_path}/css/datatable/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="${webapp_path}/css/datatable/responsive.bootstrap.min.css">

<script src="${webapp_path}/js/datatable/jquery.dataTables.min.js"> </script>
<script src="${webapp_path}/js/datatable/dataTables.bootstrap.min.js"> </script>
<script src="${webapp_path}/js/datatable/dataTables.responsive.min.js"> </script>
<script src="${webapp_path}/js/datatable/responsive.bootstrap.min.js"> </script>


<script>

$(document).ready(function() {
	  $('#listTableID').DataTable({
		  scrollX: false
		} );
	  
	  
	  $(".tooltipLink").tooltip();
	  
	  $('<div class="pull-right appblue white" style="margin-bottom:10px"><a href="${webapp_path}/${ADD_URL[0]}" class="white bld padding10">${ADD_URL[1]}<a/></div>').insertBefore("#listTableID_wrapper"); 
});

</script>

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
		  
/* .glyphicon{
  
    font-size:16px;
    padding:5px;
} */

.input-group-addon{
    background-color: #fff !important;
}

</style>
<title>${LIST_PAGE_TITLE}</title>


<c:if test="${fn:length(OBJECT_LIST)>0}">
<head><base><title>${addTitle}</title></head>
<div class="container-fluid">
<form id="listFormId">

<input type="hidden" id="hiddenObjId" name="id"/>
<input type="hidden" id="hiddenApprovalStatus" name="isApproved"/>
<div class="center"><h4>${LIST_HEADER}</h4></div>

   <table id="listTableID" class="table  table-striped table-bordered dt-responsive compact nowrap" cellspacing="0" width="100%">
        <thead>
            <tr class="headerCss">
               <c:forEach var="headerName" items="${TBL_HEADER_LIST}">
                <th>${headerName}</th>
               </c:forEach>
            </tr>
        </thead>
        
        <tbody>
          <c:forEach var="obj" items="${OBJECT_LIST}">
             <tr>
                <td>${obj.id}</td>
                
                <td>
                   <%--  <a href="javascript:void(0)" onclick="loadQC(${grnObj.grnNo},${grnObj.noOfBags})" class="tooltipLink" data-toggle="tooltip" title="Quality Check"><span style="color:#4caf50" class="glyphicon glyphicon-check"></span></a>
	                <a href="javascript:void(0)" onclick="loadBarcodeImg(${grnObj.grnNo})"  class="tooltipLink"  title="Print GRN Barcode"><span style="color:#333"class="glyphicon glyphicon-barcode"></span></a>
	                <a href="javascript:void(0)" onclick="" class="tooltipLink" data-toggle="tooltip" title="Edit"><span style="color:#3291d1" class="glyphicon glyphicon-edit"></span></a>
	                <a href="javascript:void(0)" class="tooltipLink" data-toggle="tooltip" title="Delete"><span style="color:#dc446e" class="glyphicon glyphicon-trash"></span></a> --%>
	               <c:forEach var="actionMp" items="${ACTIONS}">
	               
	                        <!--   Approve/reject -->
	               
	                  <c:if test="${actionMp.key==approveConstant && obj.isApproved=='N'}">
		                  <a href="javascript:void(0)" onclick="approve(${obj.id},'${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Approve"><span style="color:#4caf50;padding-left:10px" class="glyphicon glyphicon-thumbs-up"></span></a>
		              </c:if>
		              
		              <c:if test="${actionMp.key==approveConstant && obj.isApproved=='Y'}">
		                   <a href="javascript:void(0)" onclick="reject(${obj.id},'${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Reject"><span style="color:#dc446e;padding-left:10px" class="glyphicon glyphicon-thumbs-down"></span></a>
		              </c:if>
		              
		                   <!--   Edit -->
		              
		               <c:if test="${actionMp.key==editConstant && obj.isEditable=='Y'}">
		               <a href="javascript:void(0)"  onclick="edit(${obj.id},'${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Edit"><span style="color:#3291d1;padding-left:10px" class="glyphicon glyphicon-edit"></span></a>
		               </c:if>
		             
		                    <!--   Delete -->
		                    
		               <c:if test="${actionMp.key==deleteConstant && obj.isRemovable=='Y'}">
	                   <a href="javascript:void(0)" onclick="deleteAction(${obj.id},'${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Delete"><span style="color:#dc446e;padding-left:10px" class="glyphicon glyphicon-trash"></span></a>
	                   </c:if>
	                   
                  </c:forEach>   
                </td>
                
                
                <c:forEach var="prop" items="${PROPERTIES_LIST}">   
                 <td>  ${obj[prop]}</td>
                </c:forEach>
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
   

  
  
   <script>
   
   function approve(id,url){
	  
	    $("#hiddenObjId").val(id);
	    $("#hiddenApprovalStatus").val("Y");
	    updateApprovalStatusAjax(url);
   }
   
   
   function reject(id,url){
	   
	    $("#hiddenObjId").val(id);
	    $("#hiddenApprovalStatus").val("N");
	    updateApprovalStatusAjax(url);
   }
   
   function edit(id,url){
	   $("#hiddenObjId").val(id);
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   $("#listFormId").submit();
	   
   }
   
   function deleteAction(id,url){
	   $.post(url,{"id":id},function(jsonData){
	   		$.each(jsonData, function(key, jObject) {
				if(key == "jsonKey" && jObject.returnId > 0) {
					location.reload();
				} else {
					msg = "<h3>" + jObject.returnMsg + "</h3>";
					dialogType = BootstrapDialog.TYPE_DANGER;
					btnStyle = "dialogBoxError";
					isSuccess = false;
					showDialog(dialogType, btnStyle, msg, formObj, isSuccess)
				}
			});
	   });
	}
   
   function updateApprovalStatusAjax(url){
	   var formObj = $("#listFormId");
	   var actionUrl="${webapp_path}"+url;
	   var jsonData=submitFrm(formObj,actionUrl);
	   var isSuccess = displayDialogOnFormSubmit(jsonData, formObj);
	   
   }
   
   function displayDialogOnFormSubmit(jObject,formObj){
		
       	var isSuccess;
		  if(jObject.returnId>0){
			  
			 dialogType=BootstrapDialog.TYPE_INFO;
			 btnStyle="dialogBoxSuccess";
			 msg="<h3>"+jObject.returnMsg+"</h3>";
			 isSuccess=true;
			 
		  }else{
			
			 msg="<h3>"+jObject.returnMsg+"</h3>";
			 dialogType=BootstrapDialog.TYPE_DANGER;
			 btnStyle="dialogBoxError";
			 isSuccess=false;
		 }
		  
		 showDialogWithPageReload(dialogType,btnStyle,msg,formObj,isSuccess)
	 	return isSuccess;
	}
   
   
   
   </script>
   
               