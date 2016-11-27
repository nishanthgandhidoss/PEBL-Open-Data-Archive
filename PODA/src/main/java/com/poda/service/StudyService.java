package com.poda.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.poda.model.StudyBO;
import com.poda.utils.Utils;

@Service
public class StudyService extends CommonService{
	
	private static final Logger logger = LoggerFactory.getLogger(StudyService.class);

	public synchronized StudyBO createStudy(StudyBO studyBO) throws Exception {
		// TODO Auto-generated method stub
		logger.info("createStudy - Start");
		String queryId = "createStudy";
		int returnId = (int) getCommonDAO().create(studyBO, queryId);
		studyBO.setReturnId(returnId); // returnId initially set as -1 in CommonBO
		
		if (returnId < 1) {
			studyBO.setReturnMsg(getErrorMSg());
			throw new Exception("Error registering the user");
		}
		logger.info("createStudy - End");
		return studyBO;
	}
	
	
}
