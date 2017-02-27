package com.poda.model;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class DataSetBO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private CommonsMultipartFile file;
	private String fileName;
	private String dataSetName;
	private Integer taskType;
	private Integer isFileChanged = 0;
	
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDataSetName() {
		return dataSetName;
	}
	public void setDataSetName(String dataSetName) {
		this.dataSetName = dataSetName;
	}
	public Integer getTaskType() {
		return taskType;
	}
	public void setTaskType(Integer taskType) {
		this.taskType = taskType;
	}
	public Integer getIsFileChanged() {
		return isFileChanged;
	}
	public void setIsFileChanged(Integer isFileChanged) {
		this.isFileChanged = isFileChanged;
	}
	
}
