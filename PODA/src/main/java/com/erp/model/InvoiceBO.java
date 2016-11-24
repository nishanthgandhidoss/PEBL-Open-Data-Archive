package com.erp.model;

import java.sql.Date;

public class InvoiceBO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3105550777586729382L;

	private Long routeCardNo;
	private Date invoiceDate;
	private String invoiceNumber;
	private Integer quantity;
	private Long generatedBy;

	public Long getRouteCardNo() {
		return routeCardNo;
	}
	public void setRouteCardNo(Long routeCardNo) {
		this.routeCardNo = routeCardNo;
	}
	public Date getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Long getGeneratedBy() {
		return generatedBy;
	}
	public void setGeneratedBy(Long generatedBy) {
		this.generatedBy = generatedBy;
	}
	
	
}
