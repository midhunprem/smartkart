<%--
Document   :Loyalty point settings
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.LoyaltyPointDAO"%>
<%@page import="com.mvc.smartkart.beans.LoyaltyPointBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="AdminHeader.jsp" %>

<%
	ArrayList<LoyaltyPointBean> lst=LoyaltyPointDAO.getLoyaltyPointForAdmin();
%>
<body style="width:100%;background-image: url(images/watch2.jpg);background-size: cover;">
	<form name="LPSettings" action="AdminLoyaltyPointAction.jsp" method="post">
	<% for(LoyaltyPointBean obj:lst) { %>
		<table style="margin-top: 200px;margin-left: 550px;width: 500px;height: 120px;border-spacing: 20px;">
			<tr>
				<td>Rate Per Point</td>
				<td><input type="text" name="rpp" value="<%=obj.getRatePerPoint()%>" style="width: 200px;height: 30px;border-radius: 15px;"></td>
			</tr>	
			<tr>
				<td>Expiry Days</td>
				<td><input type="text" name="expiry" value="<%=obj.getExpiryDays()%>" style="width: 200px;height: 30px;border-radius: 15px;"></td>
			</tr>	
			<tr>
				<td>Payable(percent)</td>
				<td><input type="text" name="payable" value="<%=obj.getPayable()%>" style="width: 200px;height: 30px;border-radius: 15px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Set LoyaltyPoint" style="margin-top: 20px;border-radius:10px;background-color: beige;height: 30px;"></td>
				
			</tr> 
		</tabe>
		<input type="hidden" name="id" value="<%=obj.getId()%>">
		<%} %>
	</form>
</body>
</html>