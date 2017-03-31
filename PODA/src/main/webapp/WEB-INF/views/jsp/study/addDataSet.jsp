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
		  <a href="${webapp_path}/admin/listDataSet.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Data Set"> 
		  <span class="glyphicon glyphicon-th-list pull-right"></span>
		  </a> 
		 </div>
	 	<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div> 
			<div class="panel-body">
	 	    	<form:form id="dataSetForm">
	 	    		<form:hidden path="id"/>
	 	    		<form:hidden path="studyId"/>
					<div class="form-group">
						<label><span class="mandatoryId">*</span>Dataset Name </label>
						<form:input path="dataSetName" class="form-control" />
					</div>
					
					<div class="form-group">
						<label><span class="mandatoryId">*</span>Task Type </label>
						<form:select path="taskType" class="form-control empty">
					    	<form:option value="" selected="selected">Select</form:option>
					    	<form:options items="${taskTypeList}" itemLabel="taskType" itemValue="id"/>
					    </form:select>
					</div>

					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Enabled </label> 
					 	<form:input class="form-control" path="file" type="file"/>
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
		var formObj = $('#dataSetForm');
		formObj.formValidation({
			framework : 'bootstrap',
			fields : {
				dataSetName : {
					validators : {
						notEmpty : {
							message : 'Dataset is required'
						}
					}
				},
				taskType: {
					validators : {
						notEmpty : {
							message : 'Task type is required'
						}
					}
				},
				file: {
					validators : {
						notEmpty : {
							message : 'Data file is required'
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
				url = "${webapp_path}/updateDataSet.sp";
				isReload = true;
			} else if (btnType == "Submit") {
				url = "${webapp_path}/saveDataSet.sp";
				isReload = false;
				redirectUrl = "${webapp_path}/listDataSet.sp"
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