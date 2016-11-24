<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.erp.utils.Constants).ACTION_EDIT"/>

<style type="text/css">

.mandatoryId{
   color:crimson
}

.mandatorytoplabel{

   font-style: italic;
   margin:10px ;
   font-size:12px
}

.panel-heading>a>.glyphicon{
   
   color:#fff;
}

.panel-heading{

   
    font-size:16px;
    font-weight: bold;
    font-style:normal
}

.select2 {
	width:100% ! important;
}
.select2-selection {
	height: 32px ! important; 
	padding-left: 6px;
}



/* .dialogBoxSuccess,.dialogBoxSuccess:hover{
  
  background-color:#5bc0de;
  color:#fff;
}

.dialogBoxError,.dialogBoxError:hover{
  
  background-color:#d9534f;
  color:#fff;
}
 */


</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".tooltipLink").tooltip();
	
	$('.selectBoxGroup').select2();
	
	/* $("#grnForm").submit(function() {
		var url="${webapp_path}/saveGRN.sp";
		submitFrm(this,url);
		return false;
    }); */

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
    
    
	$(".rmGroup").change(function () {
		var selectedId = this.value;
		$(".rmGroup").val(selectedId);
		$("#rmGrade option:gt(0)").remove().end();
		var url = "${webapp_path}/getRMGradeListByRmId.sp";
		$.get(url,{"rmId":selectedId},function(jsondata){
			$.each(jsondata,function(index,obj){
				$('<option>').val(obj.id).text(obj.rmGrade).appendTo('#rmGrade');
				$("#rmGrade").val($("#rmGrade option:first").val());
			});
		});
	});
	//$(document).ready(function() {
        
	   // $("form").bind("keypress", function(e) {  /*$("form") refers to complete form */
	      //      if (e.keyCode == 13) 
	         //   return false;
	     // });
	//});
	//$('#approvedById').select2();
	
	<c:if test="${cmd eq editCmd}">	// only for Edit page to display the date
		copyDateValueFromSourceToDestId("#grnDteHidId","#GrnDteId"); //("#souceId","#destinationId")
		copyDateValueFromSourceToDestId("#invoiceDteHidId","#invoiceDteId"); 
		copyDateValueFromSourceToDestId("#RmMfgDteHidId","#RmMfgDteID");
		makeAllInputFieldsDisabled();
		
		$("#editGlyphiconId").click(function(){
			
			makeAllInputFieldsEnabled();
		})
		
	</c:if> 
	
	
	
});


function makeAllInputFieldsDisabled(){
	
	$("#updateBtnId").hide();
	//$("#rstBtnId").hide();
	$("#grnForm :input").prop("disabled", true);
	$("#grnForm :input").addClass("bgc_grey");
	
}

