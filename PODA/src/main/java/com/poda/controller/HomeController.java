package com.poda.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.poda.model.CommonBO;
import com.poda.model.StudyBO;
import com.poda.model.TaskTypeBO;
import com.poda.model.UserBO;
import com.poda.service.HomeService;
import com.poda.utils.Utils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value={"/welcome"}, method = RequestMethod.GET)
	public ModelAndView welcomePage(ModelAndView mv, @ModelAttribute("command") TaskTypeBO taskBO, BindingResult bindingResult, HttpServletRequest req) throws Exception {
		logger.info("Welcome page starts");
		try {
			ArrayList<TaskTypeBO> taskBOList = homeService.welcomePage(taskBO);
			taskBO = taskBOList.get(0);
			System.out.println(taskBO);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
		mv.addObject("command", taskBO);
		mv.setViewName("welcome");
		logger.info("Welcome page ends");
		return mv;
	}
	
	
	@RequestMapping(value = {"/home"}, method = RequestMethod.GET)
	public ModelAndView homePage(ModelAndView mv,HttpServletRequest req) throws Exception {
		 
		 logger.info("Home Controller-Start");
		 try{
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	     String email = auth.getName();
	  
		 HttpSession sess=req.getSession(true);
		 
		 UserBO userBO=(UserBO)sess.getAttribute("user");
		 
		 if(userBO==null){
		 
		 userBO=homeService.getUsersListByEmail(email);
		 homeService.setUserRoleInShort(userBO);
		 sess.removeAttribute("user");
		 sess.setAttribute("user", userBO);
		 sess.setMaxInactiveInterval(3600);
		 
		 //homeService.setDefaultvalues(req,userBO);
		 //routeCardList = homeService.getRouteCardIdAndNo(null, userBO.getOrgId());
		// mv.addObject("routeCardList", routeCardList);
		 }
		 } catch(Exception ex) {
			 ex.printStackTrace();
			 return new ModelAndView("redirect:" + "404error.sp");
		 }
		 mv.setViewName("home");
		 logger.info("Home Controller-End");
		 return mv;
	}
	
}
