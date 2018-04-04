package com.poda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/*For common calls that goes through out the application*/

@Controller
public class CommonController {

	
	@RequestMapping(value = {"/404error", "/admin/404error", "/appadmin/404error"}, method = RequestMethod.GET)
	public String show404(ModelAndView mv) {
		return "404jsp";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String show403(ModelAndView mv) {
		return "403jsp";
		
	}
	
}
