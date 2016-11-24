<%@ page isErrorPage="true" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
 
    <link rel="stylesheet prefetch" href="${webapp_path}/css/commoncss/reset.css">
    <!-- <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'> -->
    <link rel='stylesheet prefetch' href="${webapp_path}/css/commoncss/font-awesome.min.css">
    <link rel="stylesheet prefetch" href="${webapp_path}/css/login.css"> 


<style>


.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    /* font-family: Montserrat; */
    padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    background: #fff url('${webapp_path}/images/loginuser.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#username:focus {
    background: #fff url('${webapp_path}/images/loginuser.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#password {
    background: #fff url('${webapp_path}/images/loginlock.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#password:focus {
    background: #fff url('${webapp_path}/images/loginlock.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #3796ba;
}

.tooltip{

  opacity:1 !important;
  margin-left:5px
}

html {
    overflow-y: scroll;
} 

 /* Tooltip */
  .tooltipLink + .tooltip > .tooltip-inner {
      background: #33b5e5; 
      color: #FFFFFF; 
      border: 1px solid #33b5e5; 
      padding: 10px;
      font-size: 14px;
      width:100px;
      opacity:1
  }
  /* Tooltip on top */
  .tooltipLink + .tooltip.top > .tooltip-arrow {
      border-top: 5px solid green;
  }
  /* Tooltip on bottom */
  .tooltipLink + .tooltip.bottom > .tooltip-arrow {
      border-bottom: 5px solid blue;
  }
  /* Tooltip on left */
  .tooltipLink + .tooltip.left > .tooltip-arrow {
      border-left: 5px solid red;
  }
  /* Tooltip on right */
  .tooltipLink + .tooltip.right > .tooltip-arrow {
      border-right: 5px solid #33b5e5;
  }

	.loginSection {
		overflow: auto;
		float: right;
    	padding-right: 20px;
    	margin-right: 60px;
	}
	
	#loginImage {
	    margin: 180px 0 0 35px;
	    width: 499px;
	    height: 250px;
	}
</style>
<script>

$(document).ready(function() {
	
	$(".tooltipLink").tooltip();
	
 });

  function clearMsg(){
	
	$(".msg").hide();
  }


function capitalize(textboxid, str) {


    if (str && str.length >= 1)
    {       
        var firstChar = str.charAt(0);
        var remainingStr = str.slice(1);
        str = firstChar.toUpperCase() + remainingStr;
    }
    document.getElementById(textboxid).value = str;
}

function toggleloginRegisterToolTip(){
	
	var txt=$(".tooltip").text();
	clearMsg();
	if(txt=="REGISTER"){
		$(".tooltip").text("LOGIN");
		$(".tooltip").css("right","-50px");
		$(".cta").css("display","none");
	}else{
		$(".tooltip").text("REGISTER");
		$(".tooltip").css("right","-70px");
		$(".cta").css("display","block");
	}
}
   


</script>

<c:if test="${not empty msg}">
	<div class="alert alert-success msg">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<div><center>${msg}</center></div>
	</div>
</c:if>

<c:if test="${not empty error}">
	<div class="alert alert-danger msg">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<center>${error}</center>
	</div>
</c:if>

	
<div class="section">
    <div class="navbar-brand loginImage">
        <img id="loginImage" src="/easyerpv9/images/tech_logo.jpg">
    </div>
</div>

