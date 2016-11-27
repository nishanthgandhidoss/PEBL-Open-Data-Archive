package com.poda.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.poda.model.UserBO;
import com.poda.service.UserService;
import com.poda.utils.Constants;

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
	
	@RequestMapping(value={"/editUser", "/admin/editUser"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView editUser(ModelAndView mv, HttpServletRequest req, UserBO sessionUserBO) {
		logger.info("inside editUser");
		
		List<UserBO> userList=null;
		UserBO userBO = null;
		try {
			if(req.getParameter("id") != null) {
				Long id = Long.parseLong(req.getParameter("id"));
				sessionUserBO.setId(id);
				userService.setDefaultvalues(req,sessionUserBO);
				userList = userService.getUsersList(sessionUserBO);
				userBO =userList.get(0);
				mv.addObject("callFrom", "list");
			} else {
				HttpSession sess=req.getSession(true);
				userBO=(UserBO)sess.getAttribute("user");
				userService.setUserRoleInShort(userBO);
			}
			mv.addObject("command",userBO);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
	    
		mv.addObject("cmd",Constants.ACTION_EDIT);
		mv.setViewName("addUser");
		
		logger.info("Ending editUser");
		return mv;
	}
	 
	@RequestMapping(value={"/updateUser", "/admin/updateUser"}, method = RequestMethod.POST)
	public void updateUser(UserBO userBO, ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
        logger.info("Inside Update User");
		
		try {
			userBO.setCmd(Constants.ACTION_UPDATE);
			userService.setDefaultvalues(req,userBO);
			Boolean isFromAdmin = Boolean.parseBoolean(req.getParameter("isFromAdmin"));
			userBO = userService.updateUser(userBO, isFromAdmin);
			userBO.setReturnMsg(userService.getUpdateSuccessMsg());
			
		}catch(Exception ex) {
			 
			ex.printStackTrace();
			userBO.setReturnId(-1);
			if(userBO.getReturnMsg()==null)
			   userBO.setReturnMsg(userService.getErrorMSg());
			 
		}finally{
			
			userService.writeToJSON(res,userBO);
		}
		
		
	}
	 
	@RequestMapping(value = "/managePassword", method = RequestMethod.GET)
	public ModelAndView managePassword(ModelAndView mv) {
		logger.info("Inside Manage Password");
		try {
			UserBO userBO = new UserBO();
			mv.addObject("command",userBO);
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
		mv.setViewName("managePassword");
		logger.info("outside Manage Password");
		return mv;
	}

	    
	 
	@RequestMapping(value="/resetPassword", method = RequestMethod.POST)
	public void resetPassword(UserBO userBO, ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("Inside reset Password User");
		try {
			HttpSession sess=req.getSession();
			UserBO userBO1 = (UserBO)sess.getAttribute("user");
			userBO.setId(userBO1.getId());
			userBO.setEmail(userBO1.getEmail());
			userService.setDefaultvalues(req,userBO);
			userBO = userService.resetUserPassword(userBO);
			userBO.setReturnMsg(userService.getUpdateSuccessMsg());
			sess.invalidate();
		}catch(Exception ex) {
			 
			ex.printStackTrace();
			userBO.setReturnId(-1);
			if(userBO.getReturnMsg()==null)
			   userBO.setReturnMsg("Resetting password Failed.\n Please contact your application support team");
			 
		}finally{
			
			userService.writeToJSON(res,userBO);
		}
		logger.info("Outside reset Password User");
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
