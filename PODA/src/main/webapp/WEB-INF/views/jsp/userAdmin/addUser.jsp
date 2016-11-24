<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.erp.utils.Constants).ACTION_EDIT"/>
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
	  
		<c:if test="${cmd eq editCmd}">	// only for Edit page to display the date
		copyDateValueFromSourceToDestId("#dobHiddenId","#dobId"); //("#souceId","#destinationId")
		copyDateValueFromSourceToDestId("#dateOfJoiningHidId","#dojId"); 
		hidePasswordTxtBoxes();
		</c:if> 
 });


function hidePasswordTxtBoxes(){
	
	$("#pwdDivId").hide();
	$("#confirmPwdDivId").hide();
	
}



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

  <div class="o-container">
    <h4 class="o-header__title" style="font-size:20px;color:#6d6d6d;font-weight:bold">Create User</h4>
     <a href="${webapp_path}/admin/listUsers.sp" class="tooltipLink pull-right bld" data-toggle="tooltip" title="List Users" 
      style="font-size:16px"> List Users 
	<span class="glyphicon  glyphicon-th-list"></span>
	</a> 
  </div>
 
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
           
          
          
         <!--  <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-user"></i>
            <span>User Settings</span>
          </a> -->
         <!--  <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-heart"></i>
            <span></span>
          </a>
          <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-calendar"></i>
            <span>Calendar</span>
          </a>
          <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-cog"></i>
            <span>Settings</span>
          </a> -->
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
									<label><span class="mandatoryId">*</span>Father's Name </label> 
								 	<form:input path="fatherName" class="form-control"/>
					</div>
					
					
					
					<div class="form-group margin5">
						  <label><span class="mandatoryId">*</span>Gender</label>
						  <form:select  path="gender" class="form-control" style="padding-left:8px">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:option value="Male">Male</form:option>
						  		<form:option value="Female">Female</form:option>
					     </form:select>
				     </div>
					
					<div class="form-group margin5" >
						<label><span class="mandatoryId">*</span>Date of Birth</label>
						<div class="input-group">
							<input type="text" id="dobId" class="form-control form_date" readonly data-date-format="dd-MM-yyyy" 
							data-link-field="dobHiddenId"  data-link-format="yyyy-mm-dd"/>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
							<form:hidden path="dob" id="dobHiddenId"/>
						</div>
				    </div>
					
					<div class="form-group margin5">
							 <label><span class="mandatoryId">*</span>Age</label> 
							<form:input path="age" class="form-control"/>
					</div>
					
					<div class="form-group margin5">
							 <label><span class="mandatoryId">*</span>Contact</label> 
							<form:input path="contact" class="form-control"/>
					</div>
					
				   <%-- <div class="form-group">
			        <label><span class="mandatoryId">*</span>Local Address</label>
				    <input type="text" class="form-control margin5 localAddress" id="" placeholder="Line 1"/>
					<input class="form-control margin5 localAddress" id=""  placeholder="Line 2"/>
					<input class="form-control margin5 localAddress" id="" placeholder="City"/>
					
					<select class="form-control margin5 localAddress" style="padding-left:8px">
					<option value="0" selected="selected">State</option>
					<option value="Andaman and Nicobar Islands">Andaman and Nicobar</option>
					<option value="Andhra Pradesh">Andhra Pradesh</option>
					<option value="Arunachal Pradesh">Arunachal Pradesh</option>
					<option value="Assam">Assam</option>
					<option value="Bihar">Bihar</option>
					<option value="Chandigarh">Chandigarh</option>
					<option value="Chhattisgarh">Chhattisgarh</option>
					<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
					<option value="Daman and Diu">Daman and Diu</option>
					<option value="Delhi">Delhi</option><option value="Goa">Goa</option>
					<option value="Gujarat">Gujarat</option>
					<option value="Haryana">Haryana</option>
					<option value="Himachal Pradesh">Himachal Pradesh</option>
					<option value="Jammu and Kashmir">Jammu and Kashmir</option>
					<option value="Jharkhand">Jharkhand</option>
					<option value="Karnataka">Karnataka</option>
					<option value="Kerala">Kerala</option>
					<option value="Lakshadweep">Lakshadweep</option>
					<option value="Madhya Pradesh">Madhya Pradesh</option>
					<option value="Maharashtra">Maharashtra</option>
					<option value="Manipur">Manipur</option>
					<option value="Meghalaya">Meghalaya</option>
					<option value="Mizoram">Mizoram</option>
					<option value="Nagaland">Nagaland</option>
					<option value="Odisha">Odisha</option>
					<option value="Pondicherry">Pondicherry</option>
					<option value="Punjab">Punjab</option>
					<option value="Rajasthan">Rajasthan</option>
					<option value="Sikkim">Sikkim</option>
					<option value="Tamil Nadu">Tamil Nadu</option>
					<option value="Telangana">Telangana</option>
					<option value="Tripura">Tripura</option>
					<option value="Uttar Pradesh">Uttar Pradesh</option>
					<option value="Uttrakhand">Uttarakhand</option>
					<option value="West Bengal">West Bengal</option>
					</select>
					
					<select class="form-control margin5 localAddress" style="padding-left:8px">
					<option value="India" selected="selected">India</option>
					</select>
					<form:hidden path="localAddress" id="localAddressHidId"/>
			       </div>
			      
			      
			       <div class="margin5">
				    <input type="checkbox" id="chkBox" onclick="sameAslocalAddress()"/>&nbspSame As Local Address
			      </div>
			      
				   <div class="form-group">
			        <label><span class="mandatoryId">*</span>Permanent Address</label>
				    <input type="text" class="form-control margin5 permanentAddr" id="" placeholder="Line 1"/>
					<input class="form-control margin5 permanentAddr" id=""  placeholder="Line 2"/>
					<input class="form-control margin5 permanentAddr" id="" placeholder="City"/>
					
					<select class="form-control margin5 permanentAddr" style="padding-left:8px">
					<option value="0" selected="selected">State</option>
					<option value="Andaman and Nicobar Islands">Andaman and Nicobar</option>
					<option value="Andhra Pradesh">Andhra Pradesh</option>
					<option value="Arunachal Pradesh">Arunachal Pradesh</option>
					<option value="Assam">Assam</option>
					<option value="Bihar">Bihar</option>
					<option value="Chandigarh">Chandigarh</option>
					<option value="Chhattisgarh">Chhattisgarh</option>
					<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
					<option value="Daman and Diu">Daman and Diu</option>
					<option value="Delhi">Delhi</option><option value="Goa">Goa</option>
					<option value="Gujarat">Gujarat</option>
					<option value="Haryana">Haryana</option>
					<option value="Himachal Pradesh">Himachal Pradesh</option>
					<option value="Jammu and Kashmir">Jammu and Kashmir</option>
					<option value="Jharkhand">Jharkhand</option>
					<option value="Karnataka">Karnataka</option>
					<option value="Kerala">Kerala</option>
					<option value="Lakshadweep">Lakshadweep</option>
					<option value="Madhya Pradesh">Madhya Pradesh</option>
					<option value="Maharashtra">Maharashtra</option>
					<option value="Manipur">Manipur</option>
					<option value="Meghalaya">Meghalaya</option>
					<option value="Mizoram">Mizoram</option>
					<option value="Nagaland">Nagaland</option>
					<option value="Odisha">Odisha</option>
					<option value="Pondicherry">Pondicherry</option>
					<option value="Punjab">Punjab</option>
					<option value="Rajasthan">Rajasthan</option>
					<option value="Sikkim">Sikkim</option>
					<option value="Tamil Nadu">Tamil Nadu</option>
					<option value="Telangana">Telangana</option>
					<option value="Tripura">Tripura</option>
					<option value="Uttar Pradesh">Uttar Pradesh</option>
					<option value="Uttrakhand">Uttarakhand</option>
					<option value="West Bengal">West Bengal</option>
					</select>
					
					<select class="form-control margin5 permanentAddr" style="padding-left:8px">
					<option value="India" selected="selected">India</option>
					</select>
					
						<form:hidden path="permanentAddress" id="permAddressHidId"/>
			       </div> --%>
			       
			        <div class="form-group margin5">
						<label><span class="mandatoryId">*</span>Date of Joining</label>
						<div class="input-group">
							<input type="text" id="dojId" class="form-control form_date" readonly data-date-format="dd-MM-yyyy" 
							data-link-field="dateOfJoiningHidId"  data-link-format="yyyy-mm-dd"/>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
							<form:hidden path="dateOfJoining" id="dateOfJoiningHidId"/>
						</div>
				    </div>
			        
			        <div class="form-group margin5">
						  <label><span class="mandatoryId">*</span>Department</label>
						  <form:select path="departmentId" class="form-control selectBoxGroup" style="padding-left:8px">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${departmentList}" itemLabel="departmentName" itemValue="id"/>
						  </form:select>
				    </div>
				    
			        <div class="form-group margin5">
						  <label><span class="mandatoryId">*</span>User Role</label>
						  <form:select path="userRole" class="form-control" style="padding-left:8px">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:option value="ROLE_USER">User</form:option>
						  		<form:option value="ROLE_ADMIN">Admin</form:option>
						  		<form:option value="ROLE_APPROVER">Approver</form:option>
						  		<c:if test="${sessionScope.user.userRole eq 'App Admin'}">
						  			<form:option value="ROLE_APPADMIN">App Admin</form:option>
						  		</c:if>
					     </form:select>
				    </div>
				    
				  
				     <c:if test="${cmd eq editCmd}">
				     	<div class="form-group margin5">
							  <label><span class="mandatoryId">*</span>User Enabled</label>
							  <div class="row">
								  <div class="col-md-2">Yes</div>
								  <div class="col-md-2"><form:radiobutton path="enabled" class="form-control" style="padding-left:8px" value="1"/></div>
								  <div class="col-md-2">No</div>
								  <div class="col-md-2"><form:radiobutton path="enabled" class="form-control" style="padding-left:8px" value="0"/></div>
					    	  </div>
					    </div>	
					      <div class="form-group margin5" >
						     <button type="button" class="submit-btn"  value="" onclick="showPasswordTxtbx()">
						     Reset Password <span class="glyphicon glyphicon-repeat"></span>
						     </button>
					     </div>
				     </c:if>
				     
				     
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
     
			
        
        
        <!-- <div class="c-tab">
          <div class="c-tab__content">
            <div class="form-group email required user_basic_email">
				<label class="email required control-label" for="user_basic_email"><span
					title="required" class="mandatoryId">*</span>Local Address </label> 
			    <input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="City"/>
				<input class="string email required form-control" id=""
					 placeholder="State"/>
				<input class="string email required form-control" id=""
					 placeholder="Country"/>
			</div>
			<div>
				<input type="checkbox"/>&nbspSame As Local Address
			</div>
			<div class="form-group email required user_basic_email">
				<label class="email required control-label" for="user_basic_email"><span
					title="required" class="mandatoryId">*</span>Permanent Address </label> 
			    <input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="City"/>
				<input class="string email required form-control" id=""
					 placeholder="State"/>
				<input class="string email required form-control" id=""
					 placeholder="Country"/>
			</div>
          </div>
        </div> -->
        
        
        <div class="c-tab">
          <!-- <div class="c-tab__content">
            					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Xth </label> 
					    <input 
							class="string email required form-control" id=""
							 placeholder="Enter Experience"/>
					</div>
					
					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Date of Joining </label> 
					    <input
							class="string email required form-control" id=""
							 placeholder="Enter Date of Joining"/>
					</div>
					
					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Department </label> 
					    <input
							class="string email required form-control" id=""
							 placeholder="Enter Department"/>
					</div>
					
					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Reference </label> 
					    <input 
							class="string email required form-control" id=""
							 placeholder="Enter Reference"/>
					</div>
					<input class="btn btn-default" name="commit" value="Submit"
							type="submit"/>
          </div> -->
        </div> 
        </div>
        </div>
        </form:form>

    </div>
   
        
        <!-- <div class="c-tab">
          <div class="c-tab__content">
            <h2>Stay Busy</h2>
            <p>Calendar ipsum dolor sit amet, consectetur adipisicing elit. Ipsam quo minus voluptate unde tempore eveniet consequuntur in, quod animi libero rem similique pariatur quos, et eum nisi ducimus, architecto voluptatibus!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto aspernatur natus dolorem fuga cumque optio saepe corrupti earum. Ipsam quaerat asperiores similique omnis excepturi temporibus ab eum magnam ipsa, odio.</p>
          </div>
        </div>
        <div class="c-tab">
          <div class="c-tab__content">
            <h2>Change It Up</h2>
            <p>Settings ipsum dolor sit amet, consectetur adipisicing elit. Ipsam quo minus voluptate unde tempore eveniet consequuntur in, quod animi libero rem similique pariatur quos, et eum nisi ducimus, architecto voluptatibus!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto aspernatur natus dolorem fuga cumque optio saepe corrupti earum. Ipsam quaerat asperiores similique omnis excepturi temporibus ab eum magnam ipsa, odio.</p>
          </div> -->
          


