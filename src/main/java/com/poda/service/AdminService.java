package com.poda.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.poda.model.TaskTypeBO;
import com.poda.utils.TableNames;

/**
 * @author Nishanth Gandhidoss
 *
 */

@Service
public class AdminService extends CommonService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminService.class);

	@Transactional(rollbackFor=Exception.class, propagation=Propagation.REQUIRED) 
	public synchronized TaskTypeBO insertTaskType(TaskTypeBO tasktypeBO) throws Exception {
		logger.info("Inside insertTaskType");
	    if(isValueExists(tasktypeBO, TableNames.TBL_TASK_TYPE, "TASK_TYPE", tasktypeBO.getTaskType())){
	    	tasktypeBO.setReturnMsg("Task Type Already Exists, please edit existing Task Type.");
	    	throw new Exception("Task Type Already Exists");
	    }
	    String queryId = "insertTaskType";
		int returnId= (int) getCommonDAO().create(tasktypeBO, queryId);
		if(returnId<1){
			tasktypeBO.setReturnMsg(getErrorMSg());
        	throw new Exception("Error Inserting Task type");
		}
		tasktypeBO.setReturnId(returnId);// returnId initially set as -1 in CommonBO
		logger.info("Ending insertTaskType -- Insert success");
	    return tasktypeBO;
	}

	public List<String> getHeaderList(){
		List<String> headerList = new ArrayList<String>();
		headerList.add("ID");
		headerList.add("Action");
		headerList.add("Task Type");
		headerList.add("Enabled");
		headerList.add("Created Date");
		headerList.add("Created By");
		headerList.add("Task Description");
		return headerList;
	}
	
	public List<String> getRequiredPropertiesList() {
		String includedProps[]={"taskType","isEnabledString", "createdDate","createdBy","taskTypeDescription"};
		return Arrays.asList(includedProps);
	}
	
	@Transactional(rollbackFor=Exception.class, propagation=Propagation.REQUIRED) 
	public synchronized TaskTypeBO updateTaskType(TaskTypeBO tasktypeBO) throws Exception{
		logger.info("Inside updateTaskType");
		if(isValueExists(tasktypeBO, TableNames.TBL_TASK_TYPE, "TASK_TYPE", tasktypeBO.getTaskType())) {
			tasktypeBO.setReturnMsg("Task Type Already Exists, please edit existing Task Type.");
	    	throw new Exception("Task Type Already Exists");
	    }
	    String queryId = "updateTaskType";
		int returnId= (int) getCommonDAO().update(tasktypeBO, queryId);

		if (returnId < 1) {
			tasktypeBO.setReturnMsg(getErrorMSg());
			throw new Exception("Error updating Task type");
		}
	    
		tasktypeBO.setReturnId(returnId);
		logger.info("Update success");
		return tasktypeBO;
	}
	
	public synchronized TaskTypeBO deleteTaskType(TaskTypeBO tasktypeBO) throws Exception {
		logger.info("Inside deleteTaskType");
		String queryId="deleteTaskType";
		int returnId = -1;
		try {
			boolean isTaskTypeUsed = isTaskTypeUsed(tasktypeBO);
			if(!isTaskTypeUsed) {
				returnId = getCommonDAO().delete(tasktypeBO.getId(), queryId);
				tasktypeBO.setReturnId(returnId);
				tasktypeBO.setReturnMsg(getDeleteSuccessMsg());
				if(returnId < 0) {
					tasktypeBO.setReturnMsg(getErrorMSg());
					throw new Exception("Error Deleting Task type");
				}
			} else {
				tasktypeBO.setReturnId(returnId);
				tasktypeBO.setReturnMsg("Task type can't be deleted, since it's used in Existing Study.");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		logger.info("Outside deleteTaskType");
	 	return tasktypeBO;
	}
	
	public boolean isTaskTypeUsed(TaskTypeBO tasktypeBO) {
		logger.info("Inside isTaskTypeUsed");
		String queryId = "isTaskTypeUsed";
		boolean isTaskTypeUsed = false;
		try{
			isTaskTypeUsed = (boolean)getCommonDAO().isExists(queryId, tasktypeBO);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		logger.info("Outside isTaskTypeUsed");
		return isTaskTypeUsed;
	}

}
