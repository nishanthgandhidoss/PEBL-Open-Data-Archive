<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript" src="${webapp_path}/js/routecard/routeCard.js"></script>

<style type="text/css">
	.mandatoryId {
		color: crimson
	}
	.mandatorytoplabel {
		font-style: italic;
		margin: 10px;
		font-size: 12px
	}
	.panel-heading>a>.glyphicon{ 
		color:#fff;
	}
	.panel-heading{
		font-size:16px;
	    font-weight: bold;
	    font-style:normal
	}
	strong { 
		padding-left: 13px;
	}
	.pdtop { 
		padding: 5px 0px; 
	}
	.submit-btn.disabled {
  		opacity: 0.65; 
  		cursor: not-allowed;
	}
	.select2 {
		width:100% ! important;
	}
	.select2-selection {
		height: 32px ! important; 
		padding-left: 6px;
	}
</style>

<div class="container">
	<div class="col-md-5">
		<div class="panel panel-primary">
			<div class="panel-heading">
				  ${formTitle}
				  <c:if test="${callFor == 'editRouteCard' && command.isEditable eq 'Y'}">
				  	| Update (<c:out value="${command.routeCardNo}"></c:out>)
				  </c:if>
				  <a href="${webapp_path}/listRouteCard.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Route Card">
				  <span class="glyphicon  glyphicon-th-list pull-right"></span>
				  </a> 
		    </div>
			<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div>
			<div class="panel-body">
	        	<form:form id="routeCardDetailsForm">
	        	
	        		<!-- Hidden form Elements -->
	        		<c:if test="${callFor == 'editRouteCard'}">
	        			<form:hidden path="id"/>
	        			<form:hidden path="routeCardNo"/>
		        		<form:hidden class="rmGroup" path="rmId" value="" id="rmHiddenId"/>
		        		<form:hidden path="rmGradeId" value="" id="rmGradeHiddenId"/>
		        		<input type="hidden" name="oldGrnId" id="oldGrnId"/>
		        		<input type="hidden" name="oldIssuedQuantity" id="oldIssuedQuantity"/>
	        		</c:if>
	        		
	        		<div class="form-group">
						<label class="control-label">
						<span title="required" class="mandatoryId">*</span>Part Number </label>
						<div class="selectContainer">	 
							<form:select path="partId" class="form-control partGroup bgc_lightgreen">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${partDetailsList}" itemLabel="partNumber" itemValue="id"/>
					        </form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">
						<span title="required" class="mandatoryId">*</span>Part Name </label> 
					    <div class="selectContainer">	 
							<form:select path="partId" class="form-control partGroup bgc_lightgreen">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${partDetailsList}" itemLabel="partName" itemValue="id"/>
					        </form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">
						<span title="required" class="mandatoryId">*</span>Model </label> 
					    <div class="selectContainer">	 
							<form:select path="partId" class="form-control partGroup bgc_lightgreen">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${partDetailsList}" itemLabel="modelName" itemValue="id"/>
					        </form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">
						<span title="required" class="mandatoryId">*</span>RM Name </label> 
					 	<div class="selectContainer">	 
							<form:select path="rmId" class="form-control rmGroup bgc_lightgreen1">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${rmDetailsList}" itemLabel="rmName" itemValue="id"/>
					        </form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">
						<span title="required" class="mandatoryId">*</span>RM Specification </label> 
						<div class="selectContainer">	 
							<form:select path="rmId" class="form-control rmGroup bgc_lightgreen1">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${rmDetailsList}" itemLabel="rmSpecification" itemValue="id"/>
					        </form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">
						<span title="required" class="mandatoryId">*</span>RM Grade </label> 
						<div class="selectContainer">	 
							<form:select path="rmGradeId" id="rmGrade" class="form-control">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<%-- <form:options items="${rmDetailsList}" itemLabel="rmSpecification" itemValue="id"/> --%>
					        </form:select>
						</div>
					</div>
					<form:hidden path="approvedQuantity" id="approvedQuantity" value=""/>
					<form:hidden path="grnId" id="grnId" value=""/>
					<form:hidden path="grnNo" id="grnNo" value=""/>
					<div class="form-group" id="getGrn">
						<input class="submit-btn" name="commit" id="rc-getGrn" value="Get GRN" type="submit"/>
					</div>
					<div class="form-group hidden" id="grn-Sec" style="width: 125%;">
						<div class="form-group">
							<div id="fifoGrn"></div>
						</div>
						<div class="form-group">
							<input class="submit-btn" name="validate" id="grnValBtn" value="Validate GRN" type="button">
						</div>
					</div>
					<div class="form-group" id="msg-Sec"></div>
					<div class="form-group hidden" id="planQuan-Sec">
						<form:hidden path="remainingQuantity" id="remainingQuantity"/>
						<div class="form-group">
							<label class="control-label">
								<span title="required" class="mandatoryId">*</span>Planned Quantity (Nos)</label> 
							<form:input path="planQuantity" class="form-control" id="" placeholder="Enter Plan Quantity" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label class="control-label">
								<span title="required" class="mandatoryId">*</span>RM Issued Quantity (Kgs) </label> 
							<form:input path="issuedQuantity" class="form-control" id="issuedQuantity" placeholder="Enter RM needed in Kgs" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label class="control-label">
								<span title="required" class="mandatoryId">*</span>Issued By </label> 
							<form:select path="issuedBy" class="form-control selectBoxGroup" disabled="disabled">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${usersList}" itemLabel="fullNameWithUserName" itemValue="id"/>
					        </form:select>
						</div>
						<div class="form-group">
							<label class="control-label">
								<span title="required" class="mandatoryId">*</span>Received By </label> 
							<form:select path="receivedBy" class="form-control selectBoxGroup" disabled="disabled">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${usersList}" itemLabel="fullNameWithUserName" itemValue="id"/>
					        </form:select>
						</div>
						<div class="form-group">
							<label class="control-label">
								<span title="required" class="mandatoryId">*</span>Machine Name </label> 
						    <form:input path="machineName" class="form-control updRCGroup" id="" placeholder="Enter Machine Name"/>
						</div>
						<div class="form-group">
							<label class="control-label">
								<span title="required" class="mandatoryId">*</span>Operation </label> 
						    <form:select path="operationId" class="form-control updRCGroup selectBoxGroup" id="operationId" placeholder="Enter Operation">
						    	<form:option value="" selected="selected">Select</form:option>
						    	<form:options items="${operationList}" itemLabel="operationName" itemValue="id"/>
						    </form:select>
						</div>
						<div class="form-group">
							<c:choose>
								<c:when test="${callFor eq 'editRouteCard'}">
									<input class="submit-btn" id="rc-update" name="commit" value="Update" type="submit"/>
								</c:when>
								<c:otherwise>
									<input class="submit-btn" id="rc-submit" name="commit" value="Submit" type="submit"/>
									<input type="button" class="submit-btn marginleft10" value="Reset" id="rc-reset" onclick="resetForm(this.form)" style="margin-left:10px;"/>
								</c:otherwise>
							</c:choose>
						</div>
		            </div>
	        	</form:form>
      		</div>
    	</div>
	</div>
