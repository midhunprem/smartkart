<%--
Document   :View Admin Report
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.mvc.smartkart.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.smartkart.beans.AdminReportBean"%>
<%@page import="java.sql.Date"%>
<%@ include file="AdminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="margin-left: 600px;margin-top: 150px;">
	<form name="report" action="GenerateReportAction.jsp" method="post">
		<table style="height: 200px;width: 350px;">
			<tr>
				<td>From Date</td>
				<td><input type="date" name="fromDate" class="dateFeild"></td>
			</tr>
			<tr>
				<td>To Date</td>
				<td><input type="date" name="toDate" class="dateFeild"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="btn" value="Generate" onclick="doAcion()"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>