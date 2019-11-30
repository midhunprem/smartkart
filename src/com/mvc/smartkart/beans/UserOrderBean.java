package com.mvc.smartkart.beans;

import java.sql.Date;

public class UserOrderBean {
private int id;
private Date orderDate;
private String itemName;
private int price;
private String status;
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

public String getItemName() {
	return itemName;
}
public void setItemName(String itemName) {
	this.itemName = itemName;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

}
