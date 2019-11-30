package com.mvc.smartkart.beans;

import java.sql.Date;

public class RedeemHistoryBean {

	private int id;
	private Date date;
	private String name;
	private double point;
	private double pointRate;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPoint() {
		return point;
	}
	public void setPoint(double point) {
		this.point = point;
	}
	public double getPointRate() {
		return pointRate;
	}
	public void setPointRate(double pointRate) {
		this.pointRate = pointRate;
	}
	
	
	
}
