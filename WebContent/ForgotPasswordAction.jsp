<%--
Document   :Forgot Password Action
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.EmailDAO"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	String name="";
    	name=request.getParameter("uname");
    	String email=request.getParameter("email");
    	System.out.println(name);
    
    	
    	
    	UserBean usr=new UserBean();
    	usr.setUserName(name);
    	usr.setEmail(email);
    	int count = UserDAO.checkForgotPassword(usr);
    	String newPassword="aparna";
    	usr.setPassword(newPassword);
    	
    	if(count>=1){ 
    		boolean flag=UserDAO.updatePassword(usr);
    		if(flag){
    			
    			EmailDAO.send("smartkartpvtltd@gmail.com","smartkart123" ,email,"change password","Hi "+name+" Your temporary password is "+newPassword+"");
    		response.sendRedirect("index.jsp");
    		}
    		else{
    			out.println("fail");	
    		}
    		//response.sendRedirect("NewPassword.jsp");
    	}
    	else{
    		out.print("Error");
    	}
    %>
    


