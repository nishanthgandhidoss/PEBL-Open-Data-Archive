<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.erp.utils.Constants).ACTION_EDIT"/>


<script type="text/javascript">

function addRMGradeTxtBx(){
	
	$("#rmFormId").formValidation('revalidateField','rmGradeId');
	var isValid=$("#rmFormId").data('formValidation').isValidField('rmGradeId');
	
	if(isValid)
	  $("#gradeDivId").append(getDynamicText());
	
}



function getDynamicText(){
	
	return	'<div class="input-group" style="margin-top:15px">'+
    '<input type="text" class="form-control rmGrades">'+
    '<span class="input-group-btn">'+
    '<button class="btn btn-default" type="button" onclick="removeRMGradeTxtBx(this)"><i style="color:#dc446e"  class="glyphicon glyphicon-minus"></i></button>'+
    '</span>'+
    '</div>'
}




function removeRMGradeTxtBx(txtObj){
	$(txtObj).closest("div").remove();
}




function formRMGradeArray(){
	
	var rmGradeArray = new Array();
	rmGradeArray.push($("#rmGradeId").val());
	
	$(".rmGrades").each(function(index,obj){
		
		if(obj.value!="")
		rmGradeArray.push(obj.value);
	})
	
	//alert(rmGradeArray);
	$('#rmGradesHidId').val(rmGradeArray);
}



	function loadCustomFunction(){
		
		removeAllElementsWithClassName("rmGrades");
	}


	function resetRmForm(formObj){
		
		resetForm(formObj);
		resetFormValidation(formObj)
		removeAllElementsWithClassName("rmGrades");
	}


   // When edit page loades starts
   var gradeIdsInPageLoad = new Array();
   $(document).ready(function() {
	   
	  var rmGrades=${rmGradesjson} 
	  i=0;
	  $.each(rmGrades,function(id,grade){
		  
		    gradeIdsInPageLoad.push(id);
		    
		    if(i==0){
    		   $("#rmGradeId").val(grade)
    		   $("#rmGradeHiddenId").val(id)
		    }else{
		       $("#gradeDivId").append(createDynamicGradesTxt(id,grade));
		    }
		    i++;
	  })
	  
	 
  });

   function createDynamicGradesTxt(id,grade){
		var grade=$.trim(grade);
		return	'<div class="input-group" style="margin-top:15px">'+
	    '<input type="text" class="form-control rmGrades" value="'+grade+'">'+
	    '<input type="hidden" class="rmGradesIdHiddenValues" value="'+id+'">'+
	    '<span class="input-group-btn">'+
	    '<button class="btn btn-default" type="button" onclick="removeRMGradeTxtBx(this)"><i style="color:#dc446e"  class="glyphicon glyphicon-minus"></i></button>'+
	    '</span>'+
	    '</div>'
	 }

   
   var rmIdsArrayFromForm = new Array();
    
   function formRMGradeArrayForUpdate(){
	   var rmGradesIdArray = new Array();
		var rmg=$("#rmGradeId").val();
		var rmid=$("#rmGradeHiddenId").val();
		
		rmIdsArrayFromForm.push(rmid);
		rmGradesIdArray.push(rmid+'#'+rmg);
		
		$(".rmGrades").each(function(index,obj){
			
			var grade=$(this).val();
			var id=$(this).next('input:hidden').val();
			rmIdsArrayFromForm.push(id);
			
			if(jQuery.type(id) === "undefined"){
			  id=0;
			}
			
			if(grade!="")
			rmGradesIdArray.push(id+'#'+grade);
		});
		
		//alert(rmGradesIdArray);
		$('#rmGradesHidId').val(rmGradesIdArray);
	}
  
   
   function formGradeIdsForDelete(){
	   
	  var gradeIdsForDelete= new Array();
	  
	   $(gradeIdsInPageLoad).each(function(index,gradeId){
		   //alert(gradeId+" in "+rmIdsArrayFromForm);
		  if($.inArray(gradeId, rmIdsArrayFromForm) < 0){
			 // alert("gradeId:"+gradeId);
		      gradeIdsForDelete.push(gradeId);
		  }
	   });
		 
	   $('#rmGradeIdsDeleteHidId').val(gradeIdsForDelete);
	   
	   //alert($('#rmGradeIdsDeleteHidId').val())
   }
   
   // When edit page loades ends


