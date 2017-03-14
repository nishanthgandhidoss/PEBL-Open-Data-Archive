package com.poda.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.poda.model.DataSetBO;
import com.poda.model.StudyBO;
import com.poda.model.TaskTypeBO;
import com.poda.model.UserBO;
import com.poda.service.StudyService;
import com.poda.utils.Constants;

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
			ArrayList<TaskTypeBO> taskTypeList = new ArrayList<TaskTypeBO>();
			taskTypeList = studyService.getTaskTypeList(null);
			mv.addObject("taskTypeList", taskTypeList);
			mv.addObject("dataSetBO", new DataSetBO());
			mv.addObject("command", studyBO);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
		mv.setViewName("addStudy");
		logger.info("addStudy - End");
		return mv;
	}
	
	@RequestMapping(value = "/createStudy", method = RequestMethod.POST)
	public void createStudy(StudyBO studyBO, HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("createStudy - Start");
		try {
			studyService.setDefaultvalues(req, studyBO);
			studyService.createStudy(req, studyBO);
			studyBO.setReturnMsg(studyService.getSuccessMSg());
		} catch(Exception ex) {
			ex.printStackTrace();
			studyBO.setReturnId(-1);
			if(studyBO.getReturnMsg()==null)
				studyBO.setReturnMsg(studyService.getErrorMSg());
		} finally {
			studyService.writeToJSON(res, studyBO);
		}
		logger.info("createStudy - End");
	}
	
	@RequestMapping(value = "/listStudy", method = RequestMethod.GET)
	public ModelAndView listUsers(ModelAndView mv, HttpServletRequest req, StudyBO studyBO) {
	 
		logger.info("Inside listUsers");
		
		List<StudyBO> studyList = null;
		List<String> propertiesList = null;
		try {
			studyService.setDefaultvalues(req, studyBO);
			studyList = studyService.getStudyList(studyBO, true);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
	
		propertiesList=studyService.getRequiredPropertiesList();
		LinkedHashMap<String,String> actionMap= new LinkedHashMap<String,String>();
		
		actionMap.put(Constants.ACTION_EDIT, "/editStudy.sp");
		actionMap.put(Constants.ACTION_DELETE, "/deleteStudy.sp");
		
		String url[]={"addStudy.sp","Add Study"};
		  
		mv.addObject("PAGE_TITLE", "Study List");
		mv.addObject("LIST_HEADER", "Study List");
		mv.addObject("ADD_URL", url);
		mv.addObject("TBL_HEADER_LIST", studyService.getHeaderList());
		mv.addObject("ACTIONS", actionMap);
		mv.addObject("OBJECT_LIST", studyList);
		mv.addObject("PROPERTIES_LIST", propertiesList);
		mv.setViewName("commonlistPage");
		return mv;
	}
	
	@RequestMapping(value="/editStudy", method = RequestMethod.POST)
	public ModelAndView editStudy(ModelAndView mv, StudyBO studyBO, HttpServletRequest req) {
		logger.info("inside editStudy");
		
		List<StudyBO> studyList = null;
		ArrayList<DataSetBO> dataSetList = null;
		try {
			if(req.getParameter("id") != null)
				studyBO.setId(Long.parseLong(req.getParameter("id")));
			studyService.setDefaultvalues(req, studyBO);
			studyList = studyService.getStudyList(studyBO, false);
			ArrayList<TaskTypeBO> taskTypeList = new ArrayList<TaskTypeBO>();
			taskTypeList = studyService.getTaskTypeList(null);
			mv.addObject("taskTypeList", taskTypeList);
			if(!studyList.isEmpty())
				studyBO = studyList.get(0);
			dataSetList = studyService.getDataSetList(null, studyBO.getId());
			studyBO.setDataSetBO(dataSetList);
			mv.addObject("command", studyBO);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
	    
		mv.addObject("cmd",Constants.ACTION_EDIT);
		mv.setViewName("addStudy");
		
		logger.info("Ending editStudy");
		return mv;
	}
 
	@RequestMapping(value="/updateStudy", method = RequestMethod.POST)
	public void updateStudy(StudyBO studyBO, ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
        logger.info("Inside updateStudy");
		
		try {
			studyBO.setCmd(Constants.ACTION_UPDATE);
			studyService.setDefaultvalues(req, studyBO);
			studyBO = studyService.updateStudy(req, studyBO);
			studyBO.setReturnMsg(studyService.getUpdateSuccessMsg());
			
		}catch(Exception ex) {
			 
			ex.printStackTrace();
			studyBO.setReturnId(-1);
			if(studyBO.getReturnMsg()==null)
				studyBO.setReturnMsg(studyService.getErrorMSg());
			 
		}finally{
			studyService.writeToJSON(res, studyBO);
		 }
		
	}
	
}
