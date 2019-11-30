package com.mvc.smartkart.beans;

import java.sql.Date;

public class UserBean {
	private int id;
	private String name;
	private String email;
	private double number;
	private String userName;
	private String password;
	private int role;
	private double availableLP;
	private Date lastRedeemDate;
	
	
	public Date getLastRedeemDate() {
		return lastRedeemDate;
	}
	public void setLastRedeemDate(Date lastRedeemDate) {
		this.lastRedeemDate = lastRedeemDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getNumber() {
		return number;
	}
	public void setNumber(double number) {
		this.number = number;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public double getAvailableLP() {
		return availableLP;
	}
	public void setAvailableLP(double availableLP) {
		this.availableLP = availableLP;
	}
}
