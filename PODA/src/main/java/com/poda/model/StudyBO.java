package com.poda.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

public class StudyBO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String studyName;
	private String studyDesc;
	private String license;
	private Integer isPublic = 1;
	private String isPublicString;
	private String authors;
	private String publication;
	private String contact;
	private String siteCollected;

	@Autowired
	private ArrayList<DataSetBO> dataSetBO;
	
	public ArrayList<DataSetBO> getDataSetBO() {
		return dataSetBO;
	}
	public void setDataSetBO(ArrayList<DataSetBO> dataSetBO) {
		this.dataSetBO = dataSetBO;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	public String getStudyDesc() {
		return studyDesc;
	}
	public void setStudyDesc(String studyDesc) {
		this.studyDesc = studyDesc;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public Integer getIsPublic() {
		return isPublic;
	}
	public void setIsPublic(Integer isPublic) {
		this.isPublic = isPublic;
	}
	public String getIsPublicString() {
		return isPublicString;
	}
	public void setIsPublicString(String isPublicString) {
		this.isPublicString = isPublicString;
	}
	public String getAuthors() {
		return authors;
	}
	public void setAuthors(String authors) {
		this.authors = authors;
	}
	public String getPublication() {
		return publication;
	}
	public void setPublication(String publication) {
		this.publication = publication;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getSiteCollected() {
		return siteCollected;
	}
	public void setSiteCollected(String siteCollected) {
		this.siteCollected = siteCollected;
	}
	
}
