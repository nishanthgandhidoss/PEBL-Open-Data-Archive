<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="editCmd" expression="T(com.poda.utils.Constants).ACTION_EDIT"/>

<script type="text/javascript" src="${webapp_path}/js/study/addStudy.js"></script>

<style type="text/css">

	.mandatoryId {
		color: crimson
	}
	.container {
		 margin: 0 auto;
		 padding: 0 30px;
		 width:60%;
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
		  Create Study
		  <c:if test="${cmd eq editCmd}">
		  	&nbsp;|&nbsp;Update
		  </c:if>
		  <a href="${webapp_path}/listStudy.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Study">
		  <span class="glyphicon  glyphicon-th-list pull-right"></span>
		  </a> 
		  </div>
		<span class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</span> 
		 <div class="panel-body">
		 
			<form:form id="studyForm" enctype="multipart/form-data" method="POST" action="createStudy.sp">
				<form:hidden path="id"/>
				<div class="form-group">
					<label class="control-label"><span title="required" class="mandatoryId">*</span>Study Name </label> 
				    <form:input path="studyName" class="form-control"/>
				</div>
				
				<div class="form-group">
					<label class="control-label"><span title="required" class="mandatoryId">*</span>Study Description </label> 
				    <form:textarea path="studyDesc" class="form-control"/>
				</div>
				
				<div class="form-group">
					<label class="control-label"><span title="required" class="mandatoryId">*</span>Study License </label> 
				    <form:input path="license" class="form-control"/>
				</div>

				<div class="form-group">
					<label class="control-label"><span title="required" class="mandatoryId">*</span>Public </label> 
				 	<div class="row">
						  <div class="col-md-1">Yes</div>
						  <div class="col-md-1"><form:radiobutton path="isPublic" class="form-control" style="padding-left:8px" value="1"/></div>
						  <div class="col-md-1">No</div>
						  <div class="col-md-1"><form:radiobutton path="isPublic" class="form-control" style="padding-left:8px" value="0"/></div>
			    	 </div>
				</div>
				
				<div class="form-group">
					<label class="control-label">Authors </label> 
				 	<form:input path="authors" class="form-control"/>
				</div>
				
				<div class="form-group">
					<label class="control-label">Publication </label> 
				 	<form:input path="publication" class="form-control"/>
				</div>
				
				<div class="form-group">
					<label class="control-label">Contact </label> 
				 	<form:input path="contact" class="form-control"/>
				</div>
				
				<div class="form-group">
					<label class="control-label">Site Collected </label> 
				 	<form:input path="siteCollected" class="form-control"/>
				</div>
				
				<div class="form-group">
					<input class="submit-btn" id="addDatasetBtn" value="Add Datasets Now" type="button"/>
				</div>
				
				<div class="form-group hidden" id="dataSetDetail">
			    	<div class="form-group">
			    		<h4>Add Datasets</h4>
			    	</div>
			    	<div class="form-group">
			    		<div class="col-xs-4">
				            <label class="control-label"><span class="mandatoryId">*</span>Choose File</label>
				        </div>
			    		<div class="col-xs-4">
				            <label class="control-label"><span class="mandatoryId">*</span>Dataset Name</label>
				        </div>
				        <div class="col-xs-2">
				            <label class="control-label"><span class="mandatoryId">*</span>Task type</label>
				        </div>
			    	</div>
				    <div class="form-group row">
				    	<div class="col-xs-4">
				    		<form:input class="form-control fileUpload" path="dataSetBO[0].file" type="file"/>
				    	</div>
				        <div class="col-xs-4">
				            <form:input class="form-control" path="dataSetBO[0].dataSetName"/>
				        </div>
				        <div class="col-xs-3">
				            <form:select path="dataSetBO[0].taskType" class="form-control taskTypeGroup">
						  		<form:option value="" selected="selected">Select</form:option>
						  		<form:option value="1">Type I</form:option>
						  		<form:option value="2">Type II</form:option>
						  		<form:option value="3">Type III</form:option>
					        </form:select>
				        </div>
				        <div class="col-xs-1">
				            <button type="button" class="btn btn-default addButton"><i class="glyphicon glyphicon-plus pointercursor appgreen"></i></button>
				        </div>
				    </div>
				
				    <div class="form-group row hide" id="dataSetTemplate">
				    	<div class="col-xs-4">
				    		<input class="form-control fileUpload" name="file" type="file" />
				    	</div>
				        <div class="col-xs-4">
				            <input class="form-control" name="dataSetName" type="text"/>
				        </div>
				        <div class="col-xs-3">
				            <select name="taskType" class="form-control taskTypeGroup">
						  		<option value="" selected="selected">Select</option>
						  		<option value="1">Type I</option>
						  		<option value="2">Type II</option>
						  		<option value="3">Type III</option>
					        </select>
				        </div>
				        <div class="col-xs-1" id="removeBtnDiv">
				            <button type="button" class="btn btn-default removeButton"><i class="glyphicon glyphicon-minus pointercursor" style="color:#dc446e"></i></button>
				        </div>
				    </div>
			    </div>
			    
			    <div class="form-group">
					<c:choose>
	              			<c:when test="${cmd eq editCmd}">
							<input class="submit-btn" name="commit" id="update-btn" value="Update" type="submit"/>
						</c:when>
						<c:otherwise>
				   			<input class="submit-btn" name="commit" id="save-btn" value="Submit" type="submit"/>
				   			<input type="button" class="submit-btn marginleft10" value="Reset"  onclick="resetForm(this.form)"/> 
				   		</c:otherwise>
				   	</c:choose>
			   	</div>
	   		</form:form>
		</div>
	</div>
</div>