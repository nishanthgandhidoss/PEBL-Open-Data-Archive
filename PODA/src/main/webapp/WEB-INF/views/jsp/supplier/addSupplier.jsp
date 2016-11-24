<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.erp.utils.Constants).ACTION_EDIT"/>

<div class="container">
	<div class="col-md-5">
		<div class="panel panel-primary">
			<div class="panel-heading">
			  Supplier Management
			  <c:if test="${cmd eq editCmd}">
			  	&nbsp;|&nbsp;Update
			  </c:if>
			  <a href="${webapp_path}/admin/listSupplier.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Supplier">
			  <span class="glyphicon glyphicon-th-list pull-right"></span>
			  </a> 
			 </div>
			 
			 
			 
		 	<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div> 
		 	
		 	
				<div class="panel-body">
		 	    	<form:form id="operationForm">
		 	    		<form:hidden path="id"/>
						<div class="form-group">
							<label><span class="mandatoryId">*</span>Supplier Name </label>
							<form:input path="supplierName" class="form-control" />
						</div>
						
						<div class="form-group">
						<label>Address</label> 
					    <form:textarea  path="supplierAddress" class="form-control" 
							 placeholder="Enter Remarks"/>
					    </div>
						
						<div class="form-group">
							<label><span class="mandatoryId">*</span>Contact Name </label>
							<form:input path="contactName" class="form-control" />
						</div>
						
						<div class="form-group">
							<label><span class="mandatoryId">*</span>Phone Number </label>
							<form:input path="phoneNumber" class="form-control" />
						</div>
						
						<div class="form-group">
							<label><span class="mandatoryId">*</span>Email ID </label>
							<form:input type="email" path="email" class="form-control"/>
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
				supplierName : {
					validators : {
						notEmpty : {
							message : 'Supplier Name is required'
						}
					}
				},
				supplierAddress : {
					validators : {
						notEmpty : {
							message : 'Address is required'
						}
					}
				},
				contactName : {
					validators : {
						notEmpty : {
							message : 'Contact Name is required'
						}
					}
				},
				phoneNumber : {
					validators : {
						notEmpty : {
							message : 'Phone Number is required'
						},
                        numeric:{
                        	
                       	 message: 'Enter a valid phone number'
                       	 
                       }
					}
				},
				emailID : {
					validators : {
						notEmpty : {
							message : 'Email ID Name is required'
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
				url = "${webapp_path}/admin/updateSupplier.sp";
			} else if (btnType == "Submit") {
				url = "${webapp_path}/admin/createSupplier.sp";
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