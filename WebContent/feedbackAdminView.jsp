<%--
Document   :Feedback Admin View
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.smartkart.dao.FeedbackUserDAO"%>
<%@page import="com.mvc.smartkart.beans.FeedbackUserBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="AdminHeader.jsp" %>
    <%
ArrayList<FeedbackUserBean> lb=FeedbackUserDAO.viewAdminFeed();

   FeedbackUserBean feedbackuserbean=new FeedbackUserBean();

 		int size=0;
 		size=lb.size();
      if(size==0){%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
      <% }else{%>
      <table width="500" border="1"  align="center">

<tr>
	<td align="center">Sl.No</td>
	
	<td align="center">User Name</td>	
		
     <td align="center">date</td> 
     <td align="center">Comment</td> 
     
     
      
    
	
</tr>
      <% 
 		int i=1;
      
 			for(FeedbackUserBean it:lb){

 			
  
                %>
                 <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i++ %></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getName()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getDate()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getComment()%></span></div></td>
	
	 
	</tr>
  
  <% } }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>