$(document).ready(function() {
    
	$("a.tooltipLink").tooltip();
	
	$("#addDatasetBtn").click(function() {
		$("#dataSetDetail").toggleClass("hidden");
		$("#addDatasetBtn").val("Not Now");
	});
	
	var fileValidators = {
            row: '.col-xs-4',   // The title is placed inside a <div class="col-xs-4"> element
            validators: {
                notEmpty: {
                    message: 'Choose a File'
                }
            }
        },
        dataSetNameValidators = {
            row: '.col-xs-4',
            validators: {
                notEmpty: {
                    message: 'Dataset name is required'
                }
            }
        },
        taskTypeValidators = {
            row: '.col-xs-3',
            validators: {
                notEmpty: {
                    message: 'Task type is required'
                }
            }
        },
        bookIndex = 0;
	
	$('#studyForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	studyName: {
                validators: {
                    notEmpty: {
                        message: 'Study Name is required'
                    }
                }
            },
            studyDesc: {
            	validators: {
                    notEmpty: {
                        message: 'Study Description is required'
                    },
                    stringLength: {
                    	min: 50,
                    	max: 600,
                        message: 'Study Description must be between 50 to 600 characters'
                    }
            	}
            },
            license: {
                validators: {
                    notEmpty: {
                        message: 'License is required'
                    }
                }
            },
            "dataSetBO[0].file": fileValidators,
            "dataSetBO[0].dataSetName": dataSetNameValidators,
            "dataSetBO[0].taskType": taskTypeValidators
        }
    })
    .on('success.field.fv', function(e, data) {
        var $parent = data.element.parents('.form-group,.col-xs-4,.col-xs-3');
        $parent.removeClass('has-success');
        data.element.data('fv.icon').hide();
    })
    
    // Add button click handler
    .on('click', '.addButton', function() {
        bookIndex++;
        var $template = $('#dataSetTemplate'),
            $clone    = $template
                            .clone()
                            .removeClass('hide')
                            .removeAttr('id')
                            .attr('data-book-index', bookIndex)
                            .insertBefore($template);

        // Update the name attributes
        $clone
            .find('[name="file"]').attr('name', 'dataSetBO[' + bookIndex + '].file').end()
            .find('[name="dataSetName"]').attr('name', 'dataSetBO[' + bookIndex + '].dataSetName').end()
            .find('[name="taskType"]').attr('name', 'dataSetBO[' + bookIndex + '].taskType').end();

        // Add new fields
        // Note that we also pass the validator rules for new field as the third parameter
        $('#bookForm')
            .formValidation('addField', 'dataSetBO[' + bookIndex + '].file', titleValidators)
            .formValidation('addField', 'dataSetBO[' + bookIndex + '].dataSetName', isbnValidators)
            .formValidation('addField', 'dataSetBO[' + bookIndex + '].taskType', priceValidators);
    })

    // Remove button click handler
    .on('click', '.removeButton', function() {
        var $row  = $(this).closest('.form-group'),
            index = $row.attr('data-book-index');

        // Remove fields
        $('#bookForm')
            .formValidation('removeField', $row.find('[name="dataSetBO[' + index + '].file"]'))
            .formValidation('removeField', $row.find('[name="dataSetBO[' + index + '].dataSetName"]'))
            .formValidation('removeField', $row.find('[name="dataSetBO[' + index + '].taskType"]'));

        // Remove element containing the fields
        $row.remove();
    })
    .on('success.form.fv', function(e) {
    	e.preventDefault();
    	var url="createStudy.sp";
    	
    	// logic to diff URL for Approve / Update
    	// Form instance
    	var $form = $(e.target),     
        // Get the clicked button
        $button = $form.data('formValidation').getSubmitButton(),
        // You might need to update the "status" field before submitting the form
        $statusField = $form.find('[name="commit"]');
    	var btnId = $button.attr('id');
    	if(btnId == "update-btn") 
    		url = "updateStudy.sp";
    	
    	//trimFormInputs();
    	//Json data
    	var frmdata = new FormData($(this)[0]);
    	frmdata = frmdata.serialize();
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
    	redirectToLoginIfNotAJsonObject(jsondata);
        var isSuccess=displayDialogOnFormSubmit(jsondata,$form);
        
        if(isSuccess)
  			 resetFormValidation(formObj);
  		 else
  			 resetAll(formObj);
        
    });
});