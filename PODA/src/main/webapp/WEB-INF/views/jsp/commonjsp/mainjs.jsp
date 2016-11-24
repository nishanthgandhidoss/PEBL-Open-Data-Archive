<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<spring:eval var="jkey" expression="T(com.erp.utils.Constants).JSON_KEY"/>
<script src="${webapp_path}/js/commonjs/jquery1.12.0.min.js"></script>
<script src="${webapp_path}/js/commonjs/bootstrap3.3.6.min.js"></script>
<script src="${webapp_path}/js/commonjs/jquery.dataTables.min.js"></script> 
<script src="${webapp_path}/js/commonjs/dataTables.bootstrap.min.js"></script>
<script src="${webapp_path}/js/commonjs/dataTables.responsive.min.js"></script>
<script src="${webapp_path}/js/commonjs/responsive.bootstrap.min.js"></script>
<script src="${webapp_path}/js/commonjs/dataTables.fixedColumns.js"></script> 
<%-- <script src="${webapp_path}/js/commonjs/stackable.js"></script> --%>
<%-- <script src="${webapp_path}/js/commonjs/bootstrap-datepicker1.3.0.min.js"></script> --%>
<script src="${webapp_path}/js/commonjs/bootstrap-datetimepicker.min.js"></script>

<script src="${webapp_path}/js/commonjs/formValidation.min.js"></script>
<script src="${webapp_path}/js/commonjs/bootstrapFormValidation.min.js"></script>
<script src="${webapp_path}/js/commonjs/bootstrap-dialog.js"></script>
<script src="${webapp_path}/js/commonjs/tabs.js"></script>
<script src="${webapp_path}/js/commonjs/select2.min.js"></script>

<script>


		function submitFrm(formObj,url){
			
		     //jQuery.ajaxSetup({async:true});  // making it back asynchronous
		   // var formObj="#"+formId;
		    var frmdata=$(formObj).serialize();
		    //alert(frmdata)
		    var jsonData;
		     
		        $.ajax({
			        type: "POST",
			        url: url,
			        data:frmdata,
			        cache: false,
			        async: false,
			        success: function (data) {
			        	jsonData=data;
			        }
		        });
		    
		    return jsonData;
		  }

    
	     function displayDialogOnFormSubmit(jObject,formObj){
		
		          var isSuccess;
				  if(jObject.returnId>0){
					  
					 dialogType=BootstrapDialog.TYPE_INFO;
					 btnStyle="dialogBoxSuccess";
					 msg="<h3>"+jObject.returnMsg+"</h3>";
					 isSuccess=true;
					 
				  }else{
					
					 msg="<h4>"+jObject.returnMsg+"</h4>";
					 dialogType=BootstrapDialog.TYPE_DANGER;
					 btnStyle="dialogBoxError";
					 isSuccess=false;
				 }
				  
			showDialog(dialogType,btnStyle,msg,formObj,isSuccess)
            return isSuccess;
          }

	
	  /* Dialog box size
	   BootstrapDialog.SIZE_NORMAL,BootstrapDialog.SIZE_SMALL,BootstrapDialog.SIZE_WIDE,BootstrapDialog.SIZE_LARGE */
	   
	   /* various types of dialog box
    BootstrapDialog.TYPE_DEFAULT 
    BootstrapDialog.TYPE_INFO, 
    BootstrapDialog.TYPE_PRIMARY, 
    BootstrapDialog.TYPE_SUCCESS, 
    BootstrapDialog.TYPE_WARNING, 
    BootstrapDialog.TYPE_DANGER; */
	
    
    
    function displayDialogWithJsondata(jsondata,jsonKey,formObj){
		var isSuccess;
		$.each(jsondata, function(key, jObject) {
			if (key == jsonKey && jObject.returnId > 0) {
				dialogType = BootstrapDialog.TYPE_INFO;
				btnStyle = "dialogBoxSuccess";
				msg = jObject.returnMsg;
				isSuccess = true;
			} else {
				msg = "<h4>" + jObject.returnMsg + "</h4>";
				dialogType = BootstrapDialog.TYPE_DANGER;
				btnStyle = "dialogBoxError";
				isSuccess = false;
			}
			
			showDialog(dialogType, btnStyle, msg, formObj, isSuccess)
		});
		return isSuccess;
	}
    

    
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
			                  loadCustomFunction();
		                  }  
		               }]
                });
        }
    
