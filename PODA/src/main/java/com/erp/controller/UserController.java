package com.erp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.erp.model.DepartmentBO;
import com.erp.model.RegistrationBO;
import com.erp.model.UserBO;
import com.erp.service.UserService;
import com.erp.utils.Constants;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	 @Autowired
	 UserService userService;
	 
	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	 public synchronized void registerUser(HttpServletRequest req,HttpServletResponse res,ModelAndView mv,UserBO userBO) throws IOException {
		
		 
			logger.info("inside registerUser");
			
	        try {
	        	userService.setIPAddress(req,userBO);
	        	userBO = userService.registerUser(userBO);
	        	userBO.setReturnMsg("<h3 style='font-size:24px'>Thank you for registering with us.<h3> \n <h4 style='font-size:18px'>You can sign in using your registered Email and Password.</h4>");
	        	
			}catch(Exception ex) {
				ex.printStackTrace();
				userBO.setReturnId(-1);
				if(userBO.getReturnMsg()==null)
					userBO.setReturnMsg(userService.getErrorMSg());
				 
			}finally{
				userService.writeToJSON(res,userBO);
			}
			
			logger.info("createUser ends");
			
	}
	 
	
	@RequestMapping(value = "/admin/listUsers", method = RequestMethod.GET)
	public ModelAndView listUsers(ModelAndView mv, HttpServletRequest req, UserBO userBO) {
	 
		logger.info("Inside listUsers");
		
		List<UserBO>  userList=null;
		List<String> propertiesList=null;
		try {
			userService.setDefaultvalues(req,userBO);
			userList = userService.getUsersList(userBO);
			userService.setShortUserRoleByUserList(userList);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
	
		  propertiesList=userService.getRequiredPropertiesList();
		  LinkedHashMap<String,String> actionMap= new LinkedHashMap<String,String>();
		  
		  actionMap.put(Constants.ACTION_EDIT, "/admin/editUser.sp");
		  actionMap.put(Constants.ACTION_DELETE, "/admin/deleteUser.sp");
		  
		  String url[]={"admin/adduser","Add User"};
		  
		  mv.addObject("PAGE_TITLE", "Users List");
		  mv.addObject("LIST_HEADER", "Users List");
		  mv.addObject("ADD_URL", url);
		  mv.addObject("TBL_HEADER_LIST", userService.getHeaderList());
		  mv.addObject("ACTIONS",actionMap);
		  mv.addObject("OBJECT_LIST",userList);
		  mv.addObject("PROPERTIES_LIST",propertiesList);
		  mv.setViewName("commonlistPage");
		  return mv;
	}
	
	 /*@RequestMapping(value = "/appadmin/listCompanyRegistrations", method = RequestMethod.GET)
		public ModelAndView listCompanyRegistrations(ModelAndView mv) {
		 
			logger.info("Inside listCompanyRegistrations");
			List<CompanyRegistrationBO>  companyRegistrationList=null;
			List<String> propertiesList=null;
			try {
				companyRegistrationList=companyRegistrationService.getCompanyRegistrationList(null);
				propertiesList = companyRegistrationService.getRequiredPropertiesList();
			} catch (Exception e) {
				e.printStackTrace();
				return new ModelAndView("redirect:" + "/appadmin/404error.sp");
			}
		
			
			  LinkedHashMap<String,String> lmap= new LinkedHashMap<String, String>();
			  
			  String url[] = { "login", "Add Company" };
			  
			  lmap.put(Constants.ACTION_APPROVE, "/appadmin/approveRegisteredCompany.sp");
			  lmap.put(Constants.ACTION_REJECT, "/appadmin/approveRegisteredCompany.sp");
			  lmap.put(Constants.ACTION_EDIT, "/appadmin/editRegisteredCompany.sp");
			  
			  mv.addObject("PAGE_TITLE", "Registered Company List");
			  mv.addObject("LIST_HEADER", "Approve Company Registration");
			  mv.addObject("TBL_HEADER_LIST",companyRegistrationService.getHeaderList());
			  mv.addObject("ADD_URL", url);
			  mv.addObject("OBJECT_LIST",companyRegistrationList);
			  mv.addObject("ACTIONS",lmap);
			  mv.addObject("PROPERTIES_LIST",propertiesList);
			  mv.setViewName("commonlistPage");
			  return mv;
		}
	 
	 
	 
	 @RequestMapping(value = "/appadmin/approveRegisteredCompany", method = RequestMethod.POST)
	 public void updateApprovalStatus(HttpServletRequest req,HttpServletResponse res,ModelAndView mv,CompanyRegistrationBO companyRegistrationBO) throws IOException {
		
		logger.info("Inside updateApprovalStatus");
		try {
			companyRegistrationBO.setCmd(Constants.ACTION_UPDATE);
			companyRegistrationService.setDefaultvalues(req,companyRegistrationBO);
			companyRegistrationBO = companyRegistrationService.updateCompanyRegistrationApprovalStatus(companyRegistrationBO);
			if(companyRegistrationBO.getIsApproved().equalsIgnoreCase(Constants.YES)) {
				companyRegistrationBO.setCmd(Constants.ACTION_INSERT);
				companyRegistrationService.setDefaultvalues(req,companyRegistrationBO);
				companyRegistrationBO = companyRegistrationService.insertTblOrganisations(companyRegistrationBO);
				companyRegistrationBO.setReturnMsg("Company approved Succesfully");
			} else 
				companyRegistrationBO.setReturnMsg("Company rejected Succesfully");
		} catch(Exception e) {
			e.printStackTrace();
			companyRegistrationBO.setReturnId(-1);
			if(companyRegistrationBO.getReturnMsg()==null)
				companyRegistrationBO.setReturnMsg(companyRegistrationService.getErrorMSg());
		} finally{
			companyRegistrationService.writeToJSON(res,companyRegistrationBO);
		}
		logger.info("Outside updateApprovalStatus");
	}*/

	
}
