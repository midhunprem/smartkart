package com.mvc.smartkart.beans;

public class FeedbackUserBean {
public int id;
public String name;
public String date;
public String comment;
public int cid;

public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
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
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}


}
