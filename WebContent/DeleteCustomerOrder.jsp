<%--
Document   : Delete Customer Order
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    	int id=Integer.parseInt(request.getParameter("id"));
    
    	boolean flag=OrderDAO.deleteOrderByCustomer(id);
    	
    	if(flag){
    		response.sendRedirect("UserNewOrders.jsp");
    	}
    	else{
    		response.sendRedirect("error.jsp");
    	}
    	
    %>