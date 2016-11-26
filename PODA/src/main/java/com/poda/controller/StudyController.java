package com.poda.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.poda.model.StudyBO;
import com.poda.service.StudyService;

@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Autowired
	StudyService studyService;

	public StudyService getStudyService() {
		return studyService;
	}

	public void setStudyService(StudyService studyService) {
		this.studyService = studyService;
	}
	
	@RequestMapping(value = "/addStudy", method = RequestMethod.GET)
	public ModelAndView addStudy(ModelAndView mv, @ModelAttribute("command") StudyBO studyBO, BindingResult bindingResult, HttpServletRequest req) {
		
		logger.info("addStudy - Start");
		try {
			studyBO=new StudyBO();
			studyService.setDefaultvalues(req, studyBO);
			mv.addObject("command", studyBO);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
		mv.setViewName("addStudy");
		logger.info("addStudy - End");
		return mv;
	}
}
