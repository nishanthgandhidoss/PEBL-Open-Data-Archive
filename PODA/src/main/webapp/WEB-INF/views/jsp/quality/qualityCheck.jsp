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
    font-style:normal;
    text-shadow: 0 1px 0 #000;
}

.select2 {
	width:100% ! important;
}

.select2-selection {
	height: 32px ! important; 
	padding-left: 6px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	$(".tooltipLink").tooltip();
	$('.selectBoxGroup').select2();
})

</script>

	<div class="container">
		<div class="col-md-5">
			<div class="panel panel-primary">
			
				<div class="panel-heading">
				  RM Quality Check
				  <c:if test="${callFor eq 'editQC'}">
				  	&nbsp;|&nbsp;Update
				  </c:if>
				  <a href="${webapp_path}/listgrn.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List GRN">
				  <span class="glyphicon  glyphicon-th-list pull-right"></span>
				  </a> 
				  </div>
				<span class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</span> 
				 <div class="panel-body">
				 
					<form:form id="qualityCheckForm">
					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>GRN No </label> 
					     <form:input path="grnNo"  readonly="true" style="color: #787878;" class="form-control tooltipLink bgc_grey" data-toggle="tooltip" title="Read only GRN No."/>
					</div>
					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Received Bags </label> 
						<form:input path="receivedBags" class="form-control tooltipLink bgc_grey" style="color: #787878;" data-toggle="tooltip" title="Read only Received Bags." readonly="true"/>
					</div>
					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Approved Bags </label> 
						<form:input path="approvedBags" class="form-control"/>
					</div>
					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Checked By </label> 
						<form:select path="checkedBy" class="form-control selectBoxGroup">
					  		<form:option value="" selected="selected">Select</form:option>
					  		<form:options items="${usersList}" itemLabel="fullNameWithUserName" itemValue="id"/>
				        </form:select>
					</div>

					<div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Approved By </label> 
						<form:select path="approvedBy" class="form-control selectBoxGroup">
					  		<form:option value="" selected="selected">Select</form:option>
					  		<form:options items="${usersList}" itemLabel="fullNameWithUserName" itemValue="id"/>
				        </form:select>
					</div>

					<%-- <div class="form-group">
						<label class="control-label"><span title="required" class="mandatoryId">*</span>Store Location </label> 
						<form:input path="storeLocation" class="form-control"/>
					</div> --%>
					
					<c:choose>
               			<c:when test="${callFor eq 'editQC'}">
							<input class="submit-btn" name="commit" id="update-btn" value="Update" type="submit"/>
						</c:when>
						<c:otherwise>
				   			<input class="submit-btn" name="commit" id="approve-btn" value="Approve" type="submit"/>
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
			$('#qualityCheckForm').formValidation({
		        framework: 'bootstrap',
		        icon: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	approvedBags: {
		                validators: {
		                	notEmpty: {
	                            message: 'Approved bags is required'
	                        },
	                        numeric: {
	                        	message: 'Approved bags must be a number'
	                        },
	                        between: {
	                            min: 1,
	                            max: 'receivedBags',
	                            message: 'Approved bags should not be more than Received bags'
	                        }
		                }
		            },
		            checkedBy: {
		            	validators: {
		                    notEmpty: {
		                        message: 'Checked By is required'
		                    }
		            	}
		            },
		            approvedBy: {
	                    validators: {
	                        notEmpty: {
	                            message: 'Approved By is required'
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
	        })
	        .on('success.form.fv', function(e) {
	        	e.preventDefault();
	        	var url="${webapp_path}/approveGrn.sp";
	        	
	        	// logic to diff URL for Approve / Update
	        	// Form instance
	        	var $form = $(e.target),     
	            // Get the clicked button
	            $button = $form.data('formValidation').getSubmitButton(),
	            // You might need to update the "status" field before submitting the form
	            $statusField = $form.find('[name="commit"]');
	        	var btnId = $button.attr('id');
	        	if(btnId == "update-btn") 
	        		url = "${webapp_path}/updateQualityCheck.sp";
	        	
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
			$('#qualityCheckForm').formValidation('revalidateField','approvedBagsa');
		});
		
		
        function loadCustomFunction(){
	    	
			var redirectUrl="${webapp_path}/listgrn.sp";
			window.location.replace(redirectUrl);
		}
</script>