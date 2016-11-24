/**
 * Nishanth Gandhidoss
 */
var grnValidated = true;
var formObj = $('#routeCardDetailsForm');
$(document).ready(function() {
	  // Global values
	  var jsonData = null;
	  
	  $('.selectBoxGroup').select2();
	  
	  // Tooltip
	  $("a.tooltipLink").tooltip();
	  
	  // Date Picker
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
	 
	  // Route card details - Start
	  // Dropdown matching - PartNumber
	  $(".partGroup").change(function () {
	      var end = this.value;
	      $(".partGroup").val(end);
	      $('#routeCardDetailsForm').formValidation('revalidateField', 'partId');
	      $('#routeCardDetailsForm').formValidation('revalidateField', 'partName');
	      $('#routeCardDetailsForm').formValidation('revalidateField', 'modelName');
	  });
	  // Dropdown matching - Raw Material
	  $(".rmGroup").change(function () {
	      var selectedId = this.value;
	      $(".rmGroup").val(selectedId);
	      $("#rmGrade option:gt(0)").remove().end();
			var url = "getRMGradeListByRmId.sp";
			$.get(url,{"rmId":selectedId},function(jsondata){
				$.each(jsondata,function(index,obj){
					$('<option>').val(obj.id).text(obj.rmGrade).appendTo('#rmGrade');
					$("#rmGrade").val($("#rmGrade option:first").val());
				});
			});
	      $("#grn-Sec").addClass("hidden");
	      $("#msg-Sec").empty();
	      $("#planQuan-Sec").addClass("hidden");
	      grnValidated = false;
	      $("#rc-submit,#rc-update").attr('disabled','disabled').addClass('disabled');
	      $('#routeCardDetailsForm').formValidation('revalidateField', 'rmId');
	      $('#routeCardDetailsForm').formValidation('revalidateField', 'rmSpecification');
	      $('#routeCardDetailsForm').formValidation('revalidateField', 'rmGradeId');
	  });
	  $("#rmGrade").change(function() {
		  grnValidated = false;
		  var selectedId = this.value;
	      $("#rmGradeHiddenId").val(selectedId);
		  $("#grn-Sec").addClass("hidden");
	      $("#msg-Sec").empty();
	      $("#planQuan-Sec").addClass("hidden");
	      $("#rc-submit,#rc-update").attr('disabled','disabled').addClass('disabled'); 
	  });
	  $("#rc-reset").click(function() {
		  grnValidated = false;
		  $("#grn-Sec,#planQuan-Sec").addClass("hidden");
	      $("#msg-Sec").empty();
	      $("#rc-submit,#rc-update").attr('disabled','disabled').addClass('disabled'); 
	  });
	  
	  // GRN Validate
	  $("#grnValBtn").click(function() {
		  var htmlContent = "<div class='form-group' id='fifoCheckDiv'><label class='control-label'><span title='required' class='mandatoryId'>*</span>GRN No</label><input id='grnVal' class='form-control' placeholder='Enter the GRN'/></div><div class='form-group' id='alertMsg'></div>"
		  BootstrapDialog.show({
		    	type   :   BootstrapDialog.TYPE_PRIMARY,
	            title  :   'Validate GRN Selected',
	           message :   htmlContent,
	          closable :   true,
	   closeByBackdrop :   true,
	   closeByKeyboard :   true,
	           buttons :    [{
  		                label: 'Check',
  		                cssClass: 'dialogBoxSuccess',
  		                action: function(dialogItself){
  		                		var enteredVal = $('#grnVal').val();
  		                		if(jsonData.grnDetails.grnNo == enteredVal) {
  		                			dialogItself.close();
  		                			$('#msg-Sec').html("<strong> Valid GRN</strong>");
  		                			$("#planQuan-Sec").removeClass("hidden");
  		                			$("#rc-update").removeAttr('disabled').removeClass('disabled');
  		                			grnValidated = true;
  		                		} else {
  		                			$('#grnVal').val("");
  		                			$('#alertMsg').html("<strong> Invalid GRN</strong>");
  		                		}
  		                   }
  		                },
	           			{
  		                	label: 'Reset',
  		                	cssClass: 'dialogBoxError',
  		                	action: function(dialogItself) {
  		                		$('#grnVal').val("");
  		                	}
  		                }]
	             });
	  });
	  
	  // Validation on clearing the Form 
	  $("#rc-submit").click(function() {
		  // alert("Button Clicked");
		  revalidateForm();
	  });
	  // Operation dropdown revalidate 
	  $("#operationId").change(function() {
		   $('#routeCardDetailsForm').formValidation('revalidateField', 'operationId');
	  });
	  
	  // Route card details form validation
	  $('#routeCardDetailsForm').formValidation({
		    framework: 'bootstrap',
		    icon: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon ',// removing glyphicon-remove to disable x symbol in text box
		        validating: 'glyphicon glyphicon-refresh'
		    },
		    fields: {
		    	partId: {
		            validators: {
		                notEmpty: {
		                    message: 'Part Number is required'
		                }
		            }
		        },
		        partName: {
		        	validators: {
		                notEmpty: {
		                    message: 'Part Name is required'
		                }
		        	}
		        },
		        modelName: {
		        	validators: {
		                notEmpty: {
		                    message: 'Model Name is required'
		                }
		            }
		        },
		        rmId: {
		        	validators: {
		        		notEmpty: {
		        			message: 'RM Name is required'
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
		        rmGradeId: {
                    validators: {
                        notEmpty: {
                            message: 'RM Grade is required',
                        }
                    }
                },
                planQuantity: {
                    validators: {
                        notEmpty: {
                            message: 'Plan Quantity is required',
                        },
                        numeric: {
		        			message: 'Plan Quantity should be a number'
		        		},
		        		greaterThan: {
		        			value: 1,
		        			message: "Plan Quantity should not be '0'"
		        		}
                    }
                },
                issuedQuantity:  {
		        	validators: {
		        		notEmpty: {
		        			message: 'RM Issued Quantity is required'
		        		},
		        		numeric: {
		        			message: 'RM Issued Quantity should be a number'
		        		},
		        		between: {
		        			min: 1,
		        			max: 'approvedQuantity',
		        			message: "RM Issued Quantity should not be '0' or more than Grn quantity"
		        		}
		        	}
		        },
		        issuedBy: {
		        	validators: {
		        		notEmpty: {
		        			message: 'Issued By is required'
		        		}
		        	}
		        },
		        receivedBy: {
		        	validators: {
		        		notEmpty: {
		        			message: 'Received By is required'
		        		}
		        	}
		        },
		        machineName: {
		        	validators: {
		        		notEmpty: {
		        			message: 'Machine Name is required'
		        		}
		        	}
		        },
		        operationId: {
		        	validators: {
		        		notEmpty: {
		        			message: 'Operation is required'
		        		}
		        	}
		        }
		    }
		})
		.on('success.field.fv', function(e, data) {
			  var $parent = data.element.parents('.form-group');
			  $parent.removeClass('has-success');
			  data.element.data('fv.icon').hide();
	    })
	    .on('success.form.fv', function(e) {
		    // Prevent form submission
		    e.preventDefault();
		    var $form = $(e.target);
		    $button = $form.data('formValidation').getSubmitButton(),
            $statusField = $form.find('[name="commit"]');
        	var btnId = $button.attr('id');
        	if(grnValidated || btnId == "rc-getGrn") {
			    var url = "fifoGRN.sp";
			    if(btnId == "rc-submit") {
	        		url = "createRouteCard.sp";
	        	}
	        	else if(btnId == "rc-update")
	        		url = "updateRouteCard.sp";
			    trimFormInputs();
	        	jsonData = submitFrm(this, url);
	        	redirectToLoginIfNotAJsonObject(jsonData);
			    var msg, dialogtype, btnStyle, showFlag = true, success = false, updateFlag = false;
			    
			    $.each(jsonData, function (key, obj) { 
			    	if(key=="grnDetails") {
			    		if(obj.returnId < 0) {
			    			msg= obj.returnMsg ;
						    dialogType=BootstrapDialog.TYPE_DANGER;
							btnStyle="dialogBoxError";
							flag=false;
			    		} else {
				    		$("#approvedQuantity").val(obj.approvedQuantity);
				    		$("#grnId").val(obj.id);
				    		$("#grnNo").val(obj.grnNo);
				    		$("#grn-Sec").removeClass("hidden");
				    		$("#fifoGrn").empty();
				    		$("#fifoGrn").append("<strong>Grn no : </strong>" + obj.grnNo + 
				    							 "<strong>Quantity : </strong>" + obj.remainingQuantity + 
				    							 "<strong>Store Location : </strong>" + obj.storeLocation);
				    		$("#remainingQuantity").val(obj.remainingQuantity);
				    		showFlag = false;
			    		}
			    	} else if(key == "createRouteCard") {
			    		msg=obj.returnMsg;
		   				dialogType=BootstrapDialog.TYPE_INFO;
		   				btnStyle="dialogBoxSuccess";
		   				$("#routeCardNo").val(obj);
		   				success = true;
		   			} else if(key == "updatedRouteCard") {
			    		msg=obj.returnMsg;
		   				dialogType=BootstrapDialog.TYPE_INFO;
		   				btnStyle="dialogBoxSuccess";
		   				success = true;
		   				updateFlag = true;
		   				$("#oldGrnId").val(obj.grnId);
		   				$("#oldIssuedQuantity").val(obj.issuedQuantity);
		   			} else{
		   				msg="An error has occcured while creating Route Card. Please contact application support team" ;
		   			    dialogType=BootstrapDialog.TYPE_DANGER;
		   				btnStyle="dialogBoxError";
		   				success = false;
		   			}
			    });
			    // Since jsondata comes as "" / {} / undefined
	    		if(jsonData == "" || jsonData === undefined || $.isEmptyObject(jsonData)) {
	    			msg="An error has occcured while creating Route Card. Please contact application support team." ;
				    dialogType=BootstrapDialog.TYPE_DANGER;
					btnStyle="dialogBoxError";
					flag=false;
	    		}
	    		if(showFlag) {
		    		BootstrapDialog.show({
				    	type   :   dialogType,
			            title  :   'Message',
			           message :   msg,
			          closable :   true,
			   closeByBackdrop :   false,
			   closeByKeyboard :   false,
			           buttons :    [{
		    		                label: 'OK',
		    		                cssClass:btnStyle,
		    		                action: function(dialogItself){
		    		                    dialogItself.close();
		    		                    if(success==true && updateFlag==false) {
		    		                    	$('#routeCardDetailsForm')[0].reset();
		    		                    	resetFormValidation($('#routeCardDetailsForm'));
		    		                    	hideGrnSection();
		    		                    	$('#routeCardDetailsForm').formValidation('resetForm', true);
		    		                    }
		    		                    else if(success==true && updateFlag==true)
		    		                    	window.location.href = "listRouteCard.sp"; 
		    		                    }
		    		                }]
			         });
	    		}
		    } else {
    			var msg = "The GRN for the selected RM is not validated. Kindly get and validate the GRN before submitting.";
    			showDialog(BootstrapDialog.TYPE_WARNING,"dialogBoxWarning",msg,$form,false);
    			$("#rc-getGrn").removeAttr('disabled').removeClass('disabled');
    		}
		});
	  // RouteCard details Ends
	  
  });

// User defined Functions

function revalidateForm() {
	formObj.formValidation('validateField', 'planQuantity');
	formObj.formValidation('validateField', 'issuedQuantity');
	formObj.formValidation('validateField', 'issuedBy');
	formObj.formValidation('validateField', 'machineName');
	formObj.formValidation('validateField', 'operationId');
}

function hideGrnSection() {
	$("#grn-Sec,#planQuan-Sec").addClass("hidden");
    $("#msg-Sec").empty();
    grnValidated = false;
    $("#rc-submit,#rc-update").attr('disabled','disabled').addClass('disabled');
}

function setProdDate(todayDate) {
	// Convert Date to YYYY-MM-DD
	todayDate = todayDate.toISOString().substring(0, 10);
	$("#prodDate,#prodDteHidId").val(todayDate);
}

function updateRouteCard(url, $form) {
	setProdDate(new Date());	// To avoid request mapping binding failure
	var jsonData = submitFrm($form, url);
	var isSuccess = displayDialogOnFormSubmit(jsonData,$form);
	if(isSuccess) {
		$("#prodDetail").removeClass("hidden");
	}
}