
package com.erp.model;

public class RegistrationBO extends CommonBO {
	

	
	
	/**
	 * 
	 */
	public static final long serialVersionUID = -8830089242613708627L;

	
	private String regFullName;
	
	private String regUserName;
	
	private String regPassword;
	
	private String regEmail;
	
    private String regFirstName;
	
	private String regLastName;
	
	private String regIsApproved;
	
	private String regProfession;
	
	private String regOrgName;
	
	public String getRegFullName() {
		return regFullName;
	}


	public void setRegFullName(String regFullName) {
		this.regFullName = regFullName;
	}


	public String getRegUserName() {
		return regUserName;
	}


	public void setRegUserName(String regUserName) {
		this.regUserName = regUserName;
	}


	public String getRegEmail() {
		return regEmail;
	}


	public void setRegEmail(String regEmail) {
		this.regEmail = regEmail;
	}


	public String getRegFirstName() {
		return regFirstName;
	}


	public void setRegFirstName(String regFirstName) {
		this.regFirstName = regFirstName;
	}


	public String getRegLastName() {
		return regLastName;
	}


	public void setRegLastName(String regLastName) {
		this.regLastName = regLastName;
	}


	public String getRegIsApproved() {
		return regIsApproved;
	}


	public void setRegIsApproved(String regIsApproved) {
		this.regIsApproved = regIsApproved;
	}
	

	public String getRegPassword() {
		return regPassword;
	}


	public void setRegPassword(String regPassword) {
		this.regPassword = regPassword;
	}


	public String getRegProfession() {
		return regProfession;
	}


	public void setRegProfession(String regProfession) {
		this.regProfession = regProfession;
	}


	public String getRegOrgName() {
		return regOrgName;
	}


	public void setRegUnivName(String regOrgName) {
		this.regOrgName = regOrgName;
	}
	

}