function makeAllInputFieldsEnabled(){
	
	$("#updateBtnId").show();
	//$("#rstBtnId").show();
	$("#grnForm :input").prop("disabled", false);
	$("#grnForm :input:not(.rmGroup)").removeClass("bgc_grey");
	
}

	
</script>
	<%-- <c:if test="${isSuccess}">
		<div class="alert alert-success">
        Successfully created GRN No. : <strong>${createdGrnNo}</strong> 
       </div>
       
       <script> alert("Successfully created GRN No. : ${createdGrnNo}")</script>
	</c:if> --%>
	
 <div class="container">

	<div class="col-md-5">
		<div class="panel panel-primary">
		
		    <div class="panel-heading">
				  Create GRN
				  <c:if test="${cmd eq editCmd && isEditable eq 'Y'}">
				  	| Update (<c:out value="${command.grnNo}"></c:out>)
				  </c:if>
				  <a href="${webapp_path}/listgrn.sp" class="pull-right tooltipLink marginleft10" data-toggle="tooltip" title="List GRN">
				  <span class="glyphicon  glyphicon-th-list pull-right"></span>
				  </a> 
				  <c:if test="${cmd eq editCmd && isEditable eq 'Y'}">
				  <span class="glyphicon glyphicon-edit tooltipLink pull-right pointercursor" id="editGlyphiconId" data-toggle="tooltip" title="Edit GRN"></span>
				  </c:if>
		    </div>
			  
		    <div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div>
			   
			<div class="panel-body">
			    <form:form id="grnForm">
			     <form:hidden path="id"/>
			     <form:hidden path="grnNo"/>
				  <div class="form-group">
						<label><span class="mandatoryId">*</span>GRN Date</label>
						<div class="input-group">
							<input type="text" id="GrnDteId" class="form-control date form_date" name="grnDateValidation" readonly data-date-format="dd-M-yyyy" 
							data-link-field="grnDteHidId"  data-link-format="yyyy-mm-dd"/>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
						</div>
						<form:hidden id="grnDteHidId" path="grnDate"/>
				  </div>
				  
				  <div class="form-group">
						<label><span class="mandatoryId">*</span>Tally GRN No. </label> 
					    <form:input path="tallyGrnNo" class="form-control" />
					</div>
					
				  <div class="form-group">
						<label><span class="mandatoryId">*</span>RM Name</label> 
					    <div class="selectContainer">	 
							<form:select path="rmId" class="form-control bgc_grey rmGroup">
						  		<form:option value="0" selected="selected">Select</form:option>
						  		<form:options items="${rmDetailsList}" itemLabel="rmName" itemValue="id"/>
					        </form:select>
						</div>
				  </div>
					
				  <div class="form-group">
						  <label><span class="mandatoryId">*</span>RM Specification</label>
						  <form:select path="rmId" class="form-control bgc_grey rmGroup" readonly="true">
						  		<form:option value="0" selected="selected">Select</form:option>
						  		<form:options items="${rmDetailsList}" itemLabel="rmSpecification" itemValue="id"/>
					        </form:select>
				   </div>
					
				   <div class="form-group">
					   <label><span class="mandatoryId">*</span>RM Grades &nbsp;<span style="font-size:12px;font-style:italic">( Choose RM Name to populate grades )</span> </label> 
					   <div class="selectContainer">	 
							<form:select path="rmGradeId" id="rmGrade" class="form-control">
						  		<form:option value="0" selected="selected">Select</form:option>
						  	    <!-- 	Rm grade List for Edit -->
						  		<form:options items="${rmGradeList}" itemLabel="rmGrade" itemValue="id"/>
					        </form:select>
						</div>
				   </div>
					
				   <div class="form-group">
						<label><span class="mandatoryId">*</span>No. of Bags Received </label> 
					    <form:input path="noOfBags" class="form-control" id="noOfBags"/>
						
				   </div>
				   
				   <div class="form-group">
				      <label><span class="mandatoryId">*</span>Quantity Per Bag </label> 
				      <form:input path="quantityPerBag" class="form-control" id="quantityPerBag"/>
				   </div>
				   
					
				   <div class="form-group">
					  <label><span class="mandatoryId">*</span>Total Quantity Received</label> 
				      <form:input path="quantity" class="form-control bgc_grey" id="quantity" placeholder="" readonly="true"/>
				   </div>
					
				   <div class="form-group">
						<label><span class="mandatoryId">*</span>Invoice No. </label> 
					    <form:input path="invoiceNo" class="form-control" id="" />
				   </div>
					
				   <div class="form-group">
						<label><span class="mandatoryId">*</span>Invoice Date</label>
						<div class="input-group">
							<input type="text" id="invoiceDteId" class="form-control date form_date" name="invoiceDateValidation" readonly data-date-format="dd-MM-yyyy" 
							data-link-field="invoiceDteHidId"  data-link-format="yyyy-mm-dd"/>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
						</div>
						<form:hidden id="invoiceDteHidId" path="invoiceDate"/>
					</div>
					
					<div class="form-group">
						<label><span class="mandatoryId">*</span>Supplier Name </label> 
					    <form:select id="supplierId" path="supplierId" class="form-control selectBoxGroup">
					  		<form:option value="" selected="selected">Select</form:option>
					  		<form:options items="${supplierList}" itemLabel="supplierName" itemValue="id"/>
				        </form:select>
					</div>
					
					<div class="form-group">
						<label><span class="mandatoryId">*</span>RM Lot No. </label> 
					    <form:input path="rmLotNo" class="form-control" />
					</div>
					
					<div class="form-group">
						<label><span class="mandatoryId">*</span>RM Test Report No. </label> 
					    <form:input path="rmTestReportNo" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label><span class="mandatoryId">*</span>RM Manufacture Date</label>
						<div class="input-group">
							<input type="text" id="RmMfgDteID" class="form-control date form_date" name="rmManufactureDateValidation" readonly data-date-format="dd-MM-yyyy" 
							data-link-field="RmMfgDteHidId"  data-link-format="yyyy-mm-dd"/>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
						</div>
						<form:hidden id="RmMfgDteHidId" path="rmManufactureDate"/>
					</div>
					
					<div class="form-group">
						<label><span title="required" class="mandatoryId">*</span>Store Location </label> 
						<form:input path="storeLocation" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>Remarks (optional) </label> 
					    <form:textarea  path="remarks" class="form-control" 
							 placeholder="Enter Remarks"/>
					</div>
					
					<div class="form-group">
						<label><span class="mandatoryId">*</span>Approved By </label> 
					    <form:select id="approvedById" path="approvedBy" class="form-control selectBoxGroup">
					  		<form:option value="" selected="selected">Select</form:option>
					  		<form:options items="${usersList}" itemLabel="fullNameWithUserName" itemValue="id"/>
				        </form:select>
					</div>
					
					<div class="form-group">
					   <c:choose>
	               			<c:when test="${cmd eq editCmd}">
								  <input class="submit-btn" type="submit"  value="Update" id="updateBtnId"/>
							</c:when>
							<c:otherwise>
					   		  <input class="submit-btn" type="submit"  value="Submit"/>
					   		   <input type="button" class="submit-btn marginleft10" value="Reset"  onclick="resetForm(this.form)" style="margin-left:10px;"/>
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
		
		 var formObj=$('#grnForm');
		// Form validation io revalidate 
	    $('#GrnDteId').on('changeDate', function(e) {
            // Revalidate the date field
            formObj.formValidation('revalidateField', 'grnDateValidation');
        });
	    $('#invoiceDteId').on('changeDate', function(e) {
            // Revalidate the date field
           formObj.formValidation('revalidateField', 'invoiceDateValidation');
        });
	    $('#RmMfgDteID').on('changeDate', function(e) {
            // Revalidate the date field
           formObj.formValidation('revalidateField', 'rmManufactureDateValidation');
        });
	    $('#rmId').on('change', function(e) {
	    	formObj.formValidation('revalidateField', 'rmId');
	    	formObj.formValidation('revalidateField', 'rmGradeId');
        });
	    $('#rmGrade').on('change', function(e) {
	    	formObj.formValidation('revalidateField', 'rmGradeId');
	    	formObj.formValidation('revalidateField', 'rmId');
        });
	    //Quantity Auto populate logic
	    var funcEvent = function() {
	    	formObj.formValidation('revalidateField', 'noOfBags');
	    	formObj.formValidation('revalidateField', 'quantityPerBag');
	    	var id = this.id;
	    	var quan;
	    	if(id == 'noOfBags')
	    		quan = $(this).val() * $('#quantityPerBag').val();
	    	else
	    		quan = $(this).val() * $('#noOfBags').val();
	    	$('#quantity').val(quan);
	    	formObj.formValidation('revalidateField', 'quantity');
	    }
	    
	    $("#noOfBags,#quantityPerBag").keyup(funcEvent);
	    $("#noOfBags,#quantityPerBag").change(funcEvent);
	    
	    formObj.formValidation({
	        framework: 'bootstrap',
	        icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon ',// removing glyphicon-remove to disable x symbol in text box
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            grnDateValidation: {
	                validators: {
	                    notEmpty: {
	                        message: 'The date is required'
	                    }
	                }
	            },
	            tallyGrnNo: {
	                validators: {
	                    notEmpty: {
	                        message: 'The Tally GRN NO. is required'
	                    }
	                }
	            },
	            rmSpecification: {
	            	validators: {
	                    notEmpty: {
	                        message: 'RM Specification is required'
	                    }
	            	}
	            },
	            rmId: {
                    validators: {
                        callback: {
                            message: 'Please select a RM Name',
                            callback: function (value, validator, $field) {
                            	      return parseInt(value)>0
                            }
                        }
                    }
                },
                rmGradeId: {
                    validators: {
                        callback: {
                            message: 'Please select  RM Grade',
                            callback: function (value, validator, $field) {
                            	      return parseInt(value)>0
                            }
                        }
                    }
                },
                quantity: {
                	validators: {
                        notEmpty: {
                            message: 'Quantity is required'
                        },
                        numeric: {
                        	message: 'Quantity must be a number'
                        },
                        greaterThan: {
                        	value: 1,
                        	message: 'Quantity should be more than 1'
                        }
                    }
                },
                noOfBags: {
                	validators: {
                        notEmpty: {
                            message: 'No of Bags is required'
                        },
                        numeric: {
                        	message: 'No of Bags must be a number'
                        },
                        greaterThan: {
                        	value: 1,
                        	message: 'No of Bags cannot be zero or -ive'
                        }
                    }
                },
                quantityPerBag: {
                	validators: {
                        notEmpty: {
                            message: 'Quantity Per Bag is required'
                        },
                        numeric: {
                        	message: 'Quantity Per Bag must be a number'
                        },
                        greaterThan: {
                        	value: 1,
                        	message: 'Quantity Per Bag cannot be zero or -ive'
                        }
                    }
                },
                invoiceNo: {
                	validators: {
                        notEmpty: {
                            message: 'Invoice number is required'
                        }
                    }
                },
                invoiceDateValidation: {
	                validators: {
	                    notEmpty: {
	                        message: 'Invoice date is required'
	                    }
	                }
	            },
	            supplierId: {
	                validators: {
	                    notEmpty: {
	                        message: 'Supplier Name is required'
	                    }
	                }
	            },
	            rmLotNo: {
	            	 validators: {
	                    notEmpty: {
	                        message: 'RM Lot No Name is required'
	                    }
	                }
	            },
	            rmTestReportNo: {
	            	 validators: {
	                    notEmpty: {
	                        message: 'RM Test Report No is required'
	                    }
	                }
	            },
	            rmManufactureDateValidation: {
	            	 validators: {
	                    notEmpty: {
	                        message: 'RM Manufacture Date is required'
	                    }
	                }
	            },
	            remarks: {
                	validators: {
                		stringLength: {
                			max:160,
                            message: 'Only 160 characters allowed'
                        }
                    }
                },
	            storeLocation: {
                	validators: {
                        notEmpty: {
                            message: 'Store Location is required'
                        }
                    }
                },
	            approvedBy: {
	            	validators: {
	                    notEmpty: {
	                        message: 'Approved by is required'
	                    }
	                }
	            }
	        }
	        
	    }).on('success.field.fv', function(e, data) {
            // $(e.target)  --> The field element
            // data.fv      --> The FormValidation instance
            // data.field   --> The field name
            // data.element --> The field element

            var $parent = data.element.parents('.form-group');

            // Remove the has-success class
            $parent.removeClass('has-success');

            // Hide the success icon
            data.element.data('fv.icon').hide();
            
        }).on('success.form.fv', function(e){
        	
        	
           e.preventDefault();
        	
        	var $form = $(e.target);
            $button = $form.data('formValidation').getSubmitButton();
            
        	var btnType = $button.attr('value');
        	
        
        	
        	if(btnType == "Update"){ 
        		var url = "${webapp_path}/updateGRN.sp";
        		
        	}else if(btnType == "Submit"){	
        		 var url="${webapp_path}/saveGRN.sp";
        	  
        	}
        	
        	 trimFormInputs();
       
    		 var jsondata=submitFrm(this,url);
    		 redirectToLoginIfNotAJsonObject(jsondata);
    		 var isSuccess= displayDialogOnFormSubmit(jsondata,formObj);
    		
    		 if(isSuccess)
    			 resetFormValidation(formObj);
    		 else
    			 resetAll(formObj);
            });
	   });
	
	     
	
</script>


<!-- http://formvalidation.io/examples/bootstrap-select/ -->
   
