<%--
Document   :Customer Order
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.mvc.smartkart.dao.ItemDAO"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@page import="java.util.ArrayList"%>


 <%@include file="UserHeader.jsp" %> 

  <%
    	ArrayList<ItemBean> lst=ItemDAO.displayItems();
    %>
<html>
<head>
<style>
#view {
  border-collapse: collapse;
  
}

th, .mtd {
  padding: 8px;
  text-align: left;
  border-bottom: 2px solid black;
}
</style>
</head>
<body style="width:100%;    background-color: ghostwhite;background-size: cover;">

	<table style="margin-top: 150px;margin-left: 150px;" border="0" id="view">
		<tr id="mth">
			<td colspan="3"><input id="demo" type="text" name="demo" onkeyup="myFunction()" placeholder="            search product" class="txtBox" style="    margin-left: 10px;"></td>
		</tr>
		<%
		int i=1;
		String folder="item_images/";
		String filePath="";
		for(ItemBean obj:lst) { 
			filePath=folder+obj.getImage();
		%>
		<tr>
			
			<td class="mtd">
				<img alt="NO Image Added" src="<%=filePath%>" width="450px" height="250px">
			</td>
			<td class="mtd">
				<table>
					<tr>
						<td style="font-size: 50px;"><p ><%=obj.getName() %></p></td>
					</tr>
					<tr>
						<td style="font-size: 45px;"><p style="margin-top: -50px;"><%=obj.getCategory() %></p></td>
					</tr>
					<tr>
						<td style="font-size: 37px;"><p style="margin-top: -40px;">Rs : <%=obj.getPrice()%></p></td>
					
				</table>
			</td>
			
		<td class="mtd" style="font-size: 20px;width: 200px;">
			<div style="    background: #3ed1e8;
width: 70px;height: 40px;border-radius: 16px;margin-left: 60px;padding-top: 17px;">
				<a href="OrderConfirm.jsp?itmId=<%=obj.getId()%>" style="margin-left: 15px;color: black;text-decoration: none;">Buy</a>
			</div>
			
		
		</td>
		
		</tr>
		 <%
		i=i+1; 
		} %>
	</table>
</body>
</html>