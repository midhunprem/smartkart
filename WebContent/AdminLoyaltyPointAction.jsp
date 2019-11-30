<%--
Document   :AdminLoyaltyPointAction
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.LoyaltyPointDAO"%>
<%@page import="com.mvc.smartkart.beans.LoyaltyPointBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%
 	double ratePerPoint=Double.parseDouble(request.getParameter("rpp"));
 	int expiry=Integer.parseInt(request.getParameter("expiry"));
 	int id=Integer.parseInt(request.getParameter("id"));
 	int payable=Integer.parseInt(request.getParameter("payable"));
 	
 	LoyaltyPointBean lp=new LoyaltyPointBean();
 	lp.setId(id);
 	lp.setRatePerPoint(ratePerPoint);
 	lp.setExpiryDays(expiry);
 	lp.setPayable(payable);
 	
 	boolean flag=LoyaltyPointDAO.updateLoyaltyPoint(lp);
 	
 	if(flag){
 		response.sendRedirect("LPSettings.jsp");
 	}
 	else{
 		response.sendRedirect("error.jsp");
 	}
 %>