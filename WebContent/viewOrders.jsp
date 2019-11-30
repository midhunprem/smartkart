<%--
Document   :View Orders
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.beans.AdminOrderDetailsBean"%>
<%@page import="com.mvc.smartkart.dao.OrderDAO"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@page import="com.mvc.smartkart.beans.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="AdminHeader.jsp" %>

<%
	ArrayList<AdminOrderDetailsBean> lst=OrderDAO.displayOrders();
%>
<html>
<head>
	<script type="text/javascript">
		function doAction(id,price,cusId) {
			var select=document.getElementById("status");
			var status=select.options[select.selectedIndex].value;
			//document.getElementById("demo").value=
			window.location = "AdminOrderActions.jsp?id="+id+"&price="+price+"&status="+status+"&cusId="+cusId+"";
		}
		function myFunction() {
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("demo");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("view");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[1];
			    if (td) {
			      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
			}
	</script>
</head>
<body style="width:100%;background-image: url(images/watch2.jpg);background-size: cover;">
<input id="demo" type="text" name="demo" onkeyup="myFunction()" placeholder="            search by customer name" class="txtBox">
	<div>
		<table id="view" style="box-shadow: 0 0 20px black;background-color: white;" >
		<tr>
			<th class="vth">Sl.NO</th>
			<th class="vth">Customer Name</th>
			<th class="vth">Ordered Date</th>
			<th class="vth">Item Code</th>
			<th class="vth">Item Category</th>
			<th class="vth">Item Name</th>
			<th class="vth">Quantity</th>
			<th class="vth">Price</th>
			<th class="vth">Redeemed Amount</th>
			<th class="vth">Total Price</th>
			
			
			<th class="vth">Status</th>
		</tr>
		<%
		int i=1;
		for(AdminOrderDetailsBean obj:lst) { 
			/*UserBean usr=new UserBean();
			ItemBean itm=new ItemBean();
			int cusId=obj.getCustomerId();
			int itmId=obj.getItemId();
			usr.setId(cusId);
			itm.setId(itmId);
			String cusName=OrderDAO.getCusromerNameBuId(usr);
			String itmName=OrderDAO.getItemNameBuId(itm);*/
			double totalPrice=(obj.getPrice()*obj.getQuantity())-obj.getRedeemedAmount();
		%>
		<tr>
			<td class="vtd"><%=i %></td>
			<td class="vtd"><%=obj.getCusName() %></td>
			<td class="vtd"><%=obj.getDate() %></td>
			<td class="vtd"><%=obj.getItmCode() %></td>
			<td class="vtd"><%=obj.getItmCategory() %></td>
			<td class="vtd"><%=obj.getItmName()%></td>
			<td class="vtd"><%=obj.getQuantity()%></td>
			<td class="vtd"><%=obj.getPrice() %></td>
			<td class="vtd"><%=obj.getRedeemedAmount()%></td>
			<td class="vtd"><%=totalPrice %></td>
			<td class="vtd">
				<select id="status" name="sts" onchange="doAction(<%=obj.getId()%>,<%=(obj.getPrice()*obj.getQuantity())%>,<%=obj.getCustId()%>)">
				<%if(obj.getStatus().equals("ordered")){ %>
					<option value="ordered" selected="selected">Ordered</option>
					<option value="shipped" >Shipped</option>
					<option value="closed">Closed</option>
					<%} if(obj.getStatus().equals("shipped")){%>
					<option value="shipped" selected="selected">Shipped</option>
					<option value="closed">Closed</option>
					<%} if(obj.getStatus().equals("closed")){%>
					<option value="closed" selected="selected">Closed</option>
					<%} %>
				</select>
			</td>
		</tr>
		 <%
		i=i+1; 
		} %>
	</table>
	</div>
	
	
</body>
</html>