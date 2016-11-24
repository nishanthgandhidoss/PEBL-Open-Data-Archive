package com.erp.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GRNBO extends CommonBO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6121342679948880101L;
	
	private String grnNo;
	private Date grnDate;
	private Long rmId;
	private Long rmGradeId;
	private String rmName;
	private String rmSpecification;
	
	private String rmGradeName;
	private Double quantity;
	private Double approvedQuantity;
	private Double remainingQuantity;
	private Integer noOfBags;
	private Double quantityPerBag;
	private Integer approvedBags;
	private String invoiceNo;
	private Date invoiceDate;
	private Long supplierId;
	private String supplierName;
	private String rmLotNo;
	private String rmTestReportNo;
	private Date rmManufactureDate;
	private String remarks;
	private Long approvedBy;
	private String approvedFlag;
	private String hostIp;
	private String storeLocation;
	
	private Long qcApprovedBags;
	private String tallyGrnNo;

	public String getGrnNo() {
		return grnNo;
	}
	public void setGrnNo(String grnNo) {
		this.grnNo = grnNo;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public Long getQcApprovedBags() {
		return qcApprovedBags;
	}
	public void setQcApprovedBags(Long qcApprovedBags) {
		this.qcApprovedBags = qcApprovedBags;
	}
	public String getRmGradeName() {
		return rmGradeName;
	}
	public void setRmGradeName(String rmGradeName) {
		this.rmGradeName = rmGradeName;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public Date getGrnDate() {
		return grnDate;
	}
	public void setGrnDate(Date grnDate) {
		this.grnDate = grnDate;
	}
	public String getRmSpecification() {
		return rmSpecification;
	}
	public void setRmSpecification(String rmSpecification) {
		this.rmSpecification = rmSpecification;
	}
	
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Integer getNoOfBags() {
		return noOfBags;
	}
	public void setNoOfBags(Integer noOfBags) {
		this.noOfBags = noOfBags;
	}
	public Double getQuantityPerBag() {
		return quantityPerBag;
	}
	public void setQuantityPerBag(Double quantityPerBag) {
		this.quantityPerBag = quantityPerBag;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public Date getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getRmLotNo() {
		return rmLotNo;
	}
	public void setRmLotNo(String rmLotNo) {
		this.rmLotNo = rmLotNo;
	}
	public String getRmTestReportNo() {
		return rmTestReportNo;
	}
	public void setRmTestReportNo(String rmTestReportNo) {
		this.rmTestReportNo = rmTestReportNo;
	}
	public Date getRmManufactureDate() {
		return rmManufactureDate;
	}
	public void setRmManufactureDate(Date rmManufactureDate) {
		this.rmManufactureDate = rmManufactureDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Long getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(Long approvedBy) {
		this.approvedBy = approvedBy;
	}
	public String getApprovedFlag() {
		return approvedFlag;
	}
	public void setApprovedFlag(String approvedFlag) {
		this.approvedFlag = approvedFlag;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
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
	public Integer getApprovedBags() {
		return approvedBags;
	}
	public void setApprovedBags(Integer approvedBags) {
		this.approvedBags = approvedBags;
	}
	public String getTallyGrnNo() {
		return tallyGrnNo;
	}
	public void setTallyGrnNo(String tallyGrnNo) {
		this.tallyGrnNo = tallyGrnNo;
	}
	
}
