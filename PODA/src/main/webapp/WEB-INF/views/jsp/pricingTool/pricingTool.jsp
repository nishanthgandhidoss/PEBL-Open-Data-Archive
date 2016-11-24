<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
   
   color:#fff
}

.panel-heading{

   
    font-size:16px;
    font-weight: bold;
    font-style:normal
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	$("a.tooltipLink").tooltip();
})
</script>
	<c:if test="${isSuccess}">
		<%-- <div class="alert alert-success">
        Successfully created GRN No. : <strong>${createdGrnNo}</strong> 
       </div> --%>
       
       <script> alert("Successfully created Part Number. : ${createdPartNumber}")</script>
	</c:if>
	<div class="container">

		<div class="col-md-5">
			<div class="panel panel-primary">
			
				<div class="panel-heading">
				  Pricing Tool
				  <c:if test="${callFor eq 'editPrcing'}">
				  	&nbsp;|&nbsp;Update
				  </c:if>
				  <a href="${webapp_path}/admin/listPricing.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Part Number">
				  <span class="glyphicon  glyphicon-th-list pull-right"></span>
				  </a> 
				  </div>
				<span class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</span> 
				 <div class="panel-body">
				 
					<form:form id="pricingForm">

						<div class="form-group">
							<label class="control-label"><span title="required" class="mandatoryId">*</span>Part Number </label> 
						    <form:input path="partNumber" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label class="control-label"><span title="required" class="mandatoryId">*</span>Part Name </label> 
						    <form:input path="partName" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label class="control-label"><span title="required" class="mandatoryId">*</span>Model Name </label> 
						    <form:input path="modelName" class="form-control"/>
						</div>
	
						<div class="form-group">
							<label class="control-label"><span title="required" class="mandatoryId">*</span>Quantity/Packet </label> 
						 	<form:input path="quantityPerPacket" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label class="control-label"><span title="required" class="mandatoryId">*</span>Part Price </label> 
						 	<form:input path="partPrice" class="form-control"/>
						</div>
						
						<form:hidden path="id"/>
							
						<c:choose>
	               			<c:when test="${callFor eq 'editPrcing'}">
								<input class="submit-btn" name="commit" id="update-btn" value="Update" type="submit"/>
							</c:when>
							<c:otherwise>
					   			<input class="submit-btn" name="commit" id="save-btn" value="Submit" type="submit"/>
					   			<input type="button" class="submit-btn marginleft10" value="Reset"  onclick="resetForm(this.form)"/> 
					   		</c:otherwise>
					   	</c:choose>
			   		</form:form>
				</div>
			</div>
		</div>
	</div>
	
<script>
	$(document).ready(function() {
	    $('#pricingForm').formValidation({
	        framework: 'bootstrap',
	        icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	partNumber: {
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
                quantityPerPacket: {
                	validators: {
                        notEmpty: {
                            message: 'Quantity/Packet is required'
                        },
                        numeric: {
                        	message: 'Quantity/Packet must be a number'
                        }
                    }
                },
                partPrice: {
                	validators: {
                        notEmpty: {
                            message: 'Part Price is required'
                        },
                        numeric: {
                        	message: 'Part Price must be a number'
                        }
                    }
                }
	        }
	    })
	    .on('success.field.fv', function(e, data) {
            // $(e.target)  --> The field element
            // data.fv      --> The FormValidation instance
            // data.field   --> The field name
            // data.element --> The field element

            var $parent = data.element.parents('.form-group');

            // Remove the has-success class
            $parent.removeClass('has-success');

            // Hide the success icon
            data.element.data('fv.icon').hide();
        }).on('success.form.fv', function(e) {
        	e.preventDefault();
        	var url="${webapp_path}/admin/savePricing.sp";
        	
        	// logic to diff URL for Approve / Update
        	// Form instance
        	var $form = $(e.target),     
            // Get the clicked button
            $button = $form.data('formValidation').getSubmitButton(),
            // You might need to update the "status" field before submitting the form
            $statusField = $form.find('[name="commit"]');
        	var btnId = $button.attr('id');
        	if(btnId == "update-btn") 
        		url = "${webapp_path}/admin/updatePricing.sp";
        	
        	trimFormInputs();
        	//Json data
        	var jsondata=submitFrm($form,url);
        	redirectToLoginIfNotAJsonObject(jsondata);
            var isSuccess=displayDialogOnFormSubmit(jsondata,$form);
            
            if(isSuccess)
      			 resetFormValidation(formObj);
      		 else
      			 resetAll(formObj);
            
        });
	});
</script>