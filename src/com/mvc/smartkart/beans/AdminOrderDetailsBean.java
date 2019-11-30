package com.mvc.smartkart.beans;

import java.sql.Date;

public class AdminOrderDetailsBean {

	private int id;
	private Date date;
	private int quantity;
	private double price;
	private String status;
	private String cusName;
	private int custId;
	private String itmName;
	private String itmCode;
	private String itmCategory;
	private double redeemedAmount;
	
	
	public double getRedeemedAmount() {
		return redeemedAmount;
	}
	public void setRedeemedAmount(double redeemedAmount) {
		this.redeemedAmount = redeemedAmount;
	}
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getItmName() {
		return itmName;
	}
	public void setItmName(String itmName) {
		this.itmName = itmName;
	}
	public String getItmCode() {
		return itmCode;
	}
	public void setItmCode(String itmCode) {
		this.itmCode = itmCode;
	}
	public String getItmCategory() {
		return itmCategory;
	}
	public void setItmCategory(String itmCategory) {
		this.itmCategory = itmCategory;
	}
	
}
