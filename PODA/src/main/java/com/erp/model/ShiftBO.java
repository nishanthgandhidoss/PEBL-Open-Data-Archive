package com.erp.model;

public class ShiftBO extends CommonBO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5253190946059649772L;
	
	private Long prodInspectId;
	private Integer shiftNo;
	private Long shiftInCharge;
	private Long okQuantity;
	private Long rejectQuantity;
	
	public Long getProdInspectId() {
		return prodInspectId;
	}
	public void setProdInspectId(Long prodInspectId) {
		this.prodInspectId = prodInspectId;
	}
	public Integer getShiftNo() {
		return shiftNo;
	}
	public void setShiftNo(Integer shiftNo) {
		this.shiftNo = shiftNo;
	}
	public Long getShiftInCharge() {
		return shiftInCharge;
	}
	public void setShiftInCharge(Long shiftInCharge) {
		this.shiftInCharge = shiftInCharge;
	}
	public Long getOkQuantity() {
		return okQuantity;
	}
	public void setOkQuantity(Long okQuantity) {
		this.okQuantity = okQuantity;
	}
	public Long getRejectQuantity() {
		return rejectQuantity;
	}
	public void setRejectQuantity(Long rejectQuantity) {
		this.rejectQuantity = rejectQuantity;
	}
}
