package com.erp.model;

import java.io.Serializable;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class CommonBO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3734715555936566005L;

	private Long id;
	/**
	 * 
	 */
	private String columnName;
	/**
	 * 
	 */
	private Long orgId;

	/**
	 * 
	 */
	private String organizationName;

	/**
	 * 
	 */
	private String cmd;

	/**
	 * 
	 */
	private String tableName;
	
	/**
	 * 
	 */
	private  String createdBy;

	/**
	 * 
	 */
	private String createdDate;

	/**
	 * 
	 */
	private String lastModifiedBy;

	/**
	 * 
	 */
	private String lastModifiedDate;

	/**
	 * 
	 */
	private String createdIp;

	/**
	 * 
	 */
	private String lastModifiedIp;

	/**
	 * 
	 */
	private String isEditable="Y";

	/**
	 * 
	 */
	private String isRemovable="Y";
	
	
	private Integer returnId=-1;
	
	private String formId;
	
	private String isApproved;
	
	private String returnMsg;

	private String fullName;
	
	private String fullNameWithUserName;
	
	private ArrayList<UserBO> userBOList;
	
	

	public ArrayList<UserBO> getUserBOList() {
		return userBOList;
	}

	public void setUserBOList(ArrayList<UserBO> userBOList) {
		this.userBOList = userBOList;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getFullNameWithUserName() {
		return fullNameWithUserName;
	}

	public void setFullNameWithUserName(String fullNameWithUserName) {
		this.fullNameWithUserName = fullNameWithUserName;
	}

	public String getReturnMsg() {
		return returnMsg;
	}

	public void setReturnMsg(String returnMsg) {
		this.returnMsg = returnMsg;
	}

	public String getFormId() {
		return formId;
	}

	public String getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public Integer getReturnId() {
		return returnId;
	}

	public void setReturnId(Integer returnId) {
		this.returnId = returnId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getCreatedIp() {
		return createdIp;
	}

	public void setCreatedIp(String createdIp) {
		this.createdIp = createdIp;
	}

	public String getLastModifiedIp() {
		return lastModifiedIp;
	}

	public void setLastModifiedIp(String lastModifiedIp) {
		this.lastModifiedIp = lastModifiedIp;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}


	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public String getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getIsEditable() {
		return isEditable;
	}

	public void setIsEditable(String isEditable) {
		this.isEditable = isEditable;
	}

	public String getIsRemovable() {
		return isRemovable;
	}

	public void setIsRemovable(String isRemovable) {
		this.isRemovable = isRemovable;
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	
	

}
