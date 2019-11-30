<%--
Document   :AdminDeleteItem
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.ItemDAO"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	int id=Integer.parseInt(request.getParameter("id"));
	ItemBean itm=new ItemBean();
	itm.setId(id);
	boolean flag=ItemDAO.deleteItemAdmin(itm);
	if(flag){
		response.sendRedirect("AdminItemView.jsp");
	}
	else{
		out.print("Error Occured");
	}

%>