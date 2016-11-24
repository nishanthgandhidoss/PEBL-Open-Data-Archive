/**
 * Nishanth Gandhidoss
 */
var prodInspect = null, shiftIndex = 0, count = 0, include = true;

$(document).ready(function() {
	
	// Tool tip
	$("a.tooltipLink").tooltip();

	$("th,td").addClass("text-center");

	// Date Picker
	$('.form_date').datetimepicker({
	    //language:  'fr',
	    weekStart: 1,
	    todayBtn:  0,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
	
	// Convert date format
	$(".indDateFormat").each(function() {
	    var formattedDate = toIndianDateFormat($(this).text());
		$(this).text(formattedDate);
	});
	
	// prodInspect = parseJSON($('#prodInspect').val());
	
	// Date Revalidation
	$('#prodDate').on('changeDate', function(e) {
		formObj.formValidation('updateStatus', 'prodDateValidation', 'NOT_VALIDATED')
			   .formValidation('validateField', 'prodDateValidation')
			   .on('success.validator.fv', function(e, data) {
				   $("#shiftDetail").removeClass("hidden");
			   });
		formObj.formValidation('revalidateField', 'prodDateValidation')
		   .on('success.validator.fv', function(e, data) {
			   $("#shiftDetail").removeClass("hidden");
		   });
    });
	
	// Add New Date Functionality
	$("#addNewDate").click(function() {
		hideShiftDetail();
    	resetIndexVars();
    	showHideBtn();
    	showSumitBtn();
    	$("#prodInspectId,#shiftBo_0_id,#shiftBo_0_shiftNo").val("");
    	resetForm(formObj);
		resetFormValidation(formObj);
		$("#addNewDate").addClass("hidden");
	});
	
	// Custom Validator
    FormValidation.Validator.duplicate = {
	        validate: function(validator, $field, options) {
	        	var shiftNos = getShiftNos();
	        	var isExsist = hasDuplicatedItems(shiftNos);
	        	return !isExsist;
	        }
    }
    
	// Form Validation - Start
    var prodDateValidators = {
    		row: '.col-xs-4',   // The title is placed inside a <div class="col-xs-4"> element
            validators: {
                notEmpty: {
                    message: 'Production date is required'
                }
            }
    	},
    	shiftNoValidators = {
            row: '.col-xs-2', 
            validators: {
                notEmpty: {
                    message: 'Shift No is required'
                },
                duplicate: {
                	message: 'Duplicate Shift No not allowed'
                }
            }
        },
    	shiftInchargeValidators = {
            row: '.col-xs-4',   // The title is placed inside a <div class="col-xs-4"> element
            validators: {
                notEmpty: {
                    message: 'Shift in-charge is required'
                }
            }
        },
        okQuantityValidators = {
            row: '.col-xs-2',
            validators: {
                notEmpty: {
                    message: 'Ok quantity is required'
                },
                numeric: {
                    message: 'Ok quantity must be a numeric number'
                },
                greaterThan: {
                    value: -1,
                    message: 'Ok quantity cannot be negative'
                },
                between: {
                	min: 0,
                	max: 100000,
                	message: 'Only Max 100000 Qty can be entred'
                }
            }
        },
        rejectValidators = {
            row: '.col-xs-2',
            validators: {
                notEmpty: {
                    message: 'Reject quantity is required'
                },
                numeric: {
                    message: 'Reject quantity must be a numeric number'
                },
                greaterThan: {
                    value: 0,
                    message: 'Reject quantity cannot be negative'
                },
                between: {
                	min: 0,
                	max: 100000,
                	message: 'Only Max 100000 Qty can be entred'
                }
            }
        },
        formObj = $('#productionForm');
    
    // Revalidate on update click
    $(".tblRow").click(function() {
    	revalidateForm();
    });
    
    formObj.formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	prodDateValidation : prodDateValidators,
        	'shiftBo[0].shiftNo' : shiftNoValidators,
            'shiftBo[0].shiftInCharge': shiftInchargeValidators,
            'shiftBo[0].okQuantity': okQuantityValidators,
            'shiftBo[0].rejectQuantity': rejectValidators
        }
    })
    
    // Remove the success and failure icons
    .on('success.field.fv', function(e, data) {
    	var $parent = data.element.parents('.col-xs-4,.col-xs-3,.col-xs-2'); // Add all input element class 
        $parent.removeClass('has-success');
        data.element.data('fv.icon').hide();
    })
    
    // Add button click handler
    .on('click', '.addButton', function() {
        shiftIndex++;
        if(count < 2) { // since only two shift can be added
	        var $template = $('#productionTemplate'),
	            $clone    = $template
	                            .clone()
	                            .removeClass('hide')
	                            .removeAttr('id')
	                            .attr('data-book-index', shiftIndex)
	                            .insertBefore($template);
	        // Update the name attributes
	        $clone
	        	.find('[name="id"]').attr({name: 'shiftBo[' + shiftIndex + '].id', id: 'shiftBo_' + shiftIndex + '_id'}).end()
	        	.find('[name="shiftNo"]').attr({name: 'shiftBo[' + shiftIndex + '].shiftNo', id: 'shiftBo_' + shiftIndex + '_shiftNo'}).end()
	            .find('[name="shiftInCharge"]').attr({name: 'shiftBo[' + shiftIndex + '].shiftInCharge', id: 'shiftBo_' + shiftIndex + '_shiftInCharge'}).end()
	            .find('[name="okQuantity"]').attr({name: 'shiftBo[' + shiftIndex + '].okQuantity', id: 'shiftBo_' + shiftIndex + '_okQuantity'}).end()
	            .find('[name="rejectQuantity"]').attr({name: 'shiftBo[' + shiftIndex + '].rejectQuantity', id: 'shiftBo_' + shiftIndex + '_rejectQuantity'}).end();
	        $clone.addClass("dup-rows");
	        
	        if(!include) {
	        	$clone.find('[id="removeBtnDiv"]').addClass("hidden");
	        	include = true;
	        }
	        
	        // Add new fields
	        // Note that we also pass the validator rules for new field as the third parameter
	        formObj 
	        	.formValidation('addField', 'shiftBo[' + shiftIndex + '].shiftNo', shiftNoValidators)
	            .formValidation('addField', 'shiftBo[' + shiftIndex + '].shiftInCharge', shiftInchargeValidators)
	            .formValidation('addField', 'shiftBo[' + shiftIndex + '].okQuantity', okQuantityValidators)
	            .formValidation('addField', 'shiftBo[' + shiftIndex + '].rejectQuantity', rejectValidators);
	        
	        count++;
        } else {
        	var msg = "<h4>Only three shifts allowed.</h4>"
        	showDialog(BootstrapDialog.TYPE_INFO, "dialogBoxSuccess", msg, formObj, false);
        }
    })

    // Remove button click handler
    .on('click', '.removeButton', function() {
    	var $row  = $(this).closest('.form-group'),
            index = $row.attr('data-book-index');

        // Remove fields
        formObj
        	.formValidation('removeField', $row.find('[name="shiftBo[' + index + '].shiftNo"]'))
        	.formValidation('removeField', $row.find('[name="shiftBo[' + index + '].shiftInCharge"]'))
            .formValidation('removeField', $row.find('[name="shiftBo[' + index + '].okQuantity"]'))
            .formValidation('removeField', $row.find('[name="shiftBo[' + index + '].rejectQuantity"]'));

        // Remove element containing the fields
        $row.remove();
        count--;
    })
    .on('success.form.fv', function(e){
        // Prevent form submission
        e.preventDefault();
        var $form = $(e.target);
        var $button = $form.data('formValidation').getSubmitButton(),
        $statusField = $form.find('[name="commit"]'),
        url = "",jsonKey = "";
    	var btnId = $button.attr('id');
		if(btnId == "prod-submit") {
			url = "saveProdInspect.sp";
			jsonKey="saveProdInspect";
		} else if(btnId == "prod-update") {
			url = "updateProdInspect.sp";
			jsonKey="updateProdInspect";
		}
		trimFormInputs();
		var jsondata = submitFrm(this,url);
		redirectToLoginIfNotAJsonObject(jsondata);
	    var isSuccess = displayDialogWithJsondata(jsondata,jsonKey,formObj);
	    if(isSuccess) {
	    	hideShiftDetail();
	    	resetIndexVars();
	    }
	});
    // Form Validation - Ends 
    
});

