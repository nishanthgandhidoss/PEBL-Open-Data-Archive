package com.erp.model;

public class PricingToolBO extends CommonBO{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4123981773562098064L;
	private String partName;
	private String partNumber;
	private String modelName;
	private Integer quantityPerPacket;
	private Double partPrice;
	
	public String getPartName() {
		return partName;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public String getPartNumber() {
		return partNumber;
	}
	public void setPartNumber(String partNumber) {
		this.partNumber = partNumber;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public Integer getQuantityPerPacket() {
		return quantityPerPacket;
	}
	public void setQuantityPerPacket(Integer quantityPerPacket) {
		this.quantityPerPacket = quantityPerPacket;
	}
	public Double getPartPrice() {
		return partPrice;
	}
	public void setPartPrice(Double partPrice) {
		this.partPrice = partPrice;
	}
	
	
	
	
}
