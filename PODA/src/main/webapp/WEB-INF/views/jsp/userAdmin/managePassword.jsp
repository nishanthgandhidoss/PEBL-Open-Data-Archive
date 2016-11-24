<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="col-md-5">
		<div class="panel panel-primary">

			<div class="panel-heading">Password Management</div>
			
			<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory
				fields</div>

			<div class="panel-body">

				<form:form id="frmId">

					<div class="form-group">
						<label><span class="mandatoryId">*</span>Current Password</label>
						<form:password path="currentPassword"  class="form-control" />
					</div>

					<div class="form-group">
						<label><span class="mandatoryId">*</span>New Password</label>
						<form:password path="password"  class="form-control" />
					</div>

					<div class="form-group">
						<label><span class="mandatoryId">*</span>Confirm Password</label>
						<input type="password"  name="confirmPassword" class="form-control"/>
					</div>
					
					<div class="form-group">
					    <input  type="submit" value="Reset Password" class="submit-btn"   />
				   </div>

				</form:form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var formObj=$('#frmId');
		
		$('#frmId').formValidation({
			framework : 'bootstrap',
			fields : {
				currentPassword: {
					selector: '#currentPassword',
	               	validators: {
	                       notEmpty: {
	                           message: 'Current Password is required'
	                       }
	                   }
	               },
				password: {
					selector: '#password',
	               	validators: {
	                       notEmpty: {
	                           message: 'Password is required'
	                       }
	                   }
	               },
	               confirmPassword: {
	               	validators: {
	                       notEmpty: {
	                           message: 'Confirm Password is Required'
	                       },
	                       identical: {
	                           field: 'password',
	                           message: 'The password and its confirm are not the same'
	                       }
	                   }
	               }
			}
		}).on('success.field.fv', function(e, data) {

			var $parent = data.element.parents('.form-group');
			$parent.removeClass('has-success');

		}).on('success.form.fv', function(e) {

			e.preventDefault();
			trimFormInputs();
			var $form = $(e.target);
			$button = $form.data('formValidation').getSubmitButton();
			var btnType = $button.attr('value');
			var url = "${webapp_path}/resetPassword.sp";
			var jsondata = submitFrm($form, url);
			redirectToLoginIfNotAJsonObject(jsondata);
			var isSuccess = displayDialogOnFormSubmit(jsondata, $form);
         
		   });
	});

	
	
	// ShowDialog function is overridden from the mainjs.jsp 
	// to use location.replace after password is reset
    function showDialog(dialogType,btnStyle,msg,formObj,isSuccess,cmd){
    	
    	
        BootstrapDialog.show({
	    	type   :   dialogType,
	   draggable   :   true,
	    	size   :   BootstrapDialog.SIZE_NORMAL,
            title  :   'Message',
           message :   msg,
          closable :   true,
   closeByBackdrop :   false,
   closeByKeyboard :   false,
  /* onhide          :   function(){
	                   if(isSuccess) 
	                   resetUsingFormId(formId);
	                   loadCustomFunction();
			           },*/
			           
           buttons :   [{
		                label: 'OK',
		                cssClass:btnStyle,
		                action: function(dialog){
			                  dialog.close();
			                  if(isSuccess){
			                  var loginurl = "${webapp_path}/login.sp";
			                  location.replace(loginurl);
			                  }
		                  }  
		               }]
                });
        }
	// Hide the success icon
	// data.element.data('fv.icon').hide();

	// $(e.target)  --> The field element
	// data.fv      --> The FormValidation instance
	// data.field   --> The field name
	// data.element --> The field element
</script>