<%--
Document   :Redeem History
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.RedeemHistoryDAO"%>
<%@page import="com.mvc.smartkart.beans.RedeemHistoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="AdminHeader.jsp" %>
    
    <%
    	ArrayList<RedeemHistoryBean> lst=RedeemHistoryDAO.displayRedeemHistory();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table id="view" style="width: 1200px;
    box-shadow: 0 0 20px black;
    margin-left: 150px;" >
		<tr>
			<th class="vth">Sl.NO</th>
			<th class="vth">Date</th>
			<th class="vth">Name</th>
			<th class="vth">Points</th>
			<th class="vth">Rate Per Point</th>
			
		</tr>
		<%
		int i=1;
		for(RedeemHistoryBean obj:lst) { 
		
		%>
		<tr>
			<td class="vtd" align="center"><%=i %></td>
			<td class="vtd" align="center"><%=obj.getDate() %></td>
			<td class="vtd" align="center"><%=obj.getName() %></td>
			<td class="vtd" align="center"><%=obj.getPoint() %></td>
			<td class="vtd" align="center"><%=obj.getPointRate()%></td>
		</tr>
		 <%
		i=i+1; 
		} %>
	</table>
</body>
</html>