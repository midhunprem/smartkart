<%--
Document   :Generate Report Action
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.smartkart.beans.AdminReportBean"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="AdminHeader.jsp" %>

<%
	Date fromDate=Date.valueOf(request.getParameter("fromDate"));
	Date toDate=Date.valueOf(request.getParameter("toDate"));

	AdminReportBean report=new AdminReportBean();
	
	report.setFromDate(fromDate);
	report.setToDate(toDate);
	
	ArrayList<AdminReportBean> lst=OrderDAO.getAdminSalesReport(report);
%>

<html>
<head>

</head>
<body>
<table id="view">
	<tr>
		<th class="vth">SlNo</th>
		<th class="vth">Date</th>
		<th class="vth">Category</th>
		<th class="vth">Item</th>
		<th class="vth">Price</th>
	</tr>
	<%
	double totalPrice=0;
	int i=1;
	for(AdminReportBean obj : lst){
		totalPrice+=obj.getPrice();
		%>
	<tr>
		<td class="vtd"><%=i %></td>
		<td class="vtd"><%=obj.getDate() %></td>
		<td class="vtd"><%=obj.getCategory() %></td>
		<td class="vtd"><%=obj.getItemName() %></td>
		<td class="vtd"><%=obj.getPrice() %></td>
	</tr>
	<%i++;} %>
	
	<tr>
		<td colspan="5" align="right">Total Sales  :  <%=totalPrice %></td>
	</tr>
</table>
</body>
</html>