<!-- <script src="js/src/tabs.js"></script> -->
<!-- <script>
  var myTabs = tabs({
    el: '#tabs',
    tabNavigationLinks: '.c-tabs-nav__link',
    tabContentContainers: '.c-tab'
  });

  myTabs.init();
</script> -->


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
	            fatherName: {
	            	validators: {
	                    notEmpty: {
	                        message: 'Father Name is required'
	                    }
	            	}
	            },
	            gender: {
                    validators: {
                    	notEmpty: {
	                        message: 'Please select Gender'
	                    }
                        /* callback: {
                            message: 'Please select Gender',
                            callback: function (value, validator, $field) {
                            	      return parseInt(value)>0
                            }
                        } */
                    }
                },
	             dob: {
	            	selector: '#dobId',
	                validators: {
	                    notEmpty: {
	                        message: 'Choose date of birth'
	                    }
	                }
	            },
	            age: {
	                validators: {
	                    notEmpty: {
	                        message: 'Age is required'
	                    },
	                    numeric:{
	                    	message:'Age should be a number'
	                    	
	                    },
	                    greaterThan:{
	                    	value:0,
	                    	message:"Age cannot be zero or negative"
	                    }/* ,
	                    callback: {
                            message: 'Age should be greater than 18',
                            callback: function (value, validator, $field) {
                            	      return parseInt(value)>15
                            }
                        } */
	                }
	             },
	            contact:{
		                validators: {
		                    notEmpty: {
		                        message:'Contact is required'
		                    },
		                    numeric:{
		                    	message:'Contact should be a number'
			                    	
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
	     departmentId: {
	                    validators: {
	                    	notEmpty:{
	                    		message:"Select department"
	                    	}
	                    }
	                },
	             doj: {
	            	selector:"#dojId", 
	                validators: {
	                    notEmpty: {
	                        message: 'Choose date of joining'
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