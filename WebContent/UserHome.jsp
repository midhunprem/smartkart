<%--
Document   :User Home
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="UserHeader.jsp" %>   

<body style="width:100%;background-image: url(images/openshop.jpg);background-size: cover;">
<%
// out.print("<center><font color='green'>You are successfully logged out</font></center>"); 

//request.getRequestDispatcher("index.html").include(request, response);


%>
	<h1 id="welcomeHeader">Welcome <%=(String)session.getAttribute("userName") %></h1>
</body>
</html>