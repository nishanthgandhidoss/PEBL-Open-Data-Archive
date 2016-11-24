package com.erp.model;

import java.util.Map;

public class RMBO extends CommonBO{
	
	private String rmName;
	private String rmSpecification;
	private String[] rmGrades;
	private String rmGradesAsString;
	private String rmGrade;
	private Long createdRMId;
	private Double rmPrice;
	
	private Long[] rmGradeIdForDelete;
	
	

	public Long[] getRmGradeIdForDelete() {
		return rmGradeIdForDelete;
	}

	public void setRmGradeIdForDelete(Long[] rmGradeIdForDelete) {
		this.rmGradeIdForDelete = rmGradeIdForDelete;
	}

	public Long getCreatedRMId() {
		return createdRMId;
	}

	public void setCreatedRMId(Long createdRMId) {
		this.createdRMId = createdRMId;
	}

	public String getRmGrade() {
		return rmGrade;
	}

	public void setRmGrade(String rmGrade) {
		this.rmGrade = rmGrade;
	}

	public String getRmGradesAsString() {
		return rmGradesAsString;
	}

	public void setRmGradesAsString(String rmGradesAsString) {
		this.rmGradesAsString = rmGradesAsString;
	}

	public String[] getRmGrades() {
		return rmGrades;
	}

	public void setRmGrades(String[] rmGrades) {
		this.rmGrades = rmGrades;
	}

	public String getRmName() {
		return rmName;
	}

	public void setRmName(String rmName) {
		this.rmName = rmName;
	}
	

	public String getRmSpecification() {
		return rmSpecification;
	}

	public void setRmSpecification(String rmSpecification) {
		this.rmSpecification = rmSpecification;
	}

	public Double getRmPrice() {
		return rmPrice;
	}

	public void setRmPrice(Double rmPrice) {
		this.rmPrice = rmPrice;
	}

	
	
	
}
