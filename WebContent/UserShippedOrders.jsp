<%--
Document   :User Shipped Orders
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.OrderDAO"%>
<%@page import="com.mvc.smartkart.beans.UserOrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="UserHeader.jsp" %>
    
    <%
    	String name=(String)session.getAttribute("userName");
   
	 	String pwd=(String)session.getAttribute("password");
	 	//out.print(name+pwd);
	 	UserBean usr=new UserBean();
	 	usr.setUserName(name);
	 	usr.setPassword(pwd);
	 	int cusId=UserDAO.getCustomerId(usr);
	 	
	 	ArrayList<UserOrderBean> lst=OrderDAO.displayShippedOrder(cusId);
	 	
	 	
    %>
<body style="background-color: white;">
	
 	<table id="view">
		<tr>
			<th class="vth">Sl.NO</th>
			<th class="vth">OrderDate</th>
			<th class="vth">ItemName</th>
			<th class="vth">Price</th>
			<th class="vth">Status</th>
			  
		</tr>
		<%
		int i=1;
		for(UserOrderBean obj : lst) { %>
		<tr>
			<td class="vtd"><%=i %></td>
			<td class="vtd"><%=obj.getOrderDate() %></td>
			<td class="vtd"><%=obj.getItemName() %></td>
			<td class="vtd"><%=obj.getPrice()%></td>
			<td class="vtd"><%=obj.getStatus()%></td>
			
		</tr>
		 <%
		i=i+1; 
		} %>
	</table>
</body>
</html>