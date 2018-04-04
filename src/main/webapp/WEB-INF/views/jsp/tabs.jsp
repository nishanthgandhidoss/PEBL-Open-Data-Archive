<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Responsive Tabs</title>

<!--   <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/style.min.css"> -->
<link rel="stylesheet"
	href="${webapp_path}/css/commoncss/font-awesome.min.css">

<link rel="stylesheet" href="${webapp_path}/css/commoncss/tabs.css">
<style type="text/css">
.mandatoryId {
	color: crimson
}

.mandatorytoplabel {
	font-style: italic;
	margin: 10px;
	font-size: 12px
}
</style>
</head>
<body>
  
<header class="o-header">

  <div class="o-container">
    <h1 class="o-header__title">Employee Details</h1>
  </div>
</header>

  <div class="o-container">

    <div class="o-section">
      <div id="tabs" class="c-tabs no-js">
        <div class="c-tabs-nav">
          <a href="#" class="c-tabs-nav__link is-active">
            <i class="fa fa-home"></i>
            <span>Personal Information</span>
          </a>
          <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-book"></i>
            <span>Educational Information</span>
          </a>
          <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-heart"></i>
            <span>Favourites</span>
          </a>
          <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-calendar"></i>
            <span>Calendar</span>
          </a>
          <a href="#" class="c-tabs-nav__link">
            <i class="fa fa-cog"></i>
            <span>Settings</span>
          </a>
        </div>
        <form action="">
        <div class="c-tab is-active">
          <div class="c-tab__content">
            <div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Employee ID </label> 
					 <input class="string email required form-control" id=""
						        placeholder="Enter Employee ID"/>
			</div>
			<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Employee Full Name </label>
						<input 
							class="string email required form-control" id=""
							placeholder="Enter Employee Name" />
			</div>
			<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Father Name </label> 
					    <input 
							class="string email required form-control" id=""
							 placeholder="Enter Father Name"/>
			</div>
			<div class="form-group email required user_basic_email">
						<label for="dtp_input2" class=" email required user_basic_email control-label">
						<span
							title="required" class="mandatoryId">*</span>Date of Birth
							Picking</label>
						<div class="input-group date form_date " data-date=""
							data-date-format="dd-MM-yyyy" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control"  type="text" value=""
								readonly> <span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" path="grnDate" /><br />
			</div>
			<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Educational Qualification </label> 
					    <input 
							class="string email required form-control" id=""
							 placeholder="Enter Educational Qualification"/>
			</div>
			<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Contact No </label> 
					    <input 
							class="string email required form-control" id=""
							 placeholder="Enter Contact No"/>
			</div>
          </div>
        </div>
        <div class="c-tab">
          <div class="c-tab__content">
            <div class="form-group email required user_basic_email">
				<label class="email required control-label" for="user_basic_email"><span
					title="required" class="mandatoryId">*</span>Local Address </label> 
			    <input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="City"/>
				<input class="string email required form-control" id=""
					 placeholder="State"/>
				<input class="string email required form-control" id=""
					 placeholder="Country"/>
			</div>
			<div>
				<input type="checkbox"/>&nbspSame As Local Address
			</div>
			<div class="form-group email required user_basic_email">
				<label class="email required control-label" for="user_basic_email"><span
					title="required" class="mandatoryId">*</span>Permanent Address </label> 
			    <input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="Line 1"/>
				<input class="string email required form-control" id=""
					 placeholder="City"/>
				<input class="string email required form-control" id=""
					 placeholder="State"/>
				<input class="string email required form-control" id=""
					 placeholder="Country"/>
			</div>
          </div>
        </div>
        <div class="c-tab">
          <div class="c-tab__content">
            					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Experience </label> 
					    <input 
							class="string email required form-control" id=""
							 placeholder="Enter Experience"/>
					</div>
					
					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Date of Joining </label> 
					    <input
							class="string email required form-control" id=""
							 placeholder="Enter Date of Joining"/>
					</div>
					
					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Department </label> 
					    <input
							class="string email required form-control" id=""
							 placeholder="Enter Department"/>
					</div>
					
					<div class="form-group email required user_basic_email">
						<label class="email required control-label" for="user_basic_email"><span
							title="required" class="mandatoryId">*</span>Reference </label> 
					    <input 
							class="string email required form-control" id=""
							 placeholder="Enter Reference"/>
					</div>
					<input class="btn btn-default" name="commit" value="Submit"
							type="submit"/>
          </div>
        </div>
        <!-- <div class="c-tab">
          <div class="c-tab__content">
            <h2>Stay Busy</h2>
            <p>Calendar ipsum dolor sit amet, consectetur adipisicing elit. Ipsam quo minus voluptate unde tempore eveniet consequuntur in, quod animi libero rem similique pariatur quos, et eum nisi ducimus, architecto voluptatibus!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto aspernatur natus dolorem fuga cumque optio saepe corrupti earum. Ipsam quaerat asperiores similique omnis excepturi temporibus ab eum magnam ipsa, odio.</p>
          </div>
        </div>
        <div class="c-tab">
          <div class="c-tab__content">
            <h2>Change It Up</h2>
            <p>Settings ipsum dolor sit amet, consectetur adipisicing elit. Ipsam quo minus voluptate unde tempore eveniet consequuntur in, quod animi libero rem similique pariatur quos, et eum nisi ducimus, architecto voluptatibus!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto aspernatur natus dolorem fuga cumque optio saepe corrupti earum. Ipsam quaerat asperiores similique omnis excepturi temporibus ab eum magnam ipsa, odio.</p>
          </div> -->
          
        </div>
        </form>
      </div>
    </div>

  
  </div>

<!-- <script src="js/src/tabs.js"></script> -->
<script>
  var myTabs = tabs({
    el: '#tabs',
    tabNavigationLinks: '.c-tabs-nav__link',
    tabContentContainers: '.c-tab'
  });

  myTabs.init();
</script>
</body>
</html>