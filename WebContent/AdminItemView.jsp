<%--
Document   :AdminItemView
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.ItemDAO"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="AdminHeader.jsp" %>
    <%
    	ArrayList<ItemBean> lst=ItemDAO.displayItems();
    %>
    
<body>
	<table id="view">
		<tr>
			<th class="vth">Sl.NO</th><th class="vth">Code</th><th class="vth">Category</th><th class="vth">Name</th><th class="vth">Price</th><th class="vth" colspan="2">Action</th>
		</tr>
		<%
		int i=1;
		for(ItemBean obj:lst) { %>
		<tr>
			<td class="vtd"><%=i %></td>
			<td class="vtd"><%=obj.getCode() %></td>
			<td class="vtd"><%=obj.getCategory() %></td>
			<td class="vtd"><%=obj.getName() %></td>
			<td class="vtd"><%=obj.getPrice()%></td>
			<td class="vtd"><a href="AdminEditFillData.jsp?id=<%=obj.getId()%>"><img alt="Edit" src="images/edit.png" style="width:25px;"></a></td>
			<td class="vtd"><a href="AdminDeleteItem.jsp?id=<%=obj.getId()%>"><img alt="Edit" src="images/delete.png" style="width:25px;"></a></td>
		</tr>
		 <%
		i=i+1; 
		} %>
	</table>
</body>
</html>