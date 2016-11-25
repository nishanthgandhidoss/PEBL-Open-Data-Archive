<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.poda.utils.Constants).ACTION_EDIT"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<link rel="stylesheet"
	href="${webapp_path}/css/commoncss/font-awesome.min.css">

<link rel="stylesheet" href="${webapp_path}/css/commoncss/tabs.css">
<style type="text/css">
.mandatoryId {
	color: crimson
}

.mandatorytoplabel {
	font-style: italic;
	margin: 10px;
	font-size: 12px
}
</style>



<script>
$(document).ready(function(){
	
	$('.form_date').datetimepicker({
	    //language:  'fr',
	    weekStart: 1,
	    todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
	
	$('.selectBoxGroup').select2();
	
	 var myTabs = tabs({
		    el: '#tabs',
		    tabNavigationLinks: '.c-tabs-nav__link',
		    tabContentContainers: '.c-tab'
		  });

	  myTabs.init();
	$("#pwdDivId").hide();
	$("#confirmPwdDivId").hide();
		
 });


function showPasswordTxtbx(){
	
	$("#pwdDivId").toggle();
	$("#confirmPwdDivId").toggle();
	
}

function sameAslocalAddress(){
	
	 if($("#chkBox").is(':checked')){
		
		 $(".localAddress").each(function(localIndex,localaddr){
			
			$(".permanentAddr").each(function(permIndex,permanentaddr){
				
				if(localIndex==permIndex){
				   permanentaddr.value=localaddr.value;
				   return false;
				}
				
			});
			
		});
		
	}else{
		
		 alert("uncheced")
	} 
	   
}


</script>


</head>
<body>
  
<header class="o-header">
	<c:if test="${sessionScope.user.userRole eq 'ROLE_APPADMIN' }">
		<div class="o-container">
			<h4 class="o-header__title" style="font-size:20px;color:#6d6d6d;font-weight:bold">Create User</h4>
			<a href="${webapp_path}/admin/listUsers.sp" class="tooltipLink pull-right bld" data-toggle="tooltip" title="List Users" 
			style="font-size:16px"> List Users 
				<span class="glyphicon  glyphicon-th-list"></span>
			</a> 
		</div>
	</c:if>
 
</header>

  <div class="o-container clearboth">
 <form:form id="userfrmId">
 <form:hidden path="id"/>
    <div class="o-section">
      <div id="tabs" class="c-tabs no-js">
        <div class="c-tabs-nav">
          <a href="#" class="c-tabs-nav__link is-active">
            <i class="fa fa-user"></i>
            <span>User Information</span>
          </a>
        </div>
        <div class="c-tab is-active">
           <div class="c-tab__content">
                
		            <div class="form-group margin5">
						<label><span class="mandatoryId">*</span>First Name </label> 
					 	<form:input path="firstName" class="form-control"/>
					</div>
					
					<div class="form-group margin5">
						<label><span class="mandatoryId">*</span>Last Name </label> 
					 	<form:input path="lastName" class="form-control"/>
					</div>
					
					
					<div class="form-group margin5">
						<label><span class="mandatoryId">*</span>Email </label> 
					 	<form:input path="email" class="form-control"/>
					</div>
					
					<div class="form-group margin5">
						<label><span class="mandatoryId">*</span>Profession</label> 
						<form:select  class="form-control" path="profession" placeholder="Profession">
			            	<form:option value="">--- Please Select ---</form:option>
			            	<form:option value="Professor">Professor</form:option>
			            	<form:option value="Student">Student</form:option>
			            </form:select>
					</div>
					
					<div class="form-group margin5">
							 <label><span class="mandatoryId">*</span>Organization </label> 
							<form:input path="orgName" class="form-control"/>
					</div>
					
					<c:if test="${sessionScope.user.userRole eq 'ROLE_APPADMIN' }">
				        <div class="form-group margin5">
							  <label><span class="mandatoryId">*</span>User Role</label>
							  <form:select path="userRole" class="form-control" style="padding-left:8px">
							  		<form:option value="" selected="selected">Select</form:option>
							  		<form:option value="ROLE_USER">User</form:option>
							  		<form:option value="ROLE_APPADMIN">App Admin</form:option>
						     </form:select>
					    </div>
					    
						<div class="form-group margin5">
							  <label><span class="mandatoryId">*</span>User Enabled</label>
							  <div class="row">
								  <div class="col-md-2">Yes</div>
								  <div class="col-md-2"><form:radiobutton path="enabled" class="form-control" style="padding-left:8px" value="1"/></div>
								  <div class="col-md-2">No</div>
								  <div class="col-md-2"><form:radiobutton path="enabled" class="form-control" style="padding-left:8px" value="0"/></div>
					    	  </div>
					    </div>
					 </c:if>   	
				     
				     <div class="form-group margin5" >
					     <button type="button" class="submit-btn"  value="" onclick="showPasswordTxtbx()">
					     Reset Password <span class="glyphicon glyphicon-repeat"></span>
					     </button>
				     </div>
				     
				     <div class="form-group margin5" id="pwdDivId">
							 <label><span class="mandatoryId">*</span>Password</label> 
							<form:password path="password" class="form-control"/>
					 </div>
					 
					 <div class="form-group margin5" id="confirmPwdDivId">
	                    <label><span class="mandatoryId">*</span>Confirm Password</label> 
	                    <input type="password" class="form-control" id="confirmpwd" name="confirmPassword"/>
	                 </div>
	     
					<div class="form-group margin5" style="margin-top:10px">
					   <c:choose>
	               			<c:when test="${cmd eq editCmd}">
								  <input class="submit-btn" type="submit"  value="Update"/>
							</c:when>
							<c:otherwise>
					   		  <input class="submit-btn" type="submit"  value="Submit"/>
					   		  <input type="reset" class="submit-btn marginleft10"  value="Reset" onclick="resetForm(this.form)"/>
					   		</c:otherwise>
					   </c:choose> 
					     
					   
				   </div>
	      </div>
        </div>
     
        
        </div>
        </div>
        </form:form>

    </div>

<script>
	$(document).ready(function() {
		
		    var formObj=$('#userfrmId');
		
		    $('#dobId').on('changeDate', function(e) {
	            formObj.formValidation('revalidateField', 'dob');
	        });
			
		    $('#dojId').on('changeDate', function(e) {
	           formObj.formValidation('revalidateField', 'doj'); // doj is defined as selector in the formValidation
	        });
		    
		    $('#gender').on('change', function(e) {
		    	formObj.formValidation('revalidateField', 'gender');
	        });
		
	    $('#userfrmId').formValidation({
	        framework: 'bootstrap',
	        fields: {
	        	firstName: {
	                validators: {
	                    notEmpty: {
	                        message: 'First Name is required'
	                    }
	                }
	            },
	        	lastName: {
	                validators: {
	                    notEmpty: {
	                        message: 'Last Name is required'
	                    }
	                }
	            },
	            email: {
	            	validators: {
	                    notEmpty: {
	                        message: 'Email is required'
	                    }
	            	}
	            },
	            profession: {
                    validators: {
                    	notEmpty: {
	                        message: 'Please select a profession'
	                    }
                    }
                },
                orgName: {
	            	validators: {
	                    notEmpty: {
	                        message: 'Univerity is required'
	                    }
	                }
	            },
	            userRole: {
	                    validators: {
	                    	notEmpty:{
	                    		message:"Select user role"
	                    	}
	                    }
	                },
	           password: {
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
        	
        	var $form = $(e.target);
            $button = $form.data('formValidation').getSubmitButton();
            
        	var btnType = $button.attr('value');
        	
        
        	
        	if(btnType == "Update"){ 
        		var url = "${webapp_path}/admin/updateUser.sp";
        		
        	}else if(btnType == "Submit"){	
        		var url="${webapp_path}/admin/createUser.sp";
        	  
        	}
        	
        	trimFormInputs();
        	
           
        	var jsondata=submitFrm($form,url);
        	redirectToLoginIfNotAJsonObject(jsondata);
            var isSuccess=displayDialogOnFormSubmit(jsondata,$form);
            
            if(isSuccess)
   			 resetFormValidation(formObj);
   		    else
   			 resetAll(formObj);
            
            if(btnType == "Update") {
            	hidePasswordTxtBoxes();
                $("#password").val("");
        	    $("#confirmpwd").val("");
            }
            
        });
	});
	
	  // Hide the success icon
    // data.element.data('fv.icon').hide();
	  
	 // $(e.target)  --> The field element
    // data.fv      --> The FormValidation instance
    // data.field   --> The field name
    // data.element --> The field element
    
   
    
</script>


</body>
</html>