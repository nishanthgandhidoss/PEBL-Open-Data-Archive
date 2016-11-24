package com.erp.utils;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.ModelAndView;

import com.erp.model.UserBO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Utils {

	private static final Logger logger = LoggerFactory.getLogger(Utils.class);

	public static ArrayList<String> loggedInUserNameList;	

	public static String parseAsJson(Object object) {

		Gson gson = new Gson();
		String jsonString = gson.toJson(object);
		return jsonString;
	}

	public static String encryptPassword(String pwd) {

		String password = pwd;
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		return hashedPassword;
	}

	public static String parseAsJsonDate(Object object) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonString = gson.toJson(object);
		return jsonString;
	}
	
	/*public static ArrayList<ShiftBO> setAtSpecifiedPositionByShiftNo(ArrayList<ShiftBO> shiftDetails) {
		logger.info("Inside setAtSpecifiedPositionByShiftNo");
		try {
			int i = 0;
			ArrayList<ShiftBO> resultList = null;
			ShiftBO emptyBO = new ShiftBO();
			Integer shiftNo = shiftDetails.get(0).getShiftNo();
			if(shiftNo == 3) {
				shiftDetails.add(0, emptyBO);
				shiftDetails.add(1, emptyBO);
			} else if(shiftNo == 2) {
				shiftDetails.add(0, emptyBO);
			} else {
				return shiftDetails;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		logger.info("Outside setAtSpecifiedPositionByShiftNo");
		return shiftDetails;
	}
	*/
	
	public static String getComputerName()
	 {
	     Map<String, String> env = System.getenv();
	     if (env.containsKey("COMPUTERNAME"))
	         return env.get("COMPUTERNAME");
	     else if (env.containsKey("HOSTNAME"))
	         return env.get("HOSTNAME");
	     else
	         return "Unknown Computer";
	 }
	
	
	public static String  replaceSplCharacterWithUnderscore(String printerName) {
		
		// String text = "This - word ! has \\ /allot # of % special % characters";
		 String text=printerName;
		 text = text.replaceAll("[^a-zA-Z0-9 ]", "");
		 System.out.println(text);
		 
		 
		 text = text.replaceAll("[^a-zA-Z0-9]", "_");
		 System.out.println(text);
		 return text;
		
	}
	

	public static ArrayList<String> getLoggedInUserNameList() {
		return loggedInUserNameList;
	}

	public static void setLoggedInUserNameList(ArrayList<String> loggedInUserNameList) {
		Utils.loggedInUserNameList = loggedInUserNameList;
	}

}
