<%--
Document   :User FeedBack Action
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.smartkart.dao.FeedbackUserDAO"%>
<%@page import="com.mvc.smartkart.beans.FeedbackUserBean"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page import="java.sql.*"%>
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
	String date = request.getParameter("date");
	String comment = request.getParameter("comment");
	String userName = (String) session.getAttribute("userName");
	String password = (String) session.getAttribute("password");

	FeedbackUserBean fb = new FeedbackUserBean();
	UserBean ub = new UserBean();

	fb.setDate(date);
	fb.setComment(comment);
	fb.setName(userName);
	ub.setUserName(userName);
	ub.setPassword(password);
	int id = UserDAO.getCustomerId(ub);
	fb.setCid(id);

	boolean flag = FeedbackUserDAO.insertFeedback(fb);
	if (flag) {
		response.sendRedirect("feedbackUser.jsp");
	} else {
		response.sendRedirect("error.html");
	}
%>
