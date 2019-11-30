<%--
Document   :AddItems 
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
  

<%@ include file="AdminHeader.jsp" %>


<body style="width:100%;background-image: url(images/admins.jpg);background-size: cover;">
<div style="background: transparent;">
	<form action="UploadImage.jsp" method="post" enctype="multipart/form-data">
		<table class="tablestyle" style="margin-top: 130px;margin-left: 550px;width: 700px;">
			<tr>
			<td><p class="tdPara">Upload Image</p></td>
			<td><input type="file" name="file" size="50" /></td>
			<td colspan="2" align="left"><input type="submit" value="Upload" class="cnfBtn"></td>
		</tr>
		
		</table>
	</form>
<form action="additemAction.jsp" method="post" style="margin-top: -200px">
		<table class="tablestyle" style="margin-top: 130px;margin-left: 550px;">
		
		<tr>
			<td><p class="tdPara">Item Code:</p></td>
			<td><input type="text" name="code" class="tdText"></td>
		</tr>
		<tr>
			<td><p class="tdPara">Item Category:</p></td>
			
			<td>
				<select class="tdText" name="text">
					<option value="Electronics">Electronics</option>
					<option value="Stationary">Stationary</option>
					<option value="Furniture">Furniture</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><p class="tdPara">Item name:</p></td>
			<td><input type="text" name="name" class="tdText"></td>
		</tr>
		<tr>
			<td><p class="tdPara">Item Price:</p></td>
			<td><input type="text" name="price" class="tdText"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="submit" class="cnfBtn"></td>
		</tr>
	</table>
	</form>
</div>
	
</body>
</html>