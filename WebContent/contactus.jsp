<%--
Document   :Contact us
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    	<%
    	int role=999;
    	if(session.getAttribute("userRole") == null ){%>
    		<%@ include file="HomeHeader.jsp" %>
    	<%} else {
    	
    		role=(Integer)session.getAttribute("userRole");
    		if(role==1){%>
    			<%@ include file="AdminHeader.jsp" %>
    		<%} %>
    		<%if(role==2){%>
    			<%@ include file="UserHeader.jsp" %>
    		<%} %>
    		<%if(role==999){%>
    			<%@ include file="HomeHeader.jsp" %>
    		<%} %>
    	<%} %>
    	
    <%out.print(role); %>


<%

%>
<!DOCTYPE html>
<html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<body class="main">

<img src="images/contact.jpg" width="1500px" height="400px" style="    margin-top: 25px;" >
<div>
<h1 style= "text-align:center;">For more queries</h1>
<h2 style= "text-align:center;">CONTACT CUSTOMER CARE</h2>
<img src="images/customer.jpg" width="1500px" height="250px" >
</div>
</body>
</html>
<%@ include file="HomeFooter.jsp" %>
