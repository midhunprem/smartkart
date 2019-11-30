<%--
Document   :AdminHome
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="AdminHeader.jsp" %>   

<body style="width:100%;background-image: url(images/admins.jpg);background-size: cover;">
	<h1 id="welcomeHeader" style="margin-top: 210px;margin-left: 590px;">Welcome <%=(String)session.getAttribute("userName") %></h1>
</body>
</html>