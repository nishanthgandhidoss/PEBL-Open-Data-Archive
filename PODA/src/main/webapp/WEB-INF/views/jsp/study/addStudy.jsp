<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.poda.utils.Constants).ACTION_EDIT"/>

<style type="text/css">

	.mandatoryId {
		color: crimson
	}
	.container {
		 margin: 0 auto;
		 padding: 0 30px;
		 width:60%;
	}
	.panel-body {
    	padding-right: 4%;
    	padding-left: 4%;
	}
	.mandatorytoplabel {
		font-style: italic;
		margin: 10px;
		font-size: 12px
	}
	.panel-heading>a>.glyphicon{ 
		color:#fff;
	}
	.panel-heading{
		font-size:16px;
	    font-weight: bold;
	    font-style:normal
	}
	.text-left{
		text-align:left;
	}
	strong { 
		padding: 0 5px 0 15px;
	}
	.pdtop { 
		padding: 5px 0px; 
	}
	.submit-btn.disabled {
  		opacity: 0.65; 
  		cursor: not-allowed;
	}
	.select2 {
		width:100% ! important;
	}
	.select2-selection {
		height: 32px ! important; 
		padding-left: 6px;
	}
	.col-xs-2 {
		width:19%; /* Don't make more than 19, then it will cause distorition on UI */
	}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("a.tooltipLink").tooltip();
})
</script>

	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
			  Create Study
			  <c:if test="${cmd eq editCmd}">
			  	&nbsp;|&nbsp;Update
			  </c:if>
			  <a href="${webapp_path}/listStudy.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Study">
			  <span class="glyphicon  glyphicon-th-list pull-right"></span>
			  </a> 
			  </div>
			<span class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</span> 
			 <div class="panel-body">
			 
				<form:form id="studyForm">

					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Study Name </label> 
					    <form:input path="studyName" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Study Description </label> 
					    <form:textarea path="studyDesc" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Study License </label> 
					    <form:input path="license" class="form-control"/>
					</div>

					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Public </label> 
					 	<div class="row">
							  <div class="col-md-1">Yes</div>
							  <div class="col-md-1"><form:radiobutton path="isPublic" class="form-control" style="padding-left:8px" value="1"/></div>
							  <div class="col-md-1">No</div>
							  <div class="col-md-1"><form:radiobutton path="isPublic" class="form-control" style="padding-left:8px" value="0"/></div>
				    	 </div>
					</div>
					
					<div class="form-group">
						<label class="control-label">Authors </label> 
					 	<form:input path="authors" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label class="control-label">Publication </label> 
					 	<form:input path="publication" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label class="control-label">Contact </label> 
					 	<form:input path="contact" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label class="control-label">Site Collected </label> 
					 	<form:input path="siteCollected" class="form-control"/>
					</div>
					
					<c:choose>
               			<c:when test="${callFor eq editCmd}">
							<input class="submit-btn" name="commit" id="update-btn" value="Update" type="submit"/>
						</c:when>
						<c:otherwise>
				   			<input class="submit-btn" name="commit" id="save-btn" value="Submit" type="submit"/>
				   			<input type="button" class="submit-btn marginleft10" value="Reset"  onclick="resetForm(this.form)"/> 
				   		</c:otherwise>
				   	</c:choose>
		   		</form:form>
			</div>
		</div>
	</div>
	
<script>
	$(document).ready(function() {
	    $('#studyForm').formValidation({
	        framework: 'bootstrap',
	        icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	studyName: {
	                validators: {
	                    notEmpty: {
	                        message: 'Study Name is required'
	                    }
	                }
	            },
	            studyDesc: {
	            	validators: {
	                    notEmpty: {
	                        message: 'Study Description is required'
	                    }
	            	}
	            },
	            license: {
                    validators: {
                        notEmpty: {
                            message: 'License is required'
                        }
                    }
                }
	        }
	    })
	    .on('success.field.fv', function(e, data) {
            // $(e.target)  --> The field element
            // data.fv      --> The FormValidation instance
            // data.field   --> The field name
            // data.element --> The field element

            var $parent = data.element.parents('.form-group');

            // Remove the has-success class
            $parent.removeClass('has-success');

            // Hide the success icon
            data.element.data('fv.icon').hide();
        }).on('success.form.fv', function(e) {
        	e.preventDefault();
        	var url="${webapp_path}/createStudy.sp";
        	
        	// logic to diff URL for Approve / Update
        	// Form instance
        	var $form = $(e.target),     
            // Get the clicked button
            $button = $form.data('formValidation').getSubmitButton(),
            // You might need to update the "status" field before submitting the form
            $statusField = $form.find('[name="commit"]');
        	var btnId = $button.attr('id');
        	if(btnId == "update-btn") 
        		url = "${webapp_path}/updateStudy.sp";
        	
        	trimFormInputs();
        	//Json data
        	var jsondata=submitFrm($form,url);
        	redirectToLoginIfNotAJsonObject(jsondata);
            var isSuccess=displayDialogOnFormSubmit(jsondata,$form);
            
            if(isSuccess)
      			 resetFormValidation(formObj);
      		 else
      			 resetAll(formObj);
            
        });
	});
</script>