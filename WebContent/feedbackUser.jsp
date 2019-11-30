<%--
Document   :Feedback User
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
<%@include file="UserHeader.jsp" %>
<%
	ArrayList<FeedbackUserBean> arrFb=new ArrayList<FeedbackUserBean>();
	String userName=(String)session.getAttribute("userName");
	
	arrFb = FeedbackUserDAO.viewFeed(userName);
%>

	<form name="feedback" action="UserFeedbackAction.jsp" method="post">
		<table style="margin-top: 150px;margin-left: 400px;width: 700px;">
			<tr>
				<td>Date</td>
				<td><input type="date" name="date" required=""></td>
			</tr>
			<tr>
				<td>Comment</td>
				<td><textarea rows="3" cols="" name="comment" required=""></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="feedback" value="Submit" style="margin-left: 200px;margin-top: 20px;"></td>
			</tr>
		</table>
	</form>
	<%
	int i=1;
	
	if(arrFb.size() > 0){
						
%>
	<table border="1" style="margin-top: 50px;margin-left: 360px;width: 700px;">
		<tr>
			<th>Sl.No</th><th>Date</th><th>Comment</th><th>
		</tr>
		<% for(FeedbackUserBean obj : arrFb){ id=obj.getId();%>
		<tr>
			<td><%=i %></td><td><%= obj.getDate()%></td><td><%= obj.getComment()%></td>
			<td><a href="feedupdate.jsp?id=<%=id%>&date=<%=obj.getDate()%>&comnt=<%=obj.getComment()%>">Edit</a></td>
			<td><a href="feeddelete.jsp?id=<%=id%>">Delete</a></td>
		</tr>
		<%
			i++;
			}
		%>
	</table>
	<%} else {%>
	<h1>----No Data---</h1>
	<% }%>