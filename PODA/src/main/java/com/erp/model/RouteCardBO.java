package com.erp.model;

import org.springframework.beans.factory.annotation.Autowired;

public class RouteCardBO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4940395364659949486L;
	private String routeCardNo;
	private Long partId;
	private String partNumber;
	private String partName;
	private String modelName;
	private Integer planQuantity;
	private Double issuedQuantity;
	private Long issuedBy;
	private Long receivedBy;
	private Long rmId;
	private Long rmGradeId;
	private String rmName;
	private String rmGrade;
	private String rmSpecification;
	private Double approvedQuantity;
	private Double remainingQuantity;
	private Long grnId;
	private String grnNo;
	private String rmLotNo;
	private String hostIp;
	private String machineName;
	private Long operationId;
	private String operationName;
	private String remarks;
	private Integer producedQuantity;
	private Integer despatchedQuantity;
	private Integer remainingTotalQuantity;
	
	private Integer totalInspectOkQty;
	private Integer totalInspectRejQty;
	private Integer totalInspectQty;
	
	
	public String getRouteCardNo() {
		return routeCardNo;
	}
	public void setRouteCardNo(String routeCardNo) {
		this.routeCardNo = routeCardNo;
	}
	public Integer getRemainingTotalQuantity() {
		return remainingTotalQuantity;
	}
	public void setRemainingTotalQuantity(Integer remainingTotalQuantity) {
		this.remainingTotalQuantity = remainingTotalQuantity;
	}
	public Integer getProducedQuantity() {
		return producedQuantity;
	}
	public void setProducedQuantity(Integer producedQuantity) {
		this.producedQuantity = producedQuantity;
	}
	public Integer getDespatchedQuantity() {
		return despatchedQuantity;
	}
	public void setDespatchedQuantity(Integer despatchedQuantity) {
		this.despatchedQuantity = despatchedQuantity;
	}
	public Long getPartId() {
		return partId;
	}
	public void setPartId(Long partId) {
		this.partId = partId;
	}
	public String getPartName() {
		return partName;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public Integer getPlanQuantity() {
		return planQuantity;
	}
	public void setPlanQuantity(Integer planQuantity) {
		this.planQuantity = planQuantity;
	}
	public Double getIssuedQuantity() {
		return issuedQuantity;
	}
	public void setIssuedQuantity(Double issuedQuantity) {
		this.issuedQuantity = issuedQuantity;
	}
	public Long getIssuedBy() {
		return issuedBy;
	}
	public void setIssuedBy(Long issuedBy) {
		this.issuedBy = issuedBy;
	}
	public Long getReceivedBy() {
		return receivedBy;
	}
	public void setReceivedBy(Long receivedBy) {
		this.receivedBy = receivedBy;
	}
	public Long getRmId() {
		return rmId;
	}
	public void setRmId(Long rmId) {
		this.rmId = rmId;
	}
	public Long getRmGradeId() {
		return rmGradeId;
	}
	public void setRmGradeId(Long rmGradeId) {
		this.rmGradeId = rmGradeId;
	}
	public String getRmName() {
		return rmName;
	}
	public void setRmName(String rmName) {
		this.rmName = rmName;
	}
	public String getRmGrade() {
		return rmGrade;
	}
	public void setRmGrade(String rmGrade) {
		this.rmGrade = rmGrade;
	}
	public Double getApprovedQuantity() {
		return approvedQuantity;
	}
	public void setApprovedQuantity(Double approvedQuantity) {
		this.approvedQuantity = approvedQuantity;
	}
	public Double getRemainingQuantity() {
		return remainingQuantity;
	}
	public void setRemainingQuantity(Double remainingQuantity) {
		this.remainingQuantity = remainingQuantity;
	}
	public String getRmSpecification() {
		return rmSpecification;
	}
	public void setRmSpecification(String rmSpecification) {
		this.rmSpecification = rmSpecification;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public Long getGrnId() {
		return grnId;
	}
	public void setGrnId(Long grnId) {
		this.grnId = grnId;
	}
	public String getGrnNo() {
		return grnNo;
	}
	public void setGrnNo(String grnNo) {
		this.grnNo = grnNo;
	}
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}
	public Long getOperationId() {
		return operationId;
	}
	public void setOperationId(Long operationId) {
		this.operationId = operationId;
	}
	public String getPartNumber() {
		return partNumber;
	}
	public void setPartNumber(String partNumber) {
		this.partNumber = partNumber;
	}
	public String getRmLotNo() {
		return rmLotNo;
	}
	public void setRmLotNo(String rmLotNo) {
		this.rmLotNo = rmLotNo;
	}
	public String getOperationName() {
		return operationName;
	}
	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public Integer getTotalInspectQty() {
		return totalInspectQty;
	}
	public void setTotalInspectQty(Integer totalInspectQty) {
		this.totalInspectQty = totalInspectQty;
	}
	public Integer getTotalInspectOkQty() {
		return totalInspectOkQty;
	}
	public void setTotalInspectOkQty(Integer totalInspectOkQty) {
		this.totalInspectOkQty = totalInspectOkQty;
	}
	public Integer getTotalInspectRejQty() {
		return totalInspectRejQty;
	}
	public void setTotalInspectRejQty(Integer totalInspectRejQty) {
		this.totalInspectRejQty = totalInspectRejQty;
	}
	
}
