package com.mvc.smartkart.beans;

import java.sql.Date;

public class OrderBean {
	
	
	private int id;
	private Date orderDate;
	private Date updateDate;
	private int itemId;
	private int customerId;
	private int quantity;
	private double price;
	private String status;
	private double availLp;
	private double redeemedAmount;
	
	
	
	public double getAvailLp() {
		return availLp;
	}
	public void setAvailLp(double availLp) {
		this.availLp = availLp;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getRedeemedAmount() {
		return redeemedAmount;
	}
	public void setRedeemedAmount(double redeemedAmount) {
		this.redeemedAmount = redeemedAmount;
	}
	
}
