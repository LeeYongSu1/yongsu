package com.kubg.vo;

public class BookVO {

//	productId       varchar2(50) not null,
//    productCount    VARCHAR2(10) not null,
//    userName        varchar2(20) not null,
//    userPhon        varchar2(50) not null,
//    userAddr        varchar2(50) not null,
	
	private String productId;
	private String productCount;
	private	String userName;
	private	String userPhon;
	private String userAddr;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductCount() {
		return productCount;
	}
	public void setProductCount(String productCount) {
		this.productCount = productCount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhon() {
		return userPhon;
	}
	public void setUserPhon(String userPhon) {
		this.userPhon = userPhon;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	
	
}
