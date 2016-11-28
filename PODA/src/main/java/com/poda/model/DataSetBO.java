package com.poda.model;

import org.springframework.web.multipart.MultipartFile;

public class DataSetBO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private MultipartFile file;
	private String fileName;
	private String dataSetName;
	private Integer taskType;
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
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
	
	
}
