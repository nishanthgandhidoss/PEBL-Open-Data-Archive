package com.poda.model;

public class TaskTypeBO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String taskType;
	private String taskTypeDescription;
	private Integer isEnabled = 1;
	
	public String getTaskType() {
		return taskType;
	}
	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}
	public String getTaskTypeDescription() {
		return taskTypeDescription;
	}
	public void setTaskTypeDescription(String taskTypeDescription) {
		this.taskTypeDescription = taskTypeDescription;
	}
	public Integer getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(Integer isEnabled) {
		this.isEnabled = isEnabled;
	}
	
}