</div>

<c:if test="${callFor eq 'editRouteCard'}">
	<script type="text/javascript">
		$(document).ready(function() {
			$("#oldGrnId").val($("#grnId").val());
			$("#oldIssuedQuantity").val($("#issuedQuantity").val());
			getRmGrade($("#rmHiddenId").val(), $("#rmGradeHiddenId").val());
			$("#getGrn").addClass("hidden");
			$("#planQuan-Sec").removeClass("hidden");
			$("#approvedQuantity").val($("#remainingQuantity").val());
			$(".rmGroup, #rmGrade").change(function() {
				validated = false;
				$("#getGrn").removeClass("hidden");
				$("#rc-update").attr("disabled", "disabled").addClass('disabled');
				$('#routeCardDetailsForm').formValidation('revalidateField', 'rmGradeId');
			});
		});
		function getRmGrade(rmId, rmGradeId) {
			var url = "getRMGradeListByRmId.sp";
			$.get(url,{"rmId":rmId},function(jsondata){
				$.each(jsondata,function(index,obj){
					if(obj.id == rmGradeId) 
						$('<option>').val(obj.id).text(obj.rmGrade).attr('selected','selected').appendTo('#rmGrade');
					else
						$('<option>').val(obj.id).text(obj.rmGrade).appendTo('#rmGrade');
				});
			});
		}
	</script>
</c:if>