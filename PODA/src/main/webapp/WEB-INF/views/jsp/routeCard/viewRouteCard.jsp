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
		 width: 100%;
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
	.va-center{
		vertical-align: middle ! important;
	}
</style>

<div class="container">
	<div class="panel panel-primary">
		<div class="panel-body">
			<div class="row paddingbottom20">
				<div class="col-xs-12">
					<button class="submit-btn pull-right" onclick="$('#remarks')[0].focus()">Remarks &nbsp;<span style="color:#fff;" class="glyphicon glyphicon-arrow-down"></span></button>
				</div>
			</div>
			<c:choose>
				<c:when test="${not empty routeCardDetails}">
					<form id="viewForm">
						<input type="hidden" id="hiddenObjId" name="id"/>
						<div class="table-responsive">
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th rowspan="2" colspan="2"><img src="${webapp_path}/images/stanson_logo.png"/></th>
										<th colspan="7"><h4><b>STANSON PLASTIC PRODUCTS</b></h4></th>
										<th colspan="3"><span><b>Doc.No : </b></span>F/PRD/07</th>
									</tr>
									<tr>
										<th colspan="7"><h4><b>ROUTE CARD</b></h4></th>
										<th colspan="3"><span><b>Rev.No./Date : </b></span>01/02.01.2016</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-left" colspan="2">Part No</td>
										<td colspan="4">${routeCardDetails.partNumber}</td>
										<td class="text-left" colspan="2">Route card No</td>
										<td colspan="4">${routeCardDetails.routeCardNo}</td>
									</tr>
									<tr>
										<td class="text-left" colspan="2">Part Name</td>
										<td colspan="4">${routeCardDetails.partName}</td>
										<td class="text-left" colspan="2">Route card start date</td>
										<td class="indDateFormat" colspan="4">${routeCardDetails.createdDate}</td>
									</tr>
									<tr>
										<td class="text-left" colspan="2">Model</td>
										<td colspan="4">${routeCardDetails.modelName}</td>
										<td class="text-left" colspan="2">Route card end date</td>
										<td class="indDateFormat" colspan="4">${routeCardDetails.lastModifiedDate}</td>
									</tr>
									<tr>
										<th colspan="12"><h4><b>R/M ISSUE DETAILS</b></h4></th>
									</tr>
									<tr>
										<td class="text-left" colspan="2">RM Spec</td>
										<td colspan="4">${routeCardDetails.rmSpecification}</td>
										<td class="text-left" colspan="2">RM GRN No</td>
										<td colspan="4" class="clickableTd" onclick="viewGrn('${routeCardDetails.grnId}')"><b>${routeCardDetails.grnNo}</b></td>
									</tr>
									<tr>
										<td class="text-left" colspan="2">RM Grade</td>
										<td colspan="4">${routeCardDetails.rmGrade}</td>
										<td class="text-left" colspan="2">RM Lot No</td>
										<td colspan="4">${routeCardDetails.rmLotNo}</td>
									</tr>
									<tr>
										<td class="text-left" colspan="2">Plan Qty (Nos)</td>
										<td colspan="4">${routeCardDetails.planQuantity}</td>
										<td class="text-left" colspan="2">Issued By</td>
										<td colspan="4" title="${routeCardDetails.userBOList[0].fullNameWithUserName}">${routeCardDetails.userBOList[0].fullName}</td> <!-- userlist[0] will be Issued By -->
									</tr>
									<tr>
										<td class="text-left" colspan="2">Equivalent RM issued(Kgs)</td>
										<td colspan="4">${routeCardDetails.issuedQuantity}</td>
										<td class="text-left" colspan="2">Received By</td>
										<td colspan="4" title="${routeCardDetails.userBOList[1].fullNameWithUserName}">${routeCardDetails.userBOList[1].fullName}</td> <!-- userlist[0] will be Received By -->
									</tr>
									<tr>
										<th colspan="12"><h4><b>PRODUCTION DETAILS</b></h4></th>
									</tr>
									<tr>
										<td class="text-left" colspan="2">Machine Name</td>
										<td colspan="4">${routeCardDetails.machineName}</td>
										<td class="text-left" colspan="2">Operation</td>
										<td colspan="4">${routeCardDetails.operationName}</td>
									</tr>
									<c:choose>
										<c:when test="${not empty productionDetails && fn:length(productionDetails)>0}">
											<thead>
												
												<tr>
													<th rowspan="3" class="va-center">Date</th>
													<th colspan="9">Shift Details</th>
													<th rowspan="2" colspan="2"  class="va-center">Grand Total</th>
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
												<c:forEach var="obj" items="${productionDetails}">
													<tr>
														<td class="indDateFormat">${obj.productionDate}</td>
														<c:set var="shiftBoLength" scope="session" value="${fn:length(obj.shiftBo)+1}"/>
														<c:forEach var="shiftDetails" items="${obj.shiftBo}">
															<td class="text-left" title="${shiftDetails.fullNameWithUserName}">${shiftDetails.fullName}</td>
														</c:forEach>
														<c:forEach begin="${shiftBoLength}" end="3">
															<td>----</td>
														</c:forEach>
														<c:forEach var="shiftDetails" items="${obj.shiftBo}">
															<td>${shiftDetails.okQuantity}</td>
														</c:forEach>
														<c:forEach begin="${shiftBoLength}" end="3">
															<td>----</td>
														</c:forEach>
														<c:forEach var="shiftDetails" items="${obj.shiftBo}">
															<td>${shiftDetails.rejectQuantity}</td>
														</c:forEach>
														<c:forEach begin="${shiftBoLength}" end="3">
															<td>----</td>
														</c:forEach>
														<td>${obj.totalOkQuantity}</td>
														<td>${obj.totalRejectQuantity}</td>
													</tr>
												</c:forEach>
											</tbody>
										</c:when>
										<c:otherwise>
									        <tr class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px"><th colspan="12">No Production Records Yet &#9785;</th></tr>
									    </c:otherwise>
									</c:choose>
									<tr>
										<th colspan="12"><h4><b>INSPECTION DETAILS</b></h4></th>
									</tr>
									<c:choose>
										<c:when test="${not empty inspectionDetails && fn:length(inspectionDetails)>0}">
											<thead>
												<tr>
													<th rowspan="3" class="va-center">Date</th>
													<th colspan="9">Shift Details</th>
													<th rowspan="2" colspan="2"  class="va-center">Grand Total</th>
												</tr>
												<tr>
													<th colspan="3">Inspector Name</th>
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
												<c:forEach var="obj" items="${inspectionDetails}">
													<tr>
														<td class="indDateFormat">${obj.productionDate}</td>
														<c:set var="shiftBoLength" scope="session" value="${fn:length(obj.shiftBo)+1}"/>
														<c:forEach var="shiftDetails" items="${obj.shiftBo}">
															<td class="text-left" title="${shiftDetails.fullNameWithUserName}">${shiftDetails.fullName}</td>
														</c:forEach>
														<c:forEach begin="${shiftBoLength}" end="3">
															<td>----</td>
														</c:forEach>
														<c:forEach var="shiftDetails" items="${obj.shiftBo}">
															<td>${shiftDetails.okQuantity}</td>
														</c:forEach>
														<c:forEach begin="${shiftBoLength}" end="3">
															<td>----</td>
														</c:forEach>
														<c:forEach var="shiftDetails" items="${obj.shiftBo}">
															<td>${shiftDetails.rejectQuantity}</td>
														</c:forEach>
														<c:forEach begin="${shiftBoLength}" end="3">
															<td>----</td>
														</c:forEach>
														<td>${obj.totalOkQuantity}</td>
														<td>${obj.totalRejectQuantity}</td>
													</tr>
												</c:forEach>
											</tbody>
										</c:when>
										<c:otherwise>
									        <tr class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px"><th colspan="12">No Inspection Records Yet &#9785;</th></tr>
									    </c:otherwise>
									</c:choose>
									<tr>
										<th colspan="12"><h4><b>DESPATCH TO CUSTOMER</b></h4></th>
									</tr>
									<c:choose>
										<c:when test="${not empty invoiceDetails && fn:length(invoiceDetails)>0}">
											<thead>
												<tr>
												<c:forEach begin="1" end="2">
													<th>Date</th>
													<th colspan="2">Invoice Number</th>
													<th colspan="2">Generated By</th>
													<th>Qty (Nos)</th>
												</c:forEach>
												</tr>
											</thead>
											<tbody>
												<tr>
													<c:forEach var="obj" items="${invoiceDetails}" varStatus="loop">
										        	    <td class="indDateFormat">${obj.invoiceDate}</td>
														<td colspan="2">${obj.invoiceNumber}</td>
														<td colspan="2" title="${obj.fullNameWithUserName}">${obj.fullName}</td>
														<td>${obj.quantity}</td>
														<c:set var="i" value="${loop.index}"></c:set>
														<c:if test="${(i mod 2) != 0}">
															</tr><tr>
														</c:if>
													</c:forEach>
											    </tr>
											</tbody>
										</c:when>
										<c:otherwise>
											<tr class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px"><th colspan="12">No Invoice Yet &#9785;</th></tr>
									    </c:otherwise>
									</c:choose>
									<tr>
										<th colspan="12"><h4><b>Remarks</b></h4></th>
									</tr>
									<tr>
										<c:choose>
											<c:when test="${not empty routeCardDetails.remarks}">
												<td colspan="10" id="remarks" tabindex="1" style="text-align: left;">${routeCardDetails.remarks}</td>
											</c:when>
											<c:otherwise>
												<td colspan="10" id="remarks" tabindex="1" style="text-align: left;">No remarks yet</td>
											</c:otherwise>
										</c:choose>
										<td colspan="2">
											<div class="form-group">
												<input type="button" class="submit-btn" onclick="updatePopUp(${routeCardDetails.id})" value="Update">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</c:when>
				<c:otherwise>
			        <div class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px">No Information Yet &#9785;</div>
			    </c:otherwise>
			</c:choose>
        </div>
   	</div>
