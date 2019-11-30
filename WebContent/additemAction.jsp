<%--
Document   :AddItemAction
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
    
    
         <%@page import="com.mvc.smartkart.dao.ItemDAO"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%


String code=request.getParameter("code");
String text=request.getParameter("text");

String name=request.getParameter("name");
double price=Double.parseDouble(request.getParameter("price"));

/*String code=(String)session.getAttribute("itm_code"); //request.getParameter("code");
String text=(String)session.getAttribute("itm_text");//request.getParameter("text");

String name=(String)session.getAttribute("itm_name"); //request.getParameter("name");
//Double.parseDouble(request.getParameter("price"));
double price=(double)session.getAttribute("itm_price");*/


    String fileName=(String)session.getAttribute("fileName");
 	ItemBean itembeans=new ItemBean();
    itembeans.setCode(code);
    itembeans.setCategory(text);
    itembeans.setName(name);
    itembeans.setPrice(price);
    itembeans.setImage(fileName);
    out.print(fileName+"  "+code+" "+text+" "+name+"  "+price);
    boolean flag=ItemDAO.insertadminitem(itembeans);

		     
	if(flag==true){
		        
		response.sendRedirect("additems.jsp");
	}
	else{
		      
		  response.sendRedirect("error.html");
		    
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