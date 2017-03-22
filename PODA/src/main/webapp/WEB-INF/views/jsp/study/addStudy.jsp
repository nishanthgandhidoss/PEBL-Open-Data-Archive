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
	.custom-link-effect:hover {
		color: #0e6098;
		cursor: pointer ! important;
		font-size: 1.1em;
	}
	#fileLabel {font-weight: normal}
</style>



<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
	    	<c:choose>
			    <c:when test="${cmd eq editCmd}">
			        Update Study
			    </c:when>    
			    <c:otherwise>
			        Create Study
			    </c:otherwise>
			</c:choose>
	  		<a href="${webapp_path}/listStudy.sp" class="pull-right tooltipLink" data-toggle="tooltip" title="List Study">
	  			<span class="glyphicon  glyphicon-th-list pull-right"></span>
	  		</a> 
	  	</div>
		<span class="mandatoryId mandatorytoplabel">*&nbsp;Mandatory fields</span> 
		 <div class="panel-body">
		 
			<form:form id="studyForm" enctype="multipart/form-data" method="POST">
				
				<!-- Hidden Variables -->
				<form:hidden path="id"/>
				<form:hidden path="isDatasetsChanged"/>
				
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
				
				<c:set var="dataSetList" scope="session" value="${command.dataSetBO}"/>
				
				<c:if test="${cmd eq editCmd && empty dataSetList}">
	    			<div class="alert alert-info" style="text-align:center;font-weight:bold;font-size:24px">No Dataset Yet &#9785;</div>
	    		</c:if>
	    		
				
				<c:if test="${cmd eq editCmd || not empty dataSetList}">	
					<div class="form-group">
			    		<h4><label class="control-label">Datasets</label></h4>
			    	</div>
		    		<c:if test="${not empty dataSetList}">
		    			<div class="table-responsive">
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th colspan="10">Dataset Name</th>
										<th colspan="2">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dataSet" items="${dataSetList}">
										<tr>
				    						<td colspan="10">${dataSet.dataSetName}</td>
				    						<td colspan="2">
				    							<c:if test="${dataSet.isEditable=='Y'}">
									               <a href="javascript:void(0)" onclick="updateDataSet('${dataSet.id}', '${dataSet.dataSetName}', '${dataSet.taskType}', '${dataSet.fileName}')" class="tooltipLink" data-toggle="tooltip" title="Edit"><span style="color:#3291d1;padding-left:10px" class="glyphicon glyphicon-edit"></span></a>
									            </c:if>
									            <c:if test="${dataSet.isRemovable=='Y'}">
								                   <a href="javascript:void(0)" class="tooltipLink" data-toggle="tooltip" title="Delete"><span style="color:#dc446e;padding-left:10px" class="glyphicon glyphicon-trash"></span></a>
								                </c:if>
				    						</td>
				    					</tr> 
									</c:forEach>
								</tbody>
				    		</table>
				    	</div>	
		    		</c:if>
			    </c:if>
				
				
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
				    	<form:hidden path="dataSetBO[0].isFileChanged"/>
				    	<div class="col-xs-4">
				    		<form:input class="form-control" path="dataSetBO[0].file" type="file"/>
				    	</div>
				        <div class="col-xs-4">
				            <form:input class="form-control" path="dataSetBO[0].dataSetName"/>
				        </div>
				        <div class="col-xs-3">
				            <form:select path="dataSetBO[0].taskType" class="form-control">
						    	<form:option value="" selected="selected">Select</form:option>
						    	<form:options items="${taskTypeList}" itemLabel="taskType" itemValue="id"/>
						    </form:select>
				        </div>
				        <div class="col-xs-1">
				            <button type="button" class="btn btn-default addButton"><i class="glyphicon glyphicon-plus pointercursor appgreen"></i></button>
				        </div>
				    </div>
				
				    <div class="form-group row hide" id="dataSetTemplate">
				    	<input type="hidden"  class="form-control" name="isFileChanged"/>
				    	<div class="col-xs-4">
				    		<input class="form-control" name="file" type="file" />
				    	</div>
				        <div class="col-xs-4">
				            <input class="form-control" name="dataSetName" type="text"/>
				        </div>
				        <div class="col-xs-3">
				            <select name="taskType" class="form-control">
						  		<option value="" selected="selected">Select</option>
						  		<c:forEach var="taskType" items="${taskTypeList}">
						  			<option value="${taskType.id}">${taskType.taskType}</option>
						  		</c:forEach>
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

<c:if test="${cmd eq editCmd || not empty dataSetList}">
	<div class="modal fade" id="updateDataSet" tabindex="-1" role="dialog" aria-labelledby="modalGrnID">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h3 class="modal-title" style="color:#dc446e" ><span>Dataset Update</span></h3>
				</div>
				<div class="modal-body">
					<form id="dataSetForm" enctype="multipart/form-data" method="POST">
						<input name="id" id="dataSetId" type="hidden"/>
						<div class="form-group">
							<label class="control-label">Dataset Name </label> 
						 	<input name="dataSetName" id="dataSetName" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label class="control-label">Task type</label> 
						 	<select name="taskType" class="form-control">
						    	<option value="" selected="selected">Select</option>
						    	<c:forEach items="${taskTypeList}" var="taskTypeBO">
						    		<option value="${taskTypeBO.id}">${taskTypeBO.taskType}</option>
						    	</c:forEach>
						    </select>
						</div>
						
						<div class="form-group">
							<label class="control-label">File </label> 
							<input class="hidden" type="file" id="file" name="file" onchange="fileChange()"><br>
						 	<a class="btn btn-primary" id="dummyBrowse">Browse</a>
						 	<label class="control-label" id="fileLabel" style="padding-left: 10px;">Choose file</label>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="printBarcode()">Update</button>
				</div>
			</div>
		</div>
	</div>
</c:if>