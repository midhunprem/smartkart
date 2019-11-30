<%--
Document   :Logout 
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="javax.mail.Session"%>
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
    response.sendRedirect("index.jsp?val=You are successfully logged out");
}
// out.print("<center><font color='green'>You are successfully logged out</font></center>"); 

//request.getRequestDispatcher("index.html").include(request, response);

session=request.getSession();
session.invalidate();
response.sendRedirect("index.jsp?val=You are successfully logged out");
%>