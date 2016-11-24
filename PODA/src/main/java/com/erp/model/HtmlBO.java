package com.erp.model;

public class HtmlBO {

	 //<a href="javascript:void(0)" onclick="loadBarcodeImg(${grnObj.grnNo})"  class="tooltipLink"  title="Print GRN Barcode">
	// <span style="color:#333" class="glyphicon glyphicon-barcode"></span></a>*/
	private String clickAction="";
	
	private String cls="";
	
	private String title="";
	
	public String getClickAction() {
		return clickAction;
	}

	public void setClickAction(String clickAction) {
		this.clickAction = clickAction;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getServerUrl() {
		return serverUrl;
	}

	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}

	public String getGlyphicons() {
		return glyphicons;
	}

	public void setGlyphicons(String glyphicons) {
		this.glyphicons = glyphicons;
	}

	private String serverUrl="";
	
	private String glyphicons="";
	
}
