<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript" src="${webapp_path}/js/routecard/production.js"></script>

<style type="text/css">
	.mandatoryId {
		color: crimson
	}
	.container {
		 margin: 0 auto;
		 padding: 0 30px;
		 width:100%;
	}
	.panel-body {
    	padding-right: 4%;
    	padding-left: 4%;
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
	.text-left{
		text-align:left;
	}
	strong { 
		padding: 0 5px 0 15px;
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
	.col-xs-2 {
		width:19%; /* Don't make more than 19, then it will cause distorition on UI */
	}
</style>

<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
			  ${formTitle} (<c:out value="${routeCardNo}"></c:out>)
			  <a href="${webapp_path}/listRouteCard.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Route Card">
			  <span class="glyphicon  glyphicon-th-list pull-right"></span>
			  </a> 
	    </div>
		<div class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</div>
		<div class="panel-body">
        	<!-- Form section - start -->
        	<form:form id="productionForm" class="form-horizontal">
			    
			    <!-- Hidden Elements -->
			    <form:hidden path="id" id="prodInspectId"/>
			    <form:hidden path="routeCardNo" id="routeCardNo"/>
			    <form:hidden path="prodFlag" id="prodFlag"/>
			    <form:hidden path="prodId" id="prodId"/>
			    
			    <div class="form-group">
			    	<div class="col-xs-2">
						<label class="control-label"><span class="mandatoryId">*</span>${pageTitle} Date</label>
					</div>
					<div class="col-xs-4">
						<div id="prodDate" class="input-group date form_date" data-date-format="dd-MM-yyyy" data-link-field="prodDteHidId"  data-link-format="yyyy-mm-dd">
							<input type="text" id="prodDateTxtBx" class="form-control" name="prodDateValidation" readonly/>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
						</div>
					</div>
					<form:hidden id="prodDteHidId" path="productionDate"/>
					<c:if test="${pageTitle eq 'Production'}">
						<div class="col-xs-2">
				        	<input class="submit-btn hidden" id="addNewDate" name="commit" value="Add New Date" type="button"/>
				    	</div>
				    </c:if>
			    </div>
			    
			    <div class="form-group hidden" id="shiftDetail">
			    	<div class="form-group">
			    		<div class="col-xs-4">
			    			<h4>Shift Details</h4>
			    		</div>
			    	</div>
			    	<div class="form-group">
			    		<div class="col-xs-2">
				            <label class="control-label"><span class="mandatoryId">*</span>Shift No</label>
				        </div>
			    		<div class="col-xs-4">
				            <label class="control-label"><span class="mandatoryId">*</span>Shift In charge</label>
				        </div>
				        <div class="col-xs-2">
				            <label class="control-label"><span class="mandatoryId">*</span>Ok Quantity (Nos)</label>
				        </div>
				        <div class="col-xs-2">
				            <label class="control-label"><span class="mandatoryId">*</span>Reject Quantity (Nos)</label>
				        </div>
			    	</div>
				    <div class="form-group">
				    	<form:hidden path="shiftBo[0].id" id="shiftBo_0_id"/>
				    	<%-- <form:hidden path="shiftBo[0].shiftNo" id="shiftBo_0_shiftNo"/> --%>
				    	<div class="col-xs-2">
				    		<form:select path="shiftBo[0].shiftNo" class="form-control shiftGroup" id="shiftBo_0_shiftNo">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:option value="1">Shift I</form:option>
						  		<form:option value="2">Shift II</form:option>
						  		<form:option value="3">Shift III</form:option>
					        </form:select>
				    	</div>
				        <div class="col-xs-4">
				            <form:select path="shiftBo[0].shiftInCharge" class="form-control" id="shiftBo_0_shiftInCharge">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:options items="${usersList}" itemLabel="fullNameWithUserName" itemValue="id"/>
					        </form:select>
				        </div>
				        <div class="col-xs-2">
				            <form:input class="form-control" path="shiftBo[0].okQuantity" id="shiftBo_0_okQuantity"/>
				            <input type="hidden" name="shiftBo[0].okQuantityHidden" id="shiftBo_0_okQuantity">
				        </div>
				        <div class="col-xs-2">
				            <form:input class="form-control" path="shiftBo[0].rejectQuantity" id="shiftBo_0_rejectQuantity"/>
				        </div>
				        <div class="col-xs-1">
				            <button type="button" class="btn btn-default addButton"><i class="glyphicon glyphicon-plus pointercursor appgreen"></i></button>
				        </div>
				    </div>
				
				    <!-- The template for adding new field -->
				    <div class="form-group hide" id="productionTemplate">
				    	<input type="hidden" name="id">
				    	<!-- <input type="hidden" name="shiftNo"/> -->
				    	<div class="col-xs-2">
				    		<select class="form-control shiftGroup" name="shiftNo">
						  		<option value="" selected="selected">Select</option>
						  		<option value="1">Shift I</option>
						  		<option value="2">Shift II</option>
						  		<option value="3">Shift III</option>
					        </select>
				    	</div>
				        <div class="col-xs-4">
				            <select class="form-control" name="shiftInCharge">
						  		<option value="" selected="selected">Select</option>
						  		<c:forEach var="user" items="${usersList}">
						  			<option value="${user.id}">${user.fullNameWithUserName}</option>
						  		</c:forEach>
					        </select>
				        </div>
				        <div class="col-xs-2">
				            <input type="text" class="form-control" name="okQuantity"/>
				            <input type="hidden" name="okQuantityHidden">
				        </div>
				        <div class="col-xs-2">
				            <input type="text" class="form-control" name="rejectQuantity"/>
				        </div>
				        <div class="col-xs-1" id="removeBtnDiv">
				            <button type="button" class="btn btn-default removeButton"><i class="glyphicon glyphicon-minus pointercursor" style="color:#dc446e"></i></button>
				        </div>
				    </div>
				    
					<div class="form-group">
						<div class="col-xs-1">
				            <input class="submit-btn" id="prod-submit" name="commit" value="Submit" type="submit"/>
				            <input class="submit-btn hidden" id="prod-update" name="commit" value="Update" type="submit"/>
			            </div>
			            <div class="col-xs-1">
				            <input type="reset" class="submit-btn" id="prod-reset" name="commit" value="Reset" onclick="resetForm(this.form)"/>
				    	</div>
			    	</div>
			    </div>
			    
			</form:form>
			<!-- Form section - End -->
			
			<!-- Exisitng table Secction - Start -->
			<c:if test="${not empty prodDetails}">
				<c:choose>
					<c:when test="${not empty prodDetails && fn:length(prodDetails)>0}">
						<div class="table-responsive">
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th colspan="13"><b>Production Details</b></th>
									</tr>
									<tr>
										<th rowspan="3">Date</th>
										<th colspan="9">Shift Details</th>
										<th rowspan="2" colspan="2">Grand Total</th>
										<th rowspan="3">Action</th>
									</tr>
									<tr>
										<th colspan="3">Shift In-charge Name</th>
										<th colspan="3">Ok Quantity (Nos)</th>
										<th colspan="3">Reject Quantity (Nos)</th>
									</tr>
									<tr>
										<th>I</th>
										<th>II</th>
										<th>III</th>
										<th>I</th>
										<th>II</th>
										<th>III</th>
										<th>I</th>
										<th>II</th>
										<th>III</th>
										<th title="Ok Quantity (Nos)">Ok Qty</th>
										<th title="Reject Quantity (Nos)">Rej Qty</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="obj" items="${prodDetails}">
										<tr class="tblRow">
											<td class="indDateFormat">${obj.productionDate}</td>
											<c:set var="shiftBoLength" scope="session" value="${fn:length(obj.shiftBo)+1}"/>
											<c:forEach var="shiftDetails" items="${obj.shiftBo}">
												<c:if test="${shiftDetails.fullName ne null}">
													<td class="text-left" title="${shiftDetails.fullNameWithUserName}">${shiftDetails.fullName}</td>
												</c:if>
												<c:if test="${shiftDetails.fullName eq null}">
													<td>----</td>
												</c:if>
											</c:forEach>
											<c:forEach begin="${shiftBoLength}" end="3">
												<td>----</td>
											</c:forEach>
											<c:forEach var="shiftDetails" items="${obj.shiftBo}">
												<c:if test="${shiftDetails.fullName ne null}">
													<td>${shiftDetails.okQuantity}</td>
												</c:if>
												<c:if test="${shiftDetails.fullName eq null}">
													<td>----</td>
												</c:if>
											</c:forEach>
											<c:forEach begin="${shiftBoLength}" end="3">
												<td>----</td>
											</c:forEach>
											<c:forEach var="shiftDetails" items="${obj.shiftBo}">
												<c:if test="${shiftDetails.fullName ne null}">
													<td>${shiftDetails.rejectQuantity}</td>
												</c:if>
												<c:if test="${shiftDetails.fullName eq null}">
													<td>----</td>
												</c:if>
											</c:forEach>
											<c:forEach begin="${shiftBoLength}" end="3">
												<td>----</td>
											</c:forEach>
											<td>${obj.totalOkQuantity}</td>
											<td>${obj.totalRejectQuantity}</td>
											<td>
												<c:choose>
								               		<c:when test="${obj.isUpdated eq 'N'}">
								                    	<a href="javascript:void(0)" class="tooltipLink" data-toggle="tooltip" title="Inspected"><span style="color:#4caf50" class="glyphicon glyphicon-check paddingleft10"></span></a>
									            	</c:when>
									            	<c:otherwise>
									            		<a href="javascript:void(0)" onclick="inspect(${obj.id})" class="tooltipLink" data-toggle="tooltip" title="Inspect"><span style="color:#cc0000" class="glyphicon glyphicon-share-alt paddingleft10"></span></a>
									            	</c:otherwise>
									            </c:choose>
									        </td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
				        <div class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px">No Productions Records Yet &#9785;</div>
				    </c:otherwise>
				</c:choose>
			</c:if>
			
			<c:choose>
				<c:when test="${not empty prodInspectDetails && fn:length(prodInspectDetails)>0}">
					<div class="table-responsive">
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th colspan="13"><b>${formTitle}</b></th>
								</tr>
								<tr>
									<th rowspan="3">Date</th>
									<th colspan="9">Shift Details</th>
									<th rowspan="2" colspan="2">Grand Total</th>
									<th rowspan="3">Action</th>
								</tr>
								<tr>
									<th colspan="3">Shift In-charge Name</th>
									<th colspan="3">Ok Quantity (Nos)</th>
									<th colspan="3">Reject Quantity (Nos)</th>
								</tr>
								<tr>
									<th>I</th>
									<th>II</th>
									<th>III</th>
									<th>I</th>
									<th>II</th>
									<th>III</th>
									<th>I</th>
									<th>II</th>
									<th>III</th>
									<th title="Ok Quantity (Nos)">Ok Qty</th>
									<th title="Reject Quantity (Nos)">Rej Qty</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="obj" items="${prodInspectDetails}">
									<tr class="tblRow">
										<td class="indDateFormat">${obj.productionDate}</td>
										<c:set var="shiftBoLength" scope="session" value="${fn:length(obj.shiftBo)+1}"/>
										<c:forEach var="shiftDetails" items="${obj.shiftBo}">
											<c:if test="${shiftDetails.fullName ne null}">
												<td class="text-left" title="${shiftDetails.fullNameWithUserName}">${shiftDetails.fullName}</td>
											</c:if>
											<c:if test="${shiftDetails.fullName eq null}">
												<td>----</td>
											</c:if>
										</c:forEach>
										<c:forEach begin="${shiftBoLength}" end="3">
											<td>----</td>
										</c:forEach>
										<c:forEach var="shiftDetails" items="${obj.shiftBo}">
											<c:if test="${shiftDetails.fullName ne null}">
												<td>${shiftDetails.okQuantity}</td>
											</c:if>
											<c:if test="${shiftDetails.fullName eq null}">
												<td>----</td>
											</c:if>
										</c:forEach>
										<c:forEach begin="${shiftBoLength}" end="3">
											<td>----</td>
										</c:forEach>
										<c:forEach var="shiftDetails" items="${obj.shiftBo}">
											<c:if test="${shiftDetails.fullName ne null}">
												<td>${shiftDetails.rejectQuantity}</td>
											</c:if>
											<c:if test="${shiftDetails.fullName eq null}">
												<td>----</td>
											</c:if>
										</c:forEach>
										<c:forEach begin="${shiftBoLength}" end="3">
											<td>----</td>
										</c:forEach>
										<td>${obj.totalOkQuantity}</td>
										<td>${obj.totalRejectQuantity}</td>
										<td><a href="javascript:void(0)" onclick="update(${obj.id},'${obj.prodFlag}')" title="Update ${formTitle}"><b>Edit</b></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
			        <div class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px">No <c:out value="${pageTitle}"></c:out> Records Yet &#9785;</div>
			    </c:otherwise>
			</c:choose>
			<!-- Exisitng table Section - End -->
			
			<div class="hidden" id="prodInspectJson">
				<c:out value="${prodInspectJson}"></c:out>
			</div>
			
			<div class="hidden" id="prodJson">
				<c:out value="${prodJson}"></c:out>
			</div>
			
			<!-- Hidden Form Submission Section - Start -->
			<form id="prodHiddenFrm">
				<input type="hidden" id="hiddenObjId" name="id"/>
				<input type="hidden" id="hiddenObjIsProd" name="prodFlag"/>
			</form>
			<!-- Hidden Form Submission Section - End -->
        </div>
   	</div>
</div>


<script type="text/javascript">
	function update(prodInspectId, prodFlag) {
		$("#prodInspectId").val(prodInspectId);
		$("#prodFlag").val(prodFlag);
		$(".dup-rows").remove();
		resetIndexVars();
		if(prodFlag == 'N')
			$(".addButton").addClass("hidden");
		var prodInspectJson = $('#prodInspectJson').text();
		prodInspect = JSON.parse(prodInspectJson);
		for(i=0;i<prodInspect.length;i++) {
			if(prodInspect[i].id == prodInspectId) {
				$("#prodDateTxtBx").val(prodInspect[i].productionDate);
				$("#prodDteHidId").val(prodInspect[i].productionDate);
				$("#productionForm,#shiftDetail").removeClass("hidden");
				var idIterator = 0;
				for(j=0;j<prodInspect[i].shiftBo.length;j++) {
					var shiftNo = prodInspect[i].shiftBo[j].shiftNo;
					if(shiftNo != null) {
						$('#shiftBo_' + idIterator + '_id').val(prodInspect[i].shiftBo[shiftNo - 1].id);
						$('#shiftBo_' + idIterator + '_shiftNo').val(prodInspect[i].shiftBo[shiftNo - 1].shiftNo);
						$('#shiftBo_' + idIterator + '_shiftInCharge').val(prodInspect[i].shiftBo[shiftNo - 1].shiftInCharge);
						$('#shiftBo_' + idIterator + '_okQuantity').val(prodInspect[i].shiftBo[shiftNo - 1].okQuantity);
						$('#shiftBo_' + idIterator + '_rejectQuantity').val(prodInspect[i].shiftBo[shiftNo - 1].rejectQuantity);
						if(j<prodInspect[i].shiftBo.length-1) {
							include = false;
							$(".glyphicon-plus").trigger("click");
						}
						idIterator++;
					}
				}
			}
		}
		copyDateValueFromSourceToDestId("#prodDteHidId","#prodDateTxtBx");
		showHideBtn();
	}
	function inspect(prodId) {
		var prodInspectJson = $('#prodInspectJson').text(), 
		prodJson = $('#prodJson').text(),
		isExsist= false;
		prodInspect = JSON.parse(prodInspectJson);
		prod = JSON.parse(prodJson);
		$(".dup-rows").remove();
		resetIndexVars();
		$("#productionForm").removeClass("hidden");
		$("#prodId").val(prodId);
		$(".addButton").addClass("hidden");
		
		for(i=0;i<prod.length;i++) {
			if(prod[i].id == prodId) {
				isExsist = true;
				for(j=0;j<prod[i].shiftBo.length-1;j++) {
					include = false;
					$(".glyphicon-plus").trigger("click");
				}
			}
		}
		if(prodInspect.length < 1) {
			isExsist = false;
		} else {
			for(i=0;i<prodInspect.length;i++) {
				if(prodInspect[i].prodId == prodId) {
					isExsist = true;
					$("#prodInspectId").val(prodInspect[i].id);
					$("#prodDateTxtBx").val(prodInspect[i].productionDate);
					$("#prodDteHidId").val(prodInspect[i].productionDate);
					$("#productionForm,#shiftDetail").removeClass("hidden");
					var idIterator = 0;
					for(j=0;j<prodInspect[i].shiftBo.length+1;j++) {
						if(prodInspect[i].shiftBo[j] !== undefined) {
							var shiftNo = prodInspect[i].shiftBo[j].shiftNo;
							$('#shiftBo_' + idIterator + '_id').val(prodInspect[i].shiftBo[shiftNo - 1].id);
							$('#shiftBo_' + idIterator + '_shiftNo').val(prodInspect[i].shiftBo[shiftNo - 1].shiftNo);
							$('#shiftBo_' + idIterator + '_shiftInCharge').val(prodInspect[i].shiftBo[shiftNo - 1].shiftInCharge);
							$('#shiftBo_' + idIterator + '_okQuantity').val(prodInspect[i].shiftBo[shiftNo - 1].okQuantity);
							$('#shiftBo_' + idIterator + '_rejectQuantity').val(prodInspect[i].shiftBo[shiftNo - 1].rejectQuantity);
							idIterator++;
							if(j<prodInspect[i].shiftBo.length-1) {
								include = false;
								$(".glyphicon-plus").trigger("click");
							}
						}
					}
				} else {
					isExsist = false;
				}
			}
		}
		if(isExsist) {
			copyDateValueFromSourceToDestId("#prodDteHidId","#prodDateTxtBx");
			showHideBtn();
		}
	}
</script>
<c:if test="${pageTitle eq 'Inspection'}">
	<script>
		$(document).ready(function() {
			$("#productionForm").addClass("hidden");
			$("#addNewDate").remove();
		});	
	</script>
</c:if>
<!-- Restricting the No of production date -->
<%-- <c:if test="${not empty prodInspectDetails && fn:length(prodInspectDetails)==3}"> 
	<script type="text/javascript">
		$(document).ready(function() {
			$("#productionForm").addClass("hidden");
			$("#addNewDate").remove();
		});
	</script>
</c:if> --%>