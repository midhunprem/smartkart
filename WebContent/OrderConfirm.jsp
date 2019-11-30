<%--
Document   :Order Confirm
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.ItemDAO"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    	int itmId=Integer.parseInt(request.getParameter("itmId"));
    	String name=(String)session.getAttribute("userName");
    	String password=(String)session.getAttribute("password");
    	UserBean usr=new UserBean();
    	usr.setUserName(name);
    	usr.setPassword(password);
    	int cusId=UserDAO.getCustomerId(usr);
    	ItemBean obj=new ItemBean();
    	obj.setId(itmId);
    	ArrayList<ItemBean> lst=ItemDAO.displayItemsForAdminEdit(obj);
    	
    	//out.print(itmId+"  "+name+password+cusId);
    
    %>
  <%@ include file="UserHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
            function Change() {
                var qty = document.getElementById("quantity").value;
                var price = document.getElementById("price").value;
                var hidPrice=document.getElementById("hid").value;
                document.getElementById("price").value=(hidPrice*qty);
            }
            function showPopUp() {
				document.getElementById("pop").style.display="block";
				document.getElementById("form").style.display="none";
			}
            
            function yes(){
            	document.getElementById('orderForm').action="OrderConfirmAction.jsp?lp=true";
                document.getElementById('orderForm').submit();
            	
            }
            function no(){
            	document.getElementById('orderForm').action="OrderConfirmAction.jsp?lp=false";
                document.getElementById('orderForm').submit();
            	
            }
        </script>
</head>
<body style="width:100%;background-image: url(images/passion.jpg);background-size: cover;">
	<div id="form">
		<form id="orderForm" method="post" onsubmit="setAction()" style="margin-top: 200px;margin-left: 600px;">
	<% for(ItemBean objt:lst) { %>
	
		<table id="tbl" style="width: 450px;height: 200px;">
			<tr>
				<td><p style="font-size: 22px;font-weight: bold;color: black;">Item Name</p></td>
				<td><input type="text" name="itmName" value="<%=objt.getName()%>" class="textBox"></td>
			</tr>
			<tr>
				<td><p style="font-size: 22px;font-weight: bold;color: black;">Item Price</p></td>
				<td><input type="text" id="price" name="itmPrice" value="<%=objt.getPrice()%>" class="textBox"></td>
				<td><input type="hidden" id="hid" name="itm" value="<%=objt.getPrice()%>"></td>
			</tr>
			<tr>
				<td><p style="font-size: 22px;font-weight: bold;color: black;">Item Name</p></td>
				<td>
					<select id="quantity" name="qty" onchange="Change()" class="textBox">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="hidden" name="itmId" value="<%=itmId%>" ></td>
			</tr>
		</table>
		<%} %>
		<input type="button" id="btn" value="Confirm Ordr" onclick="showPopUp()" class="cnfBtn">
		
	</form>
	</div>
	
	<div id="pop">
			<p style="margin-top: 20px;margin-left: 80px;font-size: xx-large;">Do you want to Redeem your Loyalty point..?</p>
			<input type="submit" value="yes" onclick="yes()" class="cnfBtn" style="margin-left: 200px;">&nbsp&nbsp&nbsp<input type="submit" class="cnfBtn" value="No" onclick="no()" style="margin-left: 40px;">
		</div>
</body>
</html>