<%--
Document   :User Header
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
  
    	
    	int availableLP=0,id=0;
    	session=request.getSession(false);
    	response.setHeader("Cache-Control","no-cache");
    	response.setHeader("Cache-Control","no-store");
    	response.setDateHeader("Expires", 0);
    	response.setHeader("Pragma","no-cache");
    	
    	if (session.getAttribute("usrId")==null) {
    	    response.sendRedirect("index.jsp");
    	}
    	else{
    		id=(Integer)session.getAttribute("usrId");
    		UserBean avl=new UserBean();
        	avl.setId(id);
        	availableLP=UserDAO.getAvailableLoyaltyPoint(avl);
    	}
    
    %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="general.css">
<link rel="stylesheet" type="text/css" href="login.css">
<link rel="stylesheet" type="text/css" href="common.css">
<link rel="stylesheet" type="text/css" href="popUp.css">

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

    <div id="mainHeader">
      <div id="logoHeader">
        <img src="images/logo.jpg" id="logo">
      </div>
   
      <div id="homeHeader"">
       
        <ul id="menulist" style="    margin-left: 40px;">
          <li ><a href="UserHome.jsp" class="lst">Home</a></li>
             <li ><a href="CusetomerOrder.jsp" class="lst">order</a></li>
             <li >
             	<div class="dropdown">
  					<button class="dropbtn">My Orders</button>
  					<div class="dropdown-content">
    					<a href="UserPastOrders.jsp">Past Orders</a>
    					<a href="UserShippedOrders.jsp">Shipped Orders</a>
    					<a href="UserNewOrders.jsp">New Orders</a>
  					</div>
				</div>
             	
             </li>
             <li ><a href="changePassword.jsp" class="lst">Change Password</a></li>
         <li ><a href="http://localhost:4200/insertFeedback?name=midhun" class="lst">Feedback</a></li>
          <li ><a href="contactus.jsp" class="lst">Contact us</a></li>
           <li ><a href="logout.jsp" class="lst">Logout</a></li>
        </ul>
   
      </div>
    </div>
       <p style="margin-top: -100px;margin-left:1200px;color:red;">Available Loyalty Point : <b><%=availableLP %></b></p>
     
      
    </head>