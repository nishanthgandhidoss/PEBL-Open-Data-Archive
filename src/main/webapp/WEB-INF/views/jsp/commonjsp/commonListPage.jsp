
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:eval var="approveConstant" expression="T(com.poda.utils.Constants).ACTION_APPROVE"/>
<spring:eval var="rejectConstant" expression="T(com.poda.utils.Constants).ACTION_REJECT"/>
<spring:eval var="editConstant" expression="T(com.poda.utils.Constants).ACTION_EDIT"/>
<spring:eval var="deleteConstant" expression="T(com.poda.utils.Constants).ACTION_DELETE"/>
<spring:eval var="downloadConstant" expression="T(com.poda.utils.Constants).ACTION_DOWNLOAD"/>
<spring:eval var="listDataSetConstant" expression="T(com.poda.utils.Constants).ACTION_LIST_DATASET"/>

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
 
#listTableID_wrapper{
    clear:both;
}
	  
.input-group-addon{
    background-color: #fff !important;
}

</style>

<script>

$(document).ready(function() {
	$('#listTableID tfoot th').each(function() {
	    var title = $(this).text();
	    if(title!=="Actions")
		    $(this).html('<input class="tooltipLink" data-toggle="tooltip" type="text" style="max-width:200px;border: 1px solid #ccc;" placeholder="'+title+'" title="Search '+title+'"/>');
	});
	var table = $('#listTableID').DataTable({"autoWidth": false});
	table.columns().every(function() {
	    var that = this;
	    $('input', this.footer()).on('keyup change', function() {
	        if (that.search() !== this.value) {
	            that
	                .search(this.value)
	                .draw();
	        }
	    });
	});
	  
	  
	$(".tooltipLink").tooltip();
	  
	$('<div class="pull-right appblue golden" style="margin-bottom:10px; padding: 7px 0;"><a href="${webapp_path}/${ADD_URL[0]}" class="white bld padding10">${ADD_URL[1]}</a></div>').insertBefore("#listTableID_wrapper"); 
});

</script>


<title>${LIST_PAGE_TITLE}</title>


<c:if test="${fn:length(OBJECT_LIST)>0}">
<head><base><title>${addTitle}</title></head>
<div class="container-fluid">
<form id="listFormId">

<input type="hidden" id="hiddenObjId" name="id"/>
<input type="hidden" id="hiddenObjCreatedBy" name="createdBy"/>
<input type="hidden" id="hiddenObjStudyName" name="studyName"/>
<div class="center"><h4>${LIST_HEADER}</h4></div>

   <table id="listTableID" class="table  table-striped table-bordered dt-responsive compact nowrap" cellspacing="0" width="100%">
        <thead>
            <tr class="headerCss">
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
		             
		             <!-- Download -->
		               <c:if test="${actionMp.key==downloadConstant}">
		               		<a href="javascript:void(0)"  onclick="downloadFile(${obj.id},'${obj.createdBy}','${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Download"><span style="color:#108f3f;padding-left:10px" class="glyphicon glyphicon-download-alt"></span></a>
		               </c:if>
		            
		            <!-- list DataSet -->
		               <c:if test="${actionMp.key==listDataSetConstant}">
		               		<a href="javascript:void(0)"  onclick="listDataSet(${obj.id},'${obj.studyName}','${webapp_path}${actionMp.value}')" class="tooltipLink" data-toggle="tooltip" title="Dataset List"><span style="color:#a5520b;padding-left:10px" class="glyphicon glyphicon-list"></span></a>
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
					showDialog(dialogType, btnStyle, msg, formObj, isSuccess, true, null)
				}
			});
	   });
	}
   
   function downloadFile(id, createdBy, url) {
	   $("#hiddenObjId").val(id);
	   $("#hiddenObjCreatedBy").val(createdBy);
	   $("#listFormId").attr('action', url);
	   $("#listFormId").attr('method', "POST");
	   var jsonData = $("#listFormId").submit();
   }
   
   function listDataSet(id, studyName, url) {
	   $("#hiddenObjId").val(id);
	   $("#hiddenObjStudyName").val(studyName);
	   $("#hiddenObjCreatedBy, #listTableID_length").remove();
	   $("#listFormId").attr('action', url);
	   $("#listFromId").attr('method', "POST");
	   $("#listFormId").submit();
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
   
               