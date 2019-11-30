<%--
Document   :Sign In Action
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	String name=request.getParameter("name");
    	String email=request.getParameter("email");
    	double number=Double.parseDouble(request.getParameter("number"));
    	String uname=request.getParameter("uname");
    	String pass=request.getParameter("pass");
    	int role=2;
    	int availLP=0;
    	
    	UserBean usr=new UserBean();
    	usr.setName(name);
    	usr.setEmail(email);
    	usr.setNumber(number);
    	usr.setUserName(uname);
    	usr.setPassword(pass);
    	usr.setRole(role);
    	usr.setAvailableLP(availLP);
    	
    	boolean flag = UserDAO.signinNewUser(usr);
    	if(flag){ 
    		response.sendRedirect("index.jsp?res=true");
    	}
    	else{
    		out.print("Error");
    	}
    %>