</script>


	<div class="container">

		<div class="col-md-5">
			<div class="panel panel-primary">
			
				<div class="panel-heading">
				  RM Management
				  <c:if test="${cmd eq editCmd}">
				  	&nbsp;|&nbsp;Update
				  </c:if>
				  <a href="${webapp_path}/admin/listRM.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List RM">
				  <span class="glyphicon  glyphicon-th-list pull-right"></span>
				  </a> 
				  </div>
				  
					<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div> 
					
				 	  <div class="panel-body">
				 	  
					      <form:form id="rmFormId">
					      <!--mandatory fields -->
					      <form:hidden path="id"/>
					    <%--   <form:hidden path="cmd"/> --%>
					     <%--  <form:hidden path="formId" value="rmFormId"/> --%>
					      <!--mandatory fields -->
					      <form:hidden path="rmGrades" id="rmGradesHidId"/>
					      <form:hidden path="rmGradeIdForDelete" id="rmGradeIdsDeleteHidId"/> 
					     
						  <div class="form-group">
							<label><span class="mandatoryId">*</span>RM Name </label> 
						 	<form:input path="rmName" class="form-control"/>
						  </div>
						 
						  <div class="form-group">
							<label><span class="mandatoryId">*</span>RM Specification </label> 
						    <form:input path="rmSpecification" class="form-control" id="" />
						  </div>
						
						  <div class="form-group" id="gradeDivId">
							<label><span class="mandatoryId">*</span>RM Grade </label> 
	                          <div class="input-group margintop10">
	                             <input type="text"  class="form-control"  id="rmGradeId"/>
	                             <input type="hidden"  class="rmGradesIdHiddenValues" id="rmGradeHiddenId"/>
	                             <div class="input-group-addon"><i class="glyphicon glyphicon-plus pointercursor appgreen" aria-hidden="true" onclick="addRMGradeTxtBx()"></i></div>
	                          </div>
						  </div>
						  
						  <div class="form-group">
							<label><span class="mandatoryId">*</span>Price Per Kg </label> 
						 	<form:input path="rmPrice" class="form-control"/>
						  </div>
							<c:choose>
		               			<c:when test="${cmd eq editCmd}">
									<input class="submit-btn" type="submit" id="update-btn" value="Update" />
								</c:when>
								<c:otherwise>
						   			<input class="submit-btn"  type="submit" id="save-btn" value="Submit" />
						   			<input type="reset" class="submit-btn marginleft10"  value="Reset" onclick="resetForm(this.form)"/>
						   		</c:otherwise>
					   		</c:choose>
				   		</form:form>
					</div>
			</div>
		</div>
	</div>

<script>
	$(document).ready(function() {
	    $('#rmFormId').formValidation({
	        framework: 'bootstrap',
	        fields: {
	        	rmSpecification: {
	                validators: {
	                    notEmpty: {
	                        message: 'RM Specification is required'
	                    }
	                }
	            },
	        	rmName: {
	                validators: {
	                    notEmpty: {
	                        message: 'RM Name is required'
	                    }
	                }
	            },
	            rmGradeId: {
	            	selector: '#rmGradeId',
	            	validators: {
	                    notEmpty: {
	                        message: 'RM Grade is required'
	                    }
	            	}
	            },
	            rmPrice: {
                	validators: {
                        notEmpty: {
                            message: 'RM Price is required'
                        },
                        numeric: {
                        	message: 'RM Price must be a number'
                        }
                    }
                }
	        }
	    }).on('success.field.fv', function(e, data) {
           
            var $parent = data.element.parents('.form-group');
            $parent.removeClass('has-success');
            
        }).on('success.form.fv', function(e) {
        	
        	e.preventDefault();
        	
        	var $form = $(e.target);
            $button = $form.data('formValidation').getSubmitButton();
            
        	var btnType = $button.attr('value');
        	
        
        	
        	if(btnType == "Update"){ 
        		var url = "${webapp_path}/admin/updateRM.sp";
        		formRMGradeArrayForUpdate();
        		formGradeIdsForDelete();
        		
        	}else if(btnType == "Submit"){	
        		var url="${webapp_path}/admin/saveRM.sp";
        	    formRMGradeArray();
        	}
        	
        	trimFormInputs();
        	
           
            
        	var jsondata=submitFrm($form,url);
        	redirectToLoginIfNotAJsonObject(jsondata);
            var isSuccess=displayDialogOnFormSubmit(jsondata,$form);
            
            if(isSuccess)
   			 resetFormValidation(formObj);
   		    else
   			 resetAll(formObj);
            
           
        });
	});
	
	  // Hide the success icon
    // data.element.data('fv.icon').hide();
	  
	 // $(e.target)  --> The field element
    // data.fv      --> The FormValidation instance
    // data.field   --> The field name
    // data.element --> The field element
</script>