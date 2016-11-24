<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.erp.utils.Constants).ACTION_EDIT"/>

<div class="container">
	<div class="col-md-5">
		<div class="panel panel-primary">
			<div class="panel-heading">
			  Operation Management
			  <c:if test="${cmd eq editCmd}">
			  	&nbsp;|&nbsp;Update
			  </c:if>
			  <a href="${webapp_path}/admin/listOperation.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Operation">
			  <span class="glyphicon glyphicon-th-list pull-right"></span>
			  </a> 
			 </div>
		 	<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div> 
				<div class="panel-body">
		 	    	<form:form id="operationForm">
		 	    		<form:hidden path="id"/>
						<div class="form-group">
							<label><span class="mandatoryId">*</span>Operation Name </label>
							<form:input path="operationName" class="form-control" />
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
</div>

<script>
	$(document).ready(function() {
		$('#operationForm').formValidation({
			framework : 'bootstrap',
			fields : {
				operationName : {
					validators : {
						notEmpty : {
							message : 'Operation Name is required'
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
			btnType = $button.attr('value'), url = null;
			if (btnType == "Update") {
				url = "${webapp_path}/admin/updateOperation.sp";
			} else if (btnType == "Submit") {
				url = "${webapp_path}/admin/saveOperation.sp";
			}
			trimFormInputs();

			var jsondata = submitFrm($form, url);
			redirectToLoginIfNotAJsonObject(jsondata);
			var isSuccess = displayDialogOnFormSubmit(jsondata, $form);
			
			if(isSuccess)
	   			 resetFormValidation(formObj);
	   		else
	   			 resetAll(formObj);

			
		});
	});
</script>