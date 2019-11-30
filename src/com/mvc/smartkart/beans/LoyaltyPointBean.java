package com.mvc.smartkart.beans;

public class LoyaltyPointBean {
	private int id;
	private double ratePerPoint;
	private int expiryDays;
	private int payable;
	
	public int getPayable() {
		return payable;
	}
	public void setPayable(int payable) {
		this.payable = payable;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getRatePerPoint() {
		return ratePerPoint;
	}
	public void setRatePerPoint(double ratePerPoint) {
		this.ratePerPoint = ratePerPoint;
	}
	public int getExpiryDays() {
		return expiryDays;
	}
	public void setExpiryDays(int expiryDays) {
		this.expiryDays = expiryDays;
	}
	
}
