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



<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
		  Task Type Management
		  <c:if test="${cmd eq editCmd}">
		  	&nbsp;|&nbsp;Update
		  </c:if>
		  <a href="${webapp_path}/admin/listTaskType.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Task Type">
		  <span class="glyphicon glyphicon-th-list pull-right"></span>
		  </a> 
		 </div>
	 	<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div> 
			<div class="panel-body">
	 	    	<form:form id="taskTypeForm">
	 	    		<form:hidden path="id"/>
					<div class="form-group">
						<label><span class="mandatoryId">*</span>Task Type </label>
						<form:input path="taskType" class="form-control" />
					</div>
					
					<div class="form-group">
						<label><span class="mandatoryId">*</span>Task Description </label>
						<form:textarea path="taskTypeDescription" class="form-control" />
					</div>

					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Enabled </label> 
					 	<div class="row">
							  <div class="col-md-1">Yes</div>
							  <div class="col-md-1"><form:radiobutton path="isEnabled" class="form-control" style="padding-left:8px" value="1"/></div>
							  <div class="col-md-1">No</div>
							  <div class="col-md-1"><form:radiobutton path="isEnabled" class="form-control" style="padding-left:8px" value="0"/></div>
				    	 </div>
					</div>
					
					<div class="form-group">
						<c:choose>
							<c:when test="${cmd eq editCmd}">
								<input class="submit-btn" type="submit" id="update-btn" value="Update" />
							</c:when>
							<c:otherwise>
								<input class="submit-btn" type="submit" id="save-btn" value="Submit" />
								<input type="reset" class="submit-btn" value="Reset" style="margin-left: 20px;" onclick="resetForm(this.form)" />
							</c:otherwise>
						</c:choose>
					</div>
			</form:form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var formObj = $('#taskTypeForm');
		formObj.formValidation({
			framework : 'bootstrap',
			fields : {
				taskType : {
					validators : {
						notEmpty : {
							message : 'Task type is required'
						}
					}
				},
				taskTypeDescription: {
					validators : {
						notEmpty : {
							message : 'Task type description is required'
						},
						stringLength: {
	                    	min: 10,
							max: 600,
	                        message: 'Study Description must be between 10 to 600 characters'
	                    }
					}
				},
				isEnabled: {
					validators : {
						notEmpty : {
							message : 'Task type is required'
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
			var $button = $form.data('formValidation').getSubmitButton(),
			btnType = $button.attr('value'), url = null, isReload = null, redirectUrl = null;
			if (btnType == "Update") {
				url = "${webapp_path}/admin/updateTaskType.sp";
				isReload = true;
			} else if (btnType == "Submit") {
				url = "${webapp_path}/admin/saveTaskType.sp";
				isReload = false;
				redirectUrl = "${webapp_path}/admin/listTaskType.sp"
			}
			trimFormInputs();

			var jsondata = submitFrm($form, url);
			redirectToLoginIfNotAJsonObject(jsondata);
			var isSuccess = displayDialogOnFormSubmit(jsondata, $form, isReload, redirectUrl);
			
			if(isSuccess)
	   			 resetFormValidation(formObj);
	   		else
	   			 resetAll(formObj);
		});
	});
</script>