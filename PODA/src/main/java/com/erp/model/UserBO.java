package com.erp.model;

import java.sql.Date;

public class UserBO extends CommonBO {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2796494115635327726L;

	private String password;
	
	private String email;
	
    private String firstName;
	
	private String lastName;
	
	private String profession;
	
	private String orgName;
	
    private Integer enabled;

    private String userRole;
    
    private String enabledString;
    
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getEnabledString() {
		return enabledString;
	}

	public void setEnabledString(String enabledString) {
		this.enabledString = enabledString;
	}
    
    
}
