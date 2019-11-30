<%--
Document   :AdminEditAction
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@page import="com.mvc.smartkart.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String code=request.getParameter("code");
	String text=request.getParameter("text");
	int id=(Integer)session.getAttribute("itemId");
	String name=request.getParameter("name");
	float price= Float.parseFloat(request.getParameter("price"));
	ItemBean obj=new ItemBean();
	obj.setCode(code);
	obj.setCategory(text);
	obj.setName(name);
	obj.setPrice(price);
	obj.setId(id);
	boolean flag=ItemDAO.updateItemAdmin(obj);
	
	if(flag){
		response.sendRedirect("AdminItemView.jsp");
	}
	else{
		out.print("Error occured");
	}
%>