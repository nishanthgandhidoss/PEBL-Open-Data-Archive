package com.poda.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.poda.model.TaskTypeBO;
import com.poda.model.UserBO;

@Service
public class HomeService extends CommonService {

	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);

	public ArrayList<TaskTypeBO> welcomePage(TaskTypeBO taskTypeBO) throws Exception {
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("id", 1);
		ArrayList<TaskTypeBO> taskType = (ArrayList<TaskTypeBO>) getCommonDAO().getRecordListByObject("getTaskTypeList", taskTypeBO);
		return taskType;
	}
	
	

	/*@SuppressWarnings("unchecked")
	public List<E> getRouteCardIdAndNo(Long id, Long orgId) throws Exception {
		logger.info("Inside getRouteCardIdAndNo");
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("orgId", orgId);
		inputMap.put("id", id);
		ArrayList<E> routeCardList = (ArrayList<RouteCardBO>) getCommonDAO().getRecordListByMap("getRouteCardIdAndNo", inputMap);
		logger.info("Inside getRouteCardIdAndNo");
		return routeCardList;
	}*/

	/*@SuppressWarnings("unchecked")
	public UserBO getUserListByUserName(String UserName) throws Exception {
	
        ArrayList <UserBO>userList= new ArrayList<UserBO>();
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("userName",UserName);
		userList = (ArrayList) getCommonDAO().getRecordListByMap("getUsersListByUserName", inputMap);
		return userList.get(0);
		
	}*/
}
