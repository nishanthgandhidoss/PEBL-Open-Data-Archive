package com.poda.service;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.poda.dao.CommonDAOImpl;
import com.poda.model.CommonBO;
import com.poda.model.DataSetBO;
import com.poda.model.StudyBO;
import com.poda.model.TaskTypeBO;
import com.poda.model.UserBO;
import com.poda.utils.Constants;
import com.poda.utils.Utils;

@Service
public class CommonService {
	
	@Autowired
	CommonDAOImpl commonDAO;
	
	public CommonDAOImpl getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAOImpl commonDAO) {
		this.commonDAO = commonDAO;
	}
	

	public synchronized Long getNextId(String tableName,String id) throws Exception{
		
		CommonBO commonBo= new CommonBO();
		commonBo.setTableName(tableName);
		commonBo.setColumnName(id);
		Long count = 0L;
		count =getCommonDAO().getNextId("getNextId",commonBo);
		return count;
	
	}
	

	public Long getNextIdByOrg(String tableName, String columnName, Long orgId) throws Exception {
		CommonBO commonBO= new CommonBO();
		commonBO.setTableName(tableName);
		commonBO.setColumnName(columnName);
		commonBO.setOrgId(orgId);
		Long count = 0L;
		count =getCommonDAO().getNextId("getNextIdByOrg",commonBO);
		return count;
	}
	
	public String getLastValueByOrg(String tableName, String columnName, Long orgId) throws Exception {
		CommonBO commonBO= new CommonBO();
		commonBO.setTableName(tableName);
		commonBO.setColumnName(columnName);
		commonBO.setOrgId(orgId);
		String lastValue = getCommonDAO().getLastValue("getLastValueByOrg",commonBO);
		return lastValue;
	}

	public void writeToJSON(HttpServletResponse res, Object obj) throws IOException {
	   
		String jsonString= Utils.parseAsJson(obj);
		res.setContentType("application/json;");  
		res.setCharacterEncoding("UTF-8"); 
		res.getWriter().write(jsonString);
	}
	
	public void writeToJSONDate(HttpServletResponse res, Map mp) throws IOException {
		   
		String jsonString= Utils.parseAsJson(mp);
		res.setContentType("application/json;");  
		res.setCharacterEncoding("UTF-8"); 
		res.getWriter().write(jsonString);
	}
	
	public void setIPAddress(HttpServletRequest req,Object bo){
		
		String hostIp = req.getRemoteAddr();
		((CommonBO) bo).setCreatedIp(hostIp);
	}
	
	public void setModifiedIPAddress(HttpServletRequest req,Object bo){
		String hostIp = req.getRemoteAddr();
		((CommonBO) bo).setLastModifiedIp(hostIp);
	}
	
	public List<String> getPropertiesNameList(Class<?> classObj)
			throws IllegalArgumentException, IllegalAccessException {

		List<String> propertyList = new ArrayList<String>();

		for (Field f : classObj.getDeclaredFields()) {
			f.setAccessible(true);
			String propertyName = f.getName();
			propertyList.add(propertyName);
		}

		for (Field f : classObj.getSuperclass().getDeclaredFields()) {
			f.setAccessible(true);
			String propertyName = f.getName();
			propertyList.add(propertyName);
		}

		return propertyList;
	}
	
	public boolean isValueExists(CommonBO commonBO, String tableName, String columnName, Object columnValue) throws Exception{
		String queryId = "isValueExists";
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		
		if(Constants.ACTION_UPDATE.equals(commonBO.getCmd()))
		     queryId = "isValueExistsUpdate";
		inputMap.put("tableName", tableName);
		inputMap.put("columnName", columnName);
		inputMap.put("columnValue", columnValue);
		inputMap.put("id", commonBO.getId());
		
		boolean returnFlag= (boolean)getCommonDAO().isExists(queryId, inputMap);
		return returnFlag;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<TaskTypeBO> getTaskTypeList(TaskTypeBO taskTypeBO) throws Exception {
		ArrayList<TaskTypeBO> taskTypeList = (ArrayList<TaskTypeBO>) getCommonDAO().getRecordListByObject("getTaskTypeList", taskTypeBO);
		return taskTypeList;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<StudyBO> getStudyList(StudyBO studyBO, boolean userStudyList) throws Exception {
	
		ArrayList<StudyBO> studyList = new ArrayList<StudyBO>();
	
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("id", studyBO.getId());
		if(userStudyList)
			inputMap.put("createdBy", studyBO.getCreatedBy());
		studyList = (ArrayList) getCommonDAO().getRecordListByMap("getStudyList", inputMap);
	
		return studyList;
	} 
	
	@SuppressWarnings("unchecked")
	public ArrayList<DataSetBO> getDataSetList(Long dataSetId, Long studyid) throws Exception {
	
		ArrayList<DataSetBO> dataSetList = new ArrayList<DataSetBO>();
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("dataSetId", dataSetId);
		inputMap.put("studyId", studyid);
		dataSetList = (ArrayList) getCommonDAO().getRecordListByMap("getDataSetList", inputMap);
		return dataSetList;
	} 
	
	public String getSuccessMSg() {

		return "Successfully Submitted";
	}

	public String getUpdateSuccessMsg() {
		return "Successfully Updated";
	}

	public String getDeleteSuccessMsg() {
		return "Successfully Deleted";
	}

	public String getErrorMSg() {

		return "An error has occcured while submitting the form. Please contact application support team";
	}

	public String getRMNotExistMsg() {
		return "The required Raw Material is not available or may not be approved. Please check with Quality Team.";
	}

	public boolean isChanged(Object obj1, Object obj2) {
		if (!(obj1.getClass().equals(obj2.getClass()))) {
			return false;
		}
		// Custom equality check here.
		return !(obj1.equals(obj2));
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserBO> getUsersList(Long id, Long orgId) throws Exception {
		
		ArrayList<UserBO> usersList = null;
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("orgId", orgId);
		inputMap.put("id", id);
		try{
			String queryId = "getUsersList";
			usersList = (ArrayList<UserBO>) getCommonDAO().getRecordListByMap(queryId, inputMap);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return usersList;
	}
	
	
	@SuppressWarnings("unchecked")
	public UserBO getUsersListByEmail(String email) throws Exception {
	
        ArrayList <UserBO>userList= new ArrayList<UserBO>();
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("email",email);
		userList = (ArrayList) getCommonDAO().getRecordListByMap("getUsersListByEmail", inputMap);
		return userList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	protected boolean isEditableId(String tableName,Long id) {
	
		return true;
	}
	
	public void setUserRoleInShort(UserBO userBO) {
	
		String userRole=userBO.getUserRole();
		
		if(userRole.equals("ROLE_APPADMIN")){
			userBO.setUserRole("App Admin");
		}else if(userRole.equals("ROLE_USER")){
			userBO.setUserRole("User");
		}
	}
	
	
	public void setUserRoleInLong(UserBO userBO) {
		
		String userRole=userBO.getUserRole();
		
		if(userRole.equals("App Admin")){
			userBO.setUserRole("ROLE_APPADMIN");
		}else if(userRole.equals("User")){
			userBO.setUserRole("ROLE_USER");
		}
	}
	
	public void setDefaultvalues(HttpServletRequest req,CommonBO formBO){
		
		HttpSession sess=req.getSession(true);
		UserBO userBO=(UserBO)sess.getAttribute("user");
		String email=userBO.getEmail();
		Long orgId=userBO.getOrgId();
		
		String hostIp = req.getRemoteAddr();
		formBO.setOrgId(orgId);
		formBO.setCreatedBy(email);
		formBO.setCreatedIp(hostIp);
		formBO.setLastModifiedBy(email);
		formBO.setLastModifiedIp(hostIp);
	}
	
	
	public String getSessionUserName(HttpServletRequest req){
		
		HttpSession sess=req.getSession(true);
		UserBO userBO=(UserBO)sess.getAttribute("user");
		String userName=userBO.getEmail();
		
		return userName;
		
	}
	
	public String getNextNo(String tableName, String columnName, Long orgId, String prefix) throws Exception {
		String lastNo =null, nextNo = null,leadingZeroFormat = null;
		lastNo = getLastValueByOrg(tableName, columnName, orgId);
		if(lastNo == null) {
			leadingZeroFormat = String.format(Constants.LEADING_ZERO_FORMAT, 1); 
			nextNo = prefix + leadingZeroFormat;
		} else {
			Integer lastNoPart = Integer.parseInt(lastNo.split("(?=\\d*$)",2)[1]);
			leadingZeroFormat = String.format(Constants.LEADING_ZERO_FORMAT, lastNoPart + 1); 
			nextNo = prefix + leadingZeroFormat;
		}
		return nextNo;
	}
	
/*	@SuppressWarnings("unchecked")
	public ArrayList<DepartmentBO> getDepartmentList(Long id, Long orgId) throws Exception {
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("orgId", orgId);
		inputMap.put("id", id);
		ArrayList<DepartmentBO> departmentList = (ArrayList<DepartmentBO>) getCommonDAO().getRecordListByMap("getDepartmentList", inputMap);
		return departmentList;
	}*/
	
	public Integer getRowCount(String tableName) {
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("tableName", tableName);
		Integer rowCount = getCommonDAO().selectOne("getRowCount", inputMap);
		return rowCount;
	}
	
	public int insertDataset(DataSetBO dataSetBO, Long studyId) throws Exception {
		
		CommonsMultipartFile dataFile = dataSetBO.getFile();
		if(!dataFile.isEmpty()) {
			String filePath = Utils.uploadFile(dataFile);
			if(filePath == null) {
				return -1;
			}
			dataSetBO.setFilePath(filePath);
		}
		
		String fileName = dataFile.getOriginalFilename();
		dataSetBO.setFileName(fileName);
		dataSetBO.setFileFormat(fileName.substring(fileName.lastIndexOf(".") + 1).trim());
		dataSetBO.setFileSize(dataFile.getSize());
		dataSetBO.setContentType(dataFile.getContentType());
		
		HashMap<String,Object> inputMap= new HashMap<String,Object>();
		inputMap.put("studyId", studyId);
		inputMap.put("dataSetBO", dataSetBO);
		String queryId = "insertDataSet";
		int returnId = (int) getCommonDAO().create(inputMap, queryId);
		return returnId;
	}
	
	public DataSetBO updateDataSet(DataSetBO dataSetBO) throws Exception {
		
		return dataSetBO;
	}
}	
