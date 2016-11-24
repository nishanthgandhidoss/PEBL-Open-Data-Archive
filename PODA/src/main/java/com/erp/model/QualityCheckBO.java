package com.erp.model;

/**
 * @author Nishanth Gandhidoss
 *
 */
public class QualityCheckBO extends CommonBO {

	private Long grnNo;
	private Integer receivedBags;
	private Integer approvedBags;
	private Double approvedQuantity;
	private Double remainingQuantity;
	private Long checkedBy;
	private Long approvedBy;
	
	public Long getGrnNo() {
		return grnNo;
	}
	public void setGrnNo(Long grnNo) {
		this.grnNo = grnNo;
	}
	public Integer getReceivedBags() {
		return receivedBags;
	}
	public void setReceivedBags(Integer receivedBags) {
		this.receivedBags = receivedBags;
	}
	public Integer getApprovedBags() {
		return approvedBags;
	}
	public void setApprovedBags(Integer approvedBags) {
		this.approvedBags = approvedBags;
	}
	public Double getRemainingQuantity() {
		return remainingQuantity;
	}
	public void setRemainingQuantity(Double remainingQuantity) {
		this.remainingQuantity = remainingQuantity;
	}
	public void setApprovedQuantity(Double approvedQuantity) {
		this.approvedQuantity = approvedQuantity;
	}
	public Long getCheckedBy() {
		return checkedBy;
	}
	public void setCheckedBy(Long checkedBy) {
		this.checkedBy = checkedBy;
	}
	public Long getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(Long approvedBy) {
		this.approvedBy = approvedBy;
	}
	
}
