<%--
Document   :Login Action
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.EmailDAO"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%
    	String name=request.getParameter("uname");
    	String pass=request.getParameter("pass");
    	
    	UserBean usr=new UserBean();
    	usr.setUserName(name);
    	usr.setPassword(pass);
    	int status = UserDAO.checkUser(usr);
    	int id=UserDAO.getCustomerId(usr);
    	
    	session.setAttribute("userRole", status);
    	session.setAttribute("usrId",id);
    	
    	if(status == 1){
			
        	session.setAttribute("userName",name);
        	session.setAttribute("password",pass);
    		response.sendRedirect("AdminHome.jsp");
    	}
		if(status == 2){

	    	session.setAttribute("userName",name);
	    	session.setAttribute("password",pass);
	    	
    		response.sendRedirect("UserHome.jsp");
    	}
    	if(status==999){
    		response.sendRedirect("index.jsp?msg=true");
    	}
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>