</div>

<!--      Barcode Image popup starts      -->
   <div class="modal fade" id="modalBarcodeImgID" tabindex="-1" role="dialog" aria-labelledby="modalGrnID">
     <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <h3 class="modal-title" style="color:#dc446e" ><span>Remarks</span></h3>
                 <h4 class="modal-title" id="modalGrnNoID">Route Card NO :</h4>
            </div>
            <form:form id="addRemarksForm">
	            <div class="modal-body">
	      		 	<form:hidden path="id"/>
					<div class="form-group">
						<form:textarea class="form-control" path="remarks" placeholder="Enter Remarks"/>
					</div>
				</div>
			    <div class="modal-footer">
			  	    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-primary">Update</button>
			    </div>
		    </form:form>
    	</div>
 	 </div>
	</div>
<!--      Barcode Image popup ends      -->

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $('#addRemarksForm');
		formObj.formValidation({
		    framework: 'bootstrap',
		    icon: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon ',// removing glyphicon-remove to disable x symbol in text box
		        validating: 'glyphicon glyphicon-refresh'
		    },
		    fields: {
		    	remarks: {
		    		validators: {
		                notEmpty: {
		                    message: 'Remarks is required'
		                },
		                stringLength: {
                			max:256,
                            message: 'Only 400 characters allowed'
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
	    .on('success.form.fv', function(e){
        	e.preventDefault();
        	var url = "updateRemarks.sp";
        	trimFormInputs();
            var jsondata=submitFrm(this,url);
            redirectToLoginIfNotAJsonObject(jsondata);
            if(jsondata.returnId>0){
            	location.reload();
			}else{
				 msg="<h3>"+jObject.returnMsg+"</h3>";
				 dialogType=BootstrapDialog.TYPE_DANGER;
				 btnStyle="dialogBoxError";
				 isSuccess=false;
			}
            showDialog(dialogType,btnStyle,msg,formObj,isSuccess);
        });
	    
	});
	
	 function updatePopUp(id){
		 var url="${webapp_path}/getbarcode.sp";
		 $("#modalGrnNoID").html("Route Card No : " + id);
		 $("#modalBarcodeImgID").modal('show');
	 }
	 
	 function viewGrn(id){
		 var url="editGrn.sp";
		 $("#hiddenObjId").val(id)
		 $("#viewForm").attr('action', url);
		 $("#viewForm").attr('method', "POST");
		 $("#viewForm").submit();
	 }
	 
</script>
