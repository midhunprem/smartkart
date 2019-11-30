<%--
Document   :Feedback Update
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.mvc.smartkart.dao.FeedbackUserDAO"%>
<%@page import="com.mvc.smartkart.beans.FeedbackUserBean"%>
<%@ page import="java.sql.*"%>
<%@include file="UserHeader.jsp" %>
<%
	String date=request.getParameter("date");
	String com=request.getParameter("comnt");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="updatefeedAction.jsp" method="post">

<table>


<tr><td>Date:</td><td><input type="date" name="date" value=<%=date %> required=""></td></tr>
<tr><td>Comment:</td><td><input type="text" name="comment"value="<%=com %>" required=""></td></tr>
<tr><td><input type="submit" value="Update"/></td></tr>
</table>




</form>

</body>
</html>