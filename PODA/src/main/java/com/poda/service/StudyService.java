package com.poda.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.poda.dao.CommonDAOImpl;
import com.poda.dao.CommonDAOInterface;
import com.poda.model.DataSetBO;
import com.poda.model.StudyBO;
import com.poda.model.UserBO;
import com.poda.utils.Utils;

@Service
public class StudyService extends CommonService{
	
	private static final Logger logger = LoggerFactory.getLogger(StudyService.class);
	
	@Transactional(rollbackFor=Exception.class, propagation=Propagation.REQUIRED) 
	public synchronized StudyBO createStudy(HttpServletRequest req, StudyBO studyBO) throws Exception {
		// TODO Auto-generated method stub
		logger.info("createStudy - Start");
		
		String queryId = "createStudy";
		int returnId = (int) getCommonDAO().create(studyBO, queryId);
		studyBO.setReturnId(returnId); // returnId initially set as -1 in CommonBO		
		if (returnId < 1) {
			studyBO.setReturnMsg(getErrorMSg());
			throw new Exception("Error inserting Study Details");
		}
		ArrayList<DataSetBO> dataSetList = studyBO.getDataSetBO();
		if(!dataSetList.isEmpty()) {
			for(DataSetBO dataSetBO : dataSetList) {
				if(dataSetBO.getDataSetName() != null && dataSetBO.getTaskType() != null && dataSetBO.getFile() != null) {
					setDefaultvalues(req, dataSetBO);
					returnId = insertDataset(dataSetBO, studyBO.getId());
					if (returnId < 1) {
						throw new Exception("Error inserting Dataset object " + dataSetBO.getFile().getName());
					}
				}
			}
		}
		logger.info("createStudy - End");
		return studyBO;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<StudyBO> getStudyList(StudyBO studyBO, boolean userStudyList) throws Exception {
	
		ArrayList<StudyBO> studyList = new ArrayList<StudyBO>();
	
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("id", studyBO.getId());
		if(userStudyList)
			inputMap.put("createdBy", studyBO.getCreatedBy());
		studyList = (ArrayList) getCommonDAO().getRecordListByMap("getStudyList", inputMap);
	
		return studyList;
	} 
	
	public List<String> getRequiredPropertiesList() {
		String includedProps[]={"createdDate","isPublicString","studyName","license","authors","publication","contact","siteCollected","studyDesc"};
		return Arrays.asList(includedProps);
	}
	
	public List<String> getHeaderList(){
		List<String> headerList = new ArrayList<String>();
		
		headerList.add("ID");
		headerList.add("Action");
		headerList.add("Created Date");
		headerList.add("Public");
		headerList.add("Study Name");
		headerList.add("License");
		headerList.add("Authors");
		headerList.add("Publication");
		headerList.add("Contact");
		headerList.add("Site Colledted");
		headerList.add("Study Description");
		return headerList;
	}
	
	public synchronized StudyBO updateStudy(StudyBO studyBO) throws Exception {
		logger.info("updateStudy - Start");
		String queryId;
		queryId = "updateStudy";
		int returnId = (int) getCommonDAO().update(studyBO, queryId);
		
		if(returnId < 1) {
			studyBO.setReturnMsg(getErrorMSg());
			throw new Exception("Error Updating Study");
		}
		studyBO.setReturnId(returnId);
		logger.info("updateStudy - End");
		return studyBO;
	}
}
