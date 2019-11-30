<%--
Document   :AdminHeader
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    session=request.getSession(false);
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
    String userName = (String) session.getAttribute("userName");
    if (userName==null || userName=="") {
    	response.sendRedirect("index.jsp");
    }
     
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="general.css">
<link rel="stylesheet" type="text/css" href="login.css">
<link rel="stylesheet" type="text/css" href="common.css">
    <div id="mainHeader">
      <div id="logoHeader">
        <img src="images/logo.jpg" id="logo">
      </div>
      <div id="homeHeader" style="margin-left: 300px;">
       
        <ul id="menulist">
          <li ><a href="AdminHome.jsp" class="lst">Home</a></li>
             <li ><a href="additems.jsp" class="lst">Add items</a></li>
                <li ><a href="AdminItemView.jsp" class="lst">View</a></li>
                   <li ><a href="viewOrders.jsp" class="lst">Order Details</a></li>
                      <li ><a href="viewAdminReport.jsp" class="lst">Report</a></li>
                      <li ><a href="RedeemHistory.jsp" class="lst">Redeem History</a></li>
                         <li ><a href="LPSettings.jsp" class="lst">LoyaltySetting</a></li>
                            <li ><a href="feedbackAdminView.jsp" class="lst">Feedback</a></li>
          <li ><a href="contactus.jsp" class="lst">Contact us</a></li>
            <li ><a href="logout.jsp" class="lst">Logout</a></li>
        </ul>
   
      </div>
    </div>
    </head>

