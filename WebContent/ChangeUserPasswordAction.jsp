<%--
Document   :Change User Password Action
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
	String currentpassword = request.getParameter("currentpassword");
	String newpassword = request.getParameter("newpassword");
	String confirmnewpassword = request.getParameter("confirmnewpassword");
	String userName = (String) session.getAttribute("userName");
	UserBean userbean = new UserBean();
	userbean.setPassword(newpassword);
	userbean.setUserName(userName);
	if (newpassword.equalsIgnoreCase(confirmnewpassword)) {
		boolean flag = UserDAO.ChangeUserPassword(userbean);
		if (flag) {
			response.sendRedirect("UserHome.jsp");
		} else {
			response.sendRedirect("error.html");
		}
	} else {
		out.print("Password Missmatch");
	}
%>