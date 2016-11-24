 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
 <style>

/* .dropdown-menu > li > a { height:20px; } */

/* .navbar-collapse.collapse {
    display: block !important;
    height: auto !important;
    overflow: visible !important;
    padding-bottom: 0;
}

.navbar {
    border-radius: 0px;
 
}


.container-fluid {
    margin-top: auto;
   
}

/* .navbar-inverse {
    background-color: #3291d1;
    border-color: #3291d1;
} */ */


navbar {
    border-radius: 0px;
    float:left;
 
}


.container-fluid {
    margin-top: auto;
   
}

#myNavbar{
 
   margin-left:20%;
   margin-bottom:1%
}

#companyLogoId
 {
   padding-top:5px;
   padding-left:5px;
   float:left;
   width:55%;
   text-shadow: 0 1px 0 #000;
}

#commonSearchId{
   padding-top:10px;
   padding-left:5px;
   
}

#userSignOutId{

   padding-top:5px;
   padding-left:5px;
   margin-right:5%;
   
}
</style>


<script>



$(document).ready(function() {
  
   
    if ($(document).height() <= $(window).height()) {
    	
    	$(".footer").css("position","fixed");
    }

    // Check if body width is higher than window width :)
   /*  if ($("body").width() > $(window).width()) {
        alert("Horizontal Scrollbar! D:<");
    } */
});





$(document).ready(function () {
  $(".headerLink").click(function(event) {
  
    if($( window ).width()<=768){
    	return true;
    }else{
       return false;
    }
  }); 
  
  
  
 
  $(".nav li.disabled a").click(function() {
	     return false;
   });
  
  
  $("#logoutId").click(function() {
	  
	  var loginurl = "${webapp_path}/logout.sp";
      location.replace(loginurl);
  });
  
  
  /*$(".easy-erp-form").submit(function() {
  	var dateArray = $(".date-format").val().split('-');
  	var newDate = dateArray[2] + '-' + dateArray[1] + '-' + dateArray[0].slice(-2);
  	$(".date-format").val(newDate);
  });*/
});
</script>
 
  <nav class="navbar navbar-inverse" >
  
    <div>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
      <div id="companyLogoId">
	      <a href="${webapp_path}/home.sp">
	       <img style="height:70px; width:140px;" src="${webapp_path}/images/tech_logo.jpg"/>
	      </a>
	      <span style="color:#e6e6e6;font-weight:bold;font-size:16px"> &nbsp;PODA </span>
     </div>
     
     <!-- <div class="col-sm-3 col-md-3 pull-right" id="commonSearchId">
            <form class="navbar-form" role="search" style="border:none;box-shadow:none">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="q" style="width:200px;height:30px">
                    <div class="input-group-btn">
                        <button class="submit-btn" type="submit" style="padding:2.4px 5px;margin-bottom:1px"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                </div>
            </form>
     </div> -->
        
        
    <%--  <div id="userSignOutId">
	     <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">
                    <span class="glyphicon glyphicon-user"> </span>
                        ${sessionScope.user.fullName} (${sessionScope.user.userRole})
                    <b class="caret"></b>
                </a>
                
                <ul class="dropdown-menu">
                    <li><a href="${webapp_path}/logout.sp">Logout  <span class="glyphicon glyphicon glyphicon-off"></span></a> </li>
                     <li><a href="${webapp_path}/managePassword.sp">Manage Password</a></li>
                </ul>
            </li>
        </ul>
     </div>  --%>
     
     <div id="userSignOutId">
	      <ul class="nav navbar-nav pull-right">
	        <li><a href="javascript:void(0)" style="font-size:12px;font-weight:bold;"><i class="glyphicon glyphicon-user"></i> WELCOME,  ${fn:toUpperCase(sessionScope.user.fullName)} (${fn:toUpperCase(sessionScope.user.userRole)})</a></li>
	        <li><a href="${webapp_path}/logout.sp" id="logoutId" style="font-weight:bold;">LOGOUT <span class="glyphicon glyphicon-off"></span></a></li>
	        <%-- <li><a href="${webapp_path}/"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li> --%>
	      </ul>
     </div>  
    
    <div class="collapse navbar-collapse" id="myNavbar" style="clear:both">
      <ul class="nav navbar-nav">
        <li><a href="${webapp_path}/home.sp" style="color:#ff9900"><span class="glyphicon glyphicon-home"> </span>&nbsp;HOME</a></li>
        
        <li class="dropdown">
          <a class="dropdown-toggle headerLink" data-toggle="dropdown" href="#">Title 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${webapp_path}/addgrn.sp">Add GRN</a></li>
            <li><a href="${webapp_path}/listgrn.sp">List GRN</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a class="dropdown-toggle headerLink" data-toggle="dropdown" href="#">Title 2 <span class="caret"></span></a>
          <ul class="dropdown-menu">
          	<c:if test="${sessionScope.user.userRole eq 'Approver' || sessionScope.user.userRole eq 'App Admin'}">
            	<li><a href="${webapp_path}/routecard.sp">Create Route Card</a></li>
            </c:if>
            <li><a href="${webapp_path}/listRouteCard.sp">List Route card</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a class="dropdown-toggle headerLink" data-toggle="dropdown" href="#">Title 3 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${webapp_path}/listInvoice.sp">List Invoice</a></li>
          </ul>
        </li>
        
         <c:if test="${sessionScope.user.userRole eq 'Admin' || sessionScope.user.userRole eq 'Approver' || sessionScope.user.userRole eq 'App Admin'}">
	        <li class="dropdown">
	          <a class="dropdown-toggle headerLink" data-toggle="dropdown" href="#">Admin <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <%-- <li><a href="${webapp_path}/admin/addSupplier.sp">Add Supplier</a></li>
	            <li><a href="${webapp_path}/admin/listSupplier.sp">View Suppliers</a></li>
	             <li class="divider"></li>
	            <li><a href="${webapp_path}/admin/rmTool.sp">Add Raw Material</a></li>
	            <li><a href="${webapp_path}/admin/listRM.sp">List Raw Materials</a></li>
	             <li class="divider"></li>
				<li><a href="${webapp_path}/admin/pricingTool.sp">Add Price </a></li>
				<li><a href="${webapp_path}/admin/listPricing.sp">View Prices</a></li>
				 <li class="divider"></li>
				<li><a href="${webapp_path}/admin/operationTool.sp">Add Operation</a></li>
				<li><a href="${webapp_path}/admin/listOperation.sp">View Operations</a></li>
				 <li class="divider"></li> --%>
				<li><a href="${webapp_path}/admin/listUsers.sp">View Users</a></li>
				<%-- <li class="divider"></li>
				<li><a href="${webapp_path}/admin/departmentTool.sp">Add Department</a></li>
				<li><a href="${webapp_path}/admin/listDepartment.sp">View Departments</a></li> --%>
	          </ul>
	        </li>
        </c:if>
        
          <li class="dropdown">
          <a class="dropdown-toggle headerLink" data-toggle="dropdown" href="javascript:void(0)">Title 5 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${webapp_path}/managePassword.sp">Manage Password</a></li>
          </ul>
        </li>
      </ul>
      
     <!--  search bar div  starts-->
     
     <!-- 
       <div class="col-sm-2 col-md-2">
            <form class="navbar-form" role="search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="q">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                </div>
            </form>
        </div>  -->
        
        <!--  search bar div  ends-->
        
    
     <%--  <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>Vinod, Admin</a></li>
        <li><a href="${webapp_path}/"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
      </ul> --%>
    </div>
    </div>
    
  </nav>  
    



