<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${webapp_path}/js/home.js"></script>

<div class="container">
	<%-- <div class="row">
		<div class="col-md-5">
			<div class="panel panel-info">
				<div class="panel-heading">
				     <span class="glyphicon glyphicon glyphicon-star-empty"></span> Quick Links
				</div>
				<div class="panel-body leftTopDiv">
					<ul class="list-unstyled custom-bullet">
						<li><a href="${webapp_path}/addgrn.sp">Add GRN</a></li>
						<li><a href="${webapp_path}/listgrn.sp">List GRN</a></li>
						<li><a href="${webapp_path}/qualitycheck.sp">Quality Check</a></li>
						<c:if test="${sessionScope.user.userRole eq 'Approver' || sessionScope.user.userRole eq 'App Admin'}">
							<li><a href="${webapp_path}/routecard.sp">Add Route Card</a></li>
						</c:if>
						<li><a href="${webapp_path}/listRouteCard.sp">List Route Card</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col-md-5">
			<div class="panel panel-info"> <!-- panel-primary for blue color -->
				<div class="panel-heading">
				     <span class="glyphicon glyphicon-search"></span> Track
				</div>
				<div class="panel-body rightBottomDiv">
					<form id="trackingForm">
					 <div class="form-group">
	                   <input class="form-control" type="text" name="id" id="hiddenId"/>
	                </div>
	              
						<div class="form-group">
							<select id="trackerID" class="selectBoxGroup" style="outline:0 none">
								<option value="" selected="selected">Select</option>
								<c:forEach var="routeCardDetails" items="${routeCardList}">
									<option value="${routeCardDetails.id}">${routeCardDetails.routeCardNo}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<input type="button" class="submit submit-btn" value="Track" onclick="routeCardSearch()"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!---------------------- second row ------------------------>


	<div class="row">
		<div class="col-md-5">
			<div class="panel panel-info">
				<div class="panel-heading">
				     <span class="glyphicon glyphicon-cog"></span> Settings
				</div>
				<div class="panel-body leftBottomDiv">
					<ul class="list-unstyled custom-bullet">
						<li><a href="${webapp_path}/managePassword.sp">Manage Password</a></li>
					</ul>
				</div>
			</div>
		</div>
    <c:if test="${sessionScope.user.userRole eq 'Admin' || sessionScope.user.userRole eq 'Approver' || sessionScope.user.userRole eq 'App Admin'}">
		<div class="col-md-5">
			<div class="panel panel-info"> <!-- panel-primary for blue color -->
				<div class="panel-heading">
				     <span class="glyphicon  glyphicon glyphicon-user"></span> Admin
				</div>
				<div class="panel-body rightTopDiv">
					<ul class="list-unstyled custom-bullet">
					    <li><a href="${webapp_path}/admin/addSupplier.sp">Manage Suppliers</a></li>
						<li><a href="${webapp_path}/admin/rmTool.sp">RM Tool</a></li>
						<li><a href="${webapp_path}/admin/pricingTool.sp">Pricing Tool</a></li>
						<li><a href="${webapp_path}/admin/operationTool.sp">Operation Tool</a></li>
						<li><a href="${webapp_path}/admin/adduser.sp">User Administration</a></li>
						<li><a href="${webapp_path}/admin/departmentTool.sp">Department Tool</a></li>
						<c:if test="${sessionScope.user.userRole eq 'App Admin'}">
							<li><a href="${webapp_path}/appadmin/listCompanyRegistrations.sp">Approve Registration</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
   </c:if>
	</div> --%>
	<center><h1>Welcome to PEBL Open data archive. We are building ourself.</h1></center>
</div>

<script>
$(document).ready(function() {
	
	  
    $("#hiddenId").focus(); // focus track text box on page load
		
	 var formObj=$('#trackingForm');
     formObj.formValidation({
    framework: 'bootstrap',
    icon: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon ',// removing glyphicon-remove to disable x symbol in text box
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	id: {
            validators: {
                notEmpty: {
                    message: 'Please Scan Or Enter Route Card ID'
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
         
     })
})
</script>

