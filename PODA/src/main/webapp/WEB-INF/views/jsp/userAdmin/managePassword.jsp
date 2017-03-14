<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style type="text/css">

	.mandatoryId {
		color: crimson
	}
	.container {
		 margin: 0 auto;
		 padding: 0 30px;
		 width:35%;
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
			var url = "${webapp_path}/resetPassword.sp", redirectUrl = "${webapp_path}/home.sp";
			var jsondata = submitFrm($form, url);
			redirectToLoginIfNotAJsonObject(jsondata);
			var isSuccess = displayDialogOnFormSubmit(jsondata, $form, false, redirectUrl);
         
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