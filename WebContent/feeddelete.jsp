<%--
Document   :Feedback delete
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.smartkart.dao.FeedbackUserDAO"%>
<%@page import="com.mvc.smartkart.beans.FeedbackUserBean"%>
<%@ page import="java.sql.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	FeedbackUserBean feedbackuserbean = new FeedbackUserBean();
	feedbackuserbean.setId(id);
	out.print(id);
	boolean flag = FeedbackUserDAO.deleteFeed(feedbackuserbean);
	if (flag == true) {

		response.sendRedirect("feedbackUser.jsp");
	} else {

		response.sendRedirect("error.html");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>