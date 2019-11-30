<%--
Document   :Home Header
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	String type="home";
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="general.css">
<link rel="stylesheet" type="text/css" href="login.css">
<link rel="stylesheet" type="text/css" href="popUp.css">
<script type="text/javascript">
function myFunction() {
	document.getElementById("sgForm").style.display = "block";
	document.getElementById("lgForm").style.display = "none";
}

</script>

    <div id="mainHeader">
      <div id="logoHeader">
        <img src="images/logo.jpg" id="logo">
      </div>
      <div id="homeHeader">
       
        <ul id="menulist" style="margin-left: 500px;">
         <li ><a href="index.jsp" class="lst">Home</a></li>
          <li ><a href="aboutUs.jsp" class="lst">About Us</a></li>
          <li ><a href="contactus.jsp" class="lst">Contact us</a></li>
        </ul>
   
      </div>
    </div>
</head>

