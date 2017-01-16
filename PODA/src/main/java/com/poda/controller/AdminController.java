package com.poda.controller;

import java.io.IOException;
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

import com.poda.model.TaskTypeBO;
import com.poda.service.AdminService;
import com.poda.utils.Constants;

/**
 * @author Nishanth Gandhidoss
 *
 */


@Controller


@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService adminService;
	
	public AdminService getAdminService() {
		return adminService;
	}
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping(value = "/addTaskType", method = RequestMethod.GET)
	public ModelAndView addTaskType(ModelAndView mv) {
		try {	
			TaskTypeBO taskTypeBO = new TaskTypeBO();
			mv.addObject("command", taskTypeBO);
			mv.setViewName("addTaskType");
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
		return mv;
	}
	
	@RequestMapping(value = "/saveTaskType", method = RequestMethod.POST)
	public void saveTaskType(TaskTypeBO taskTypeBO,HttpServletRequest req, HttpServletResponse res, ModelAndView mv) throws IOException {
		logger.info("Inside saveTaskType");
		try {
			adminService.setDefaultvalues(req, taskTypeBO);
			taskTypeBO = adminService.insertTaskType(taskTypeBO);
			taskTypeBO.setReturnMsg(adminService.getSuccessMSg());
		}catch(Exception ex) {
			ex.printStackTrace();
			taskTypeBO.setReturnId(-1);
			if(taskTypeBO.getReturnMsg()==null)
				taskTypeBO.setReturnMsg(adminService.getErrorMSg());
		}finally{
			adminService.writeToJSON(res, taskTypeBO);
		 }
		logger.info("Ending saveTaskType");
	}
	
	@RequestMapping(value = "/listTaskType", method = RequestMethod.GET)
	public ModelAndView listTaskType(ModelAndView mv, TaskTypeBO taskTypeBO, HttpServletRequest req) {
		logger.info("Inside listTaskType");
		List<TaskTypeBO> taskTypeList = null;
		List<String> propertiesList = null;
		
		try {
			adminService.setDefaultvalues(req, taskTypeBO);
			taskTypeList = adminService.getTaskTypeList(taskTypeBO);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}

		propertiesList = adminService.getRequiredPropertiesList();
		LinkedHashMap<String, String> actionMap = new LinkedHashMap<String, String>();

		actionMap.put(Constants.ACTION_EDIT, "/admin/editDepartment.sp");
		actionMap.put(Constants.ACTION_DELETE, "/admin/deleteDepartment.sp");

		String url[] = { "admin/departmentTool", "Add Department" };

		mv.addObject("PAGE_TITLE", "Department List");
		mv.addObject("LIST_HEADER", "Department Details");
		mv.addObject("ADD_URL", url);
		mv.addObject("TBL_HEADER_LIST", adminService.getHeaderList());
		mv.addObject("ACTIONS", actionMap);
		mv.addObject("OBJECT_LIST", taskTypeList);
		mv.addObject("PROPERTIES_LIST", propertiesList);
		mv.setViewName("commonlistPage");
		logger.info("Ending listTaskType");
		return mv;
	}
	
	@RequestMapping(value="/editTaskType", method = RequestMethod.POST)
	public ModelAndView editTaskType(ModelAndView mv, HttpServletRequest req) {
		logger.info("inside editTaskType");
		
		List<TaskTypeBO> taskTypeList = null;
		Long id = Long.parseLong(req.getParameter("id"));
		try {
			TaskTypeBO taskTypeBO = new TaskTypeBO();
			adminService.setDefaultvalues(req, taskTypeBO);
			taskTypeList = adminService.getTaskTypeList(taskTypeBO);
			taskTypeBO = taskTypeList.get(0);
			mv.addObject("command", taskTypeBO);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:" + "404error.sp");
		}
	    
		mv.addObject("cmd",Constants.ACTION_EDIT);
		mv.setViewName("taskTypeTool");
		
		logger.info("Ending editTaskType");
		return mv;
	}
	
	@RequestMapping(value="/updateTaskType", method = RequestMethod.POST)
	public void updateTaskType(TaskTypeBO taskTypeBO, ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("Inside updateDepartment");
		try {
			taskTypeBO.setCmd(Constants.ACTION_UPDATE);
			adminService.setDefaultvalues(req, taskTypeBO);
			taskTypeBO = adminService.updateTaskType(taskTypeBO);
			taskTypeBO.setReturnMsg(adminService.getUpdateSuccessMsg());
		} catch(Exception ex) {
			ex.printStackTrace();
			taskTypeBO.setReturnId(-1);
			if(taskTypeBO.getReturnMsg()==null)
				taskTypeBO.setReturnMsg(adminService.getErrorMSg());
		} finally{
			adminService.writeToJSON(res, taskTypeBO);
		}
		
		logger.info("Outside updateTaskType");
	}
		
	@RequestMapping(value="/deleteTaskType", method = RequestMethod.POST)
	public void deleteTaskType(TaskTypeBO taskTypeBO, ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("Inside deleteTaskType");
		LinkedHashMap<String, Object> map= new LinkedHashMap<String, Object>();
		Long id = Long.parseLong(req.getParameter("id"));
		taskTypeBO.setId(id);
		try {
			adminService.setDefaultvalues(req, taskTypeBO);
			taskTypeBO = adminService.deleteTaskType(taskTypeBO);
		} catch (Exception ex) {
			ex.printStackTrace();
			taskTypeBO.setReturnId(-1);
			if (taskTypeBO.getReturnMsg() == null)
				taskTypeBO.setReturnMsg(adminService.getErrorMSg());
			// return new ModelAndView("redirect:" + "listRM.sp");
		} finally {
			map.put(Constants.JSON_KEY, taskTypeBO);
			adminService.writeToJSON(res, map);
		}
		logger.info("Outside deleteTaskType");
	}
}