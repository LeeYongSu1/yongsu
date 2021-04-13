package com.kubg.vo;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {

//	gdsNum       number          not null,
//    gdsName      varchar2(50)    not null,
//    cateCode     varchar2(30)    not null,
//    gdsPrice     number          not null,
//    gdsStock     number          null,
//    gdsDes       varchar(500)    null,
//    gdsImg       varchar(200)    null,
//    gdsDate      date            default sysdate,
//    primary key(gdsNum)  
	
	private int product_num;
	private String product_name;
	private String product_price;
	private String product_model;
	private String product_color;
	private String product_info;
	private String gdsImg;
	private String gdsThumImg;
    private MultipartFile file;
	
    
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	public String getGdsThumImg() {
		return gdsThumImg;
	}
	public void setGdsThumImg(String gdsThumImg) {
		this.gdsThumImg = gdsThumImg;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	private String gdsThumbImg;
	
	public String getGdsThumbImg() {
		return gdsThumbImg;
	}
	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_model() {
		return product_model;
	}
	public void setProduct_model(String product_model) {
		this.product_model = product_model;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public MultipartFile getFile1() {
		return file;
	}
	public void setFile1(MultipartFile file) {
		this.file = file;
	}
	

	
	
	
}
