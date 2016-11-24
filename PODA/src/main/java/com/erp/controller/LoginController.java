package com.erp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.erp.model.UserBO;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public ModelAndView initialLoginPage(ModelAndView mv) {
		
		logger.info("Inside initialLoginPage");
		return new ModelAndView("redirect:" + "login.sp");
	}
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public ModelAndView loginPage(ModelAndView mv, HttpServletRequest req, String error,String logout,@ModelAttribute("command") UserBO userBO, BindingResult bindingResult) {
		
		userBO= new UserBO();
		if (error != null) {
			
			if("invalid".equals(error)){
			  mv.addObject("error", "Invalid username or password!");
			}else if("expired".equals(error)){
			  mv.addObject("error", "User session is expired");	
			}
		}

		if (logout != null) {
			mv.addObject("msg", "You've been logged out successfully.");
		   // Utils.getLoggedInUserNameList().remove(Utils.getSessionUserBO().getUserName());
		}
		
		HttpSession sess=req.getSession();
		sess.invalidate();
		
		mv.addObject("command", userBO);
		mv.setViewName("loginRegistration");
		return mv;
	}
	
	
/*	@RequestMapping(value = {"/registerUser"}, method = RequestMethod.POST)
	public String authenticateUserName (HttpServletRequest req) {
		
		String userName=req.getParameter("username");
		
		String password=req.getParameter("password");
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		
		
		return "loginRegistration";
	}
	*/
	
}
