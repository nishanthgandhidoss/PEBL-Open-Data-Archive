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
	private String fileFormat;
	private String filePath;
	private String contentType;
	private String fileSize;
	private Long studyId;
	private String dataSetName;
	private Integer taskType;
	private String taskTypeString;
	private Integer isFileChanged = 0;
	private Integer isEnabled = 0;
	private String isEnabledString;
	private Long downloadCount = 0L;
	private Long version;
	
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
	public String getFileFormat() {
		return fileFormat;
	}
	public void setFileFormat(String fileFormat) {
		this.fileFormat = fileFormat;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public Long getStudyId() {
		return studyId;
	}
	public void setStudyId(Long studyId) {
		this.studyId = studyId;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public Integer getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(Integer isEnabled) {
		this.isEnabled = isEnabled;
	}
	public String getIsEnabledString() {
		return isEnabledString;
	}
	public void setIsEnabledString(String isEnabledString) {
		this.isEnabledString = isEnabledString;
	}
	public Long getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(Long downloadCount) {
		this.downloadCount = downloadCount;
	}
	public Long getVersion() {
		return version;
	}
	public void setVersion(Long version) {
		this.version = version;
	}
	public String getTaskTypeString() {
		return taskTypeString;
	}
	public void setTaskTypeString(String taskTypeString) {
		this.taskTypeString = taskTypeString;
	}
	
}
