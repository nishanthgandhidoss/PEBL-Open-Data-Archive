package com.erp.service;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.erp.model.UserBO;
import com.erp.utils.TableNames;
import com.erp.utils.Utils;

@Service	
public class UserService extends CommonService{

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	public UserBO registerUser(UserBO userBO) throws Exception {
		
		logger.info("registerUser - Start");
		
		String queryId = "registerUser";
		userBO.setPassword(Utils.encryptPassword(userBO.getPassword()));
		int returnId = (int) getCommonDAO().create(userBO, queryId);

		userBO.setReturnId(returnId);// returnId initially set as -1 in CommonBO
		
		if (returnId < 1) {
			userBO.setReturnMsg(getErrorMSg());
			throw new Exception("Error registering the user");
		}
		
		logger.info("registerUser - End");
		return userBO;
		
	}
	
	 @SuppressWarnings("unchecked")
	 public ArrayList<UserBO> getUsersList(UserBO userBO) throws Exception {

		ArrayList<UserBO> userList = new ArrayList<UserBO>();

		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("orgId", userBO.getOrgId());
		inputMap.put("id", userBO.getId());

		userList = (ArrayList) getCommonDAO().getRecordListByMap("getUsersList", inputMap);

		return userList;
	 }

	public void setShortUserRoleByUserList(List<UserBO> userList) {

		for (UserBO userBO : userList) {

			setUserRoleInShort(userBO);

		}
	}
	 
	 public List<String> getHeaderList(){
			
			List<String> headerList = new ArrayList<String>();
			
			headerList.add("ID");
			headerList.add("Action");
			headerList.add("Is Approved");
			headerList.add("First Name");
			headerList.add("Last Name");
			headerList.add("Email");
			headerList.add("Profession");
			headerList.add("Organisation Name");
			headerList.add("User Role");
			headerList.add("Enrolled Date");
			return headerList;
			
		}
	 
	 public List<String> getRequiredPropertiesList() {
			String includedProps[]={"enabledString","firstName","lastName","email","profession","orgName","userRole","createdDate"};
			return Arrays.asList(includedProps);
	}
	 

	 
}
