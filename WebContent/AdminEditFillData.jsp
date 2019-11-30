<%--
Document   :AdminEditFillData
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.ItemDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="AdminHeader.jsp" %>

<%
	int id=Integer.parseInt(request.getParameter("id"));
	session.setAttribute("itemId",id);
	ItemBean itm=new ItemBean();
	itm.setId(id);
	ArrayList<ItemBean> lst=ItemDAO.displayItemsForAdminEdit(itm);

%>

<body>
	<form name="fill" action="AdminEditAction.jsp" method="post">
	<% for(ItemBean obj : lst) { %>
		<table class="RegTable">
		<tr>
			<td>Item Code:</td>
			<td><input type="text" name="code" class="textbox" value="<%=obj.getCode()%>"></td>
		</tr>
		<tr>
			<td>Item Category:</td>
			<td>
				<select class="textbox" name="text">
					<option value="select">---select---</option>
					<option value="Electronics">Electronics</option>
					<option value="Stationary">Stationary</option>
					<option value="Furniture">Furniture</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Item name:</td>
			<td><input type="text" name="name" class="textbox" value="<%=obj.getName()%>"></td>
		</tr>
		<tr>
			<td>Item Price:</td>
			<td><input type="text" name="price" class="textbox" value="<%=obj.getPrice()%>"></td>
		
		</tr>
		<tr>
			
			<td colspan="2" align="center"><input type="submit" value="submit" class="textbox"><input type="hidden" name="id" value="<%=id %>"></td>
		</tr>
	</table>
	<%} %>
	</form>
</body>
</html>