<div class="section loginSection">
	<div class="pen-title">
	  	<h1>PODA</h1><span>PEBL Open Data Archive  <i class='glyphicon glyphicon-thumbs-up'></i></span>
	</div>
	
	<!-- Form Module-->
	  <div class="module form-module" style="margin-top:0%"> <!-- top,right,bottom,left -->
	  
	  <div class="toggle" style="float: left; position: relative;" onclick="resetForm('#regFormId');toggleloginRegisterToolTip()">
	  	<i class="fa fa-times fa-pencil"></i>
	    <div class="tooltip">REGISTER</div>
	  </div>
	 
	 <div class="form login-block" style="padding-bottom:10px">
	   <h2 style="font-weight: bold">Login to your account</h2>
	   
	  <%--  <form id="frmID" action="${webapp_path}/auth/login_check?targetUrl=${targetUrl}" method="POST"> --%>
	    <form id="frmID" action="${webapp_path}/auth/login_check?targetUrl=${targetUrl}"  method="POST">
	     <input type="text" placeholder="Username" id="username" name="loginusername" oninput="clearMsg()"/>
	     <input type="password" placeholder="Password" id="password" name="loginpassword" oninput="clearMsg()"/>
	    <%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	     <input type="submit"  class="submit-btn" value="LOGIN" style="padding:5px">
	   </form>
	 </div>
	 
	 
	<div class="form" style="padding-bottom:20%">
	   <h2>Sign Up</h2>
	 <form:form id="regFormId">
	    
	    <div class="form-group">
	        <div class="input-group">
	            <div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
	            <form:input  class="form-control" path="firstName" placeholder="First Name"/>
	        </div>
	    </div>
	    
	     <div class="form-group">
	        <div class="input-group">
	          <div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
	          <form:input  class="form-control" path="lastName" placeholder="Last Name" />
	        </div>
	    </div>
	    
	    <div class="form-group">
	        <div class="input-group">
	            <div class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></div>
	            <form:input type="email" class="form-control" path="email" placeholder="Email"/>
	        </div>
	    </div>
	    
	     <div class="form-group">
	        <div class="input-group">
	            <div class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></div>
	            <form:password class="form-control" path="password" placeholder="Password"/>
	        </div>
	    </div>
	    
	    <div class="form-group">
	        <div class="input-group">
	           <div class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></div>
	            <input type="password" class="form-control" name="confirmPasword" placeholder="Confirm password" />
	        </div>
	    </div>
	    
	    <div class="form-group">
	        <div class="input-group">
	           <div class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></div>
	            <form:select  class="form-control" path="profession" placeholder="Profession">
	            	<form:option value="">--- Please Select ---</form:option>
	            	<form:option value="Professor">Professor</form:option>
	            	<form:option value="Student">Student</form:option>
	            </form:select>
	        </div>
	    </div>	    
	    
	    <div class="form-group">
	        <div class="input-group">
	           <div class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></div>
	            <form:input  class="form-control" path="orgName" placeholder="University Name" />
	        </div>
	    </div>
	    
	    <div class="form-group">
	       <div class="col-sm-6">
	            <input type="submit" class="submit-btn" value="Register"/>
	         </div>
	
	          <div class="col-sm-6">
	           <input type="Reset" class="submit-btn" value="Reset" onclick="resetForm(this.form)"/>
	          </div>
	              
	       </div>
	       
	 </form:form>
	  
	    </div>
	 </div>
</div>
  
<script src="${webapp_path}/js/login.js"></script>

<!-- http://formvalidation.io/examples/ajax-submit/ -->

 <script>
	$(document).ready(function() {
	   	var formObj = $('#regFormId');
		
		formObj.formValidation({
	        framework: 'bootstrap',
	        icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon ',// removing glyphicon-remove to disable x symbol in text box
	            validating: 'glyphicon glyphicon-refresh'
	        },
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
                            message: 'Email Address is required'
                        }
                    }
                },
                password: {
                	validators: {
                        notEmpty: {
                            message: 'Password address is required'
                        },
                        length: {
                        	min: 8,
                        	message: 'Password length should be minimum 8'
                        }
                    }
                },
                confirmPassword: {
                	validators: {
                		notEmpty: {
                			message: 'Re-enter the password'
                		},
                		identical: {
	                        field: 'regPassword',
	                        message: 'The password and its confirm are not the same'
	                    }
                	}
                },
                profession: {
                	validators: {
                        notEmpty: {
                            message: 'Profession is required'
                        }
                	}
                },
                orgName: {
                	validators: {
                        notEmpty: {
                            message: 'University Name is required'
                        }
                    }
                }
	        }
		})
	    .on('success.field.fv', function(e, data) {
           
            var $parent = data.element.parents('.form-group');

            // Remove the has-success class
            $parent.removeClass('has-success');

            // Hide the success icon
            data.element.data('fv.icon').hide();
        })
        .on('success.form.fv', function(e){
        	e.preventDefault();
         	var $form = $(e.target);
             $button = $form.data('formValidation').getSubmitButton();
            var btnType = $button.attr('value');
         	if(btnType == "Register")
         		var url = "${webapp_path}/registerUser.sp";
         	trimFormInputs();
        	var jsondata=submitFrm(this,url);
     		redirectToLoginIfNotAJsonObject(jsondata);
     		var isSuccess= displayDialogOnFormSubmit(jsondata,formObj);
     		if(isSuccess) {
     			 resetFormValidation(formObj);
     		}
     		 else
     			 resetAll(formObj);
            });
	});
</script> 