function showDialogWithPageReload(dialogType,btnStyle,msg,formObj,isSuccess,cmd){

	BootstrapDialog.show({
    	type   :   dialogType,
   draggable   :   true,
    	size   :   BootstrapDialog.SIZE_NORMAL,
          title  :   'Message',
         message :   msg,
        closable :   true,
 closeByBackdrop :   false,
 closeByKeyboard :   false,
         buttons :   [{
	                label: 'OK',
	                cssClass:btnStyle,
	                action: function(dialog){
		                  dialog.close();
		                  location.reload();
	                  }  
	               }]
              });
}
    

  function resetUsingFormId(formId){
	
	var formObj=$("#"+formId);
	formObj[0].reset();
 }
  
  
  function resetForm(formObj){
		
		var formObj=$(formObj);
		formObj[0].reset();
		resetFormValidation(formObj)
		$(".selectBoxGroup").each(function() {
			var obj = $(this);
			var id = $(obj).attr("id");
			var text = $(this).find('option:selected').text();
			$('#select2-' + id + '-container').text(text);
		});
 }
  
  function resetAll(formObj){
	  
	  
	    var formObj=$(formObj);
		formObj.data('formValidation').resetForm();
		formObj[0].reset();
  }
  
  function resetFormValidation(formObj){
		
		var formObj=$(formObj);
		formObj.data('formValidation').resetForm();
}

  function removeAllElementsWithClassName(className){
	 
	  $("."+className).each(function(){
		  $(this).closest("div").remove();
	   });
   } 	  

  function loadCustomFunction(){
		
		//alert("loadedCustomFunction")
  }
  
  
  
  function getAge(dateString){

      var today = new Date();
      var birthDate = new Date(dateString);
      var age = today.getFullYear() - birthDate.getFullYear();
      var m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) 
      {
          age--;
      }
      return age;
  }
  
  
  $(document).ready(function(){
		
		$(".tooltipLink").tooltip();
		$('.selectBoxGroup').select2();
	})
	
	function trimFormInputs(){
	  
	  $("input, textarea").each(function(){
		   $(this).val(jQuery.trim($(this).val()));
     });	
	  
  }
  
  
  function copyDateValueFromSourceToDestId(sourceId,destinationId){
		
		 hidDate=$(sourceId).val();
		 var dateval=hidDate.split("-");
		 var setDate=dateval[2]+"-"+getMonthInwords(dateval[1])+"-"+dateval[0];
		 $(destinationId).val(setDate);
	}
  
  
  function getMonthInwords(month){
	  
	month=parseInt(month);  
	var monthName;
	
	switch(month){
	
	case 1:
	      monthName="January";
	      break;
	  
	case 2:
		  monthName="February";
		  break;
	case 3:
		  monthName="March";
		  break;
	case 4:
		  monthName="April";
		  break;
	case 5:
		  monthName="May";
		  break;
	case 6:
		  monthName="June";
		  break;
	case 7:
		  monthName="July";
		  break;
	case 8:
		  monthName="August";
		  break;
	case 9:
		  monthName="September";
		  break;
	case 10:
		  monthName="October";
		  break;
    case 11:
	      monthName="November";
	      break;
	  
    case 12:
   	      monthName="December";
   	      break;
    }
	
	return monthName;
  }	
  
  
  
  /* Returns values of the url parameters
	also can get specified parameter value by specifiying something like below
	var first = getUrlVars()["me"];	 */
	function getUrlVars() {
	    var vars = [], hash;
	    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	    for(var i = 0; i < hashes.length; i++)
	    {
	        hash = hashes[i].split('=');
	        vars.push(hash[0]);
	        vars[hash[0]] = hash[1];
	    }
	    return vars;
	}
	
	function redirectToLoginIfNotAJsonObject(jsondata){
		
		  if ($.isPlainObject(jsondata)==false){
			   
			    var loginurl = "${webapp_path}/login.sp";
		    	location.replace(loginurl);
		    }
		  
	}
  

</script>