//Check Shift duplicates
$(document.body).on('change', '.shiftGroup', function(){
	revalidateForm();
	revalidateForm();
});

// Custom Functions
function revalidateForm() {
	for(i=0;i<=shiftIndex;i++) {
		var formObj = $('#productionForm');
		formObj.formValidation('revalidateField', 'shiftBo[' + i + '].shiftNo');
		formObj.formValidation('revalidateField', 'shiftBo[' + i + '].shiftInCharge');
		formObj.formValidation('revalidateField', 'shiftBo[' + i + '].okQuantity');
		formObj.formValidation('revalidateField', 'shiftBo[' + i + '].rejectQuantity');
	}
}
function displayDialogWithJsondata(jsondata,jsonKey,formObj){
	var isSuccess;
	$.each(jsondata, function(key, jObject) {
		if (key == jsonKey && jObject.returnId > 0) {
			dialogType = BootstrapDialog.TYPE_INFO;
			btnStyle = "dialogBoxSuccess";
			msg = "<h4>" + jObject.returnMsg + "</h4>";
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
function showDialog(dialogType, btnStyle, msg, formObj, isSuccess) {
	BootstrapDialog.show({
		type : dialogType,
		draggable : true,
		size : BootstrapDialog.SIZE_NORMAL,
		title : 'Message',
		message : msg,
		closable : true,
		closeByBackdrop : false,
		closeByKeyboard : false,
		buttons : [ {
			label : 'OK',
			cssClass : btnStyle,
			action : function(dialog) {
				dialog.close();
				if (isSuccess) {
					resetForm(formObj);
					resetFormValidation(formObj);
			    	location.reload();
					// window.location = window.location.href;
					// window.location=window.location;
			    	// window.opener.location.href = window.opener.location;
				}
			}
		} ]
	});
}
function hideShiftDetail() {
	$(".dup-rows").remove();
	$("#shiftDetail").addClass("hidden");
}
function resetIndexVars() {
	shiftIndex = 0;
    count = 0;
}
function showHideBtn() {
	$("#prod-update,#addNewDate").removeClass("hidden");
	$("#prod-submit,#addShift,#prod-reset").addClass("hidden");
}
function showSumitBtn() {
	$("#prod-submit,#prod-reset").removeClass("hidden");
	$("#prod-update").addClass("hidden");
}
function toIndianDateFormat(date) {
	var newdate = date.split("-").reverse().join("-");
	return newdate;
}
function getShiftNos() {
	var shiftNos = [], shiftNo;
	for(i=0;i<=shiftIndex;i++) {
		shiftNo = $('#shiftBo_' + i + '_shiftNo').val();
		if(shiftNo != undefined)
			shiftNos.push(shiftNo);
	}
	return shiftNos;
}
function hasDuplicatedItems(inputArray) {
    var obj              = {},
        numItems         = inputArray.length,
        duplicateRemoved = [];

    for (var i = 0; i < numItems; i++) {
        obj[inputArray[i]] = 0;
    }

    for (i in obj) {
        duplicateRemoved.push(obj[i]);
    }

    return duplicateRemoved.length !== numItems;
}