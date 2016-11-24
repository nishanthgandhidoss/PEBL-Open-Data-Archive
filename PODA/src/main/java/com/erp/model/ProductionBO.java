package com.erp.model;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

public class ProductionBO extends CommonBO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1901717805606905829L;
	
	private Long routeCardNo;
	private Date productionDate;
	private Long totalOkQuantity;
	private Long totalRejectQuantity;
	private String prodFlag;
	private String isUpdated;
	private Long prodId;
	
	@Autowired
	private ArrayList<ShiftBO> shiftBo;
	
	public Date getProductionDate() {
		return productionDate;
	}
	public void setProductionDate(Date productionDate) {
		this.productionDate = productionDate;
	}
	public Long getTotalOkQuantity() {
		return totalOkQuantity;
	}
	public void setTotalOkQuantity(Long totalOkQuantity) {
		this.totalOkQuantity = totalOkQuantity;
	}
	public Long getTotalRejectQuantity() {
		return totalRejectQuantity;
	}
	public void setTotalRejectQuantity(Long totalRejectQuantity) {
		this.totalRejectQuantity = totalRejectQuantity;
	}
	public Long getRouteCardNo() {
		return routeCardNo;
	}
	public void setRouteCardNo(Long routeCardNo) {
		this.routeCardNo = routeCardNo;
	}
	public ArrayList<ShiftBO> getShiftBo() {
		return shiftBo;
	}
	public void setShiftBo(ArrayList<ShiftBO> shiftBo) {
		this.shiftBo = shiftBo;
	}
	public String getProdFlag() {
		return prodFlag;
	}
	public void setProdFlag(String prodFlag) {
		this.prodFlag = prodFlag;
	}
	public String getIsUpdated() {
		return isUpdated;
	}
	public void setIsUpdated(String isUpdated) {
		this.isUpdated = isUpdated;
	}
	public Long getProdId() {
		return prodId;
	}
	public void setProdId(Long prodId) {
		this.prodId = prodId;
	}
}
