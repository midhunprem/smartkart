<%--
Document   :Change Password
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="UserHeader.jsp" %>
</head>
<body style="width:100%;background-image: url(images/changepass.jpg);background-size: cover;">

<div>
	<form name="changePassword" action="ChangeUserPasswordAction.jsp" method="post">
		<table style="margin-top: 200px;margin-left: 550px;width: 700px;">
			<tr>
				
				<td><input type="password" required="" name="currentpassword" style="margin-top: 20px;margin-left: 30px;width: 300px;height: 30px;border-radius: 22px;" placeholder="          Current Password"></td>
			</tr>
			<tr>
				
					<td><input type="password" required="" name="newpassword" style="margin-top: 20px;margin-left: 30px;width: 300px;height: 30px;border-radius: 22px;" placeholder="          New Password"></td>
			</tr>
			<tr>
				
				<td><input type="password" required="" name="confirmnewpassword" style="margin-top: 20px;margin-left: 30px;width: 300px;height: 30px;border-radius: 22px;" placeholder="          Confirm Password"></td>
			</tr>
			<tr>
				<td class="change">
					<input type="submit" value="Change" style="width: 150px;height: 35px;margin-top: 20px;margin-left: 100px;border-radius: 22px;">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>

</body>
</html>