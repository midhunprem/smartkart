<%--
Document   :Order Confirm Action
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.EmailDAO"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="com.mvc.smartkart.dao.OrderDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.mvc.smartkart.beans.OrderBean"%>
<%@page import="com.mvc.smartkart.dao.LoyaltyPointDAO"%>
<%@page import="com.mvc.smartkart.beans.LoyaltyPointBean"%>
<%@page import="com.mvc.smartkart.beans.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ include file="UserHeader.jsp" %> 
    <html>
    <head>
    	<script type="text/javascript">
    		function dos(){
    			document.getElementById("btn").style.display="none";
    			window.location="CusetomerOrder.jsp";
    		}
    	</script>
    </head>
    <body style="width:100%;background-image: url(images/passion.jpg);background-size: cover;">
    
  
    
    
<%
	

	int itmId=Integer.parseInt(request.getParameter("itmId"));	
	int quantity=Integer.parseInt(request.getParameter("qty"));
	double price=Double.parseDouble(request.getParameter("itm"));
	double ratePerPoint=0,expiryDays=0,availLP=0,rewardGiving=0,netPayable=0;
	String val=request.getParameter("lp");
	String userName=(String)session.getAttribute("userName");
	String password=(String)session.getAttribute("password");
	String userMailId=UserDAO.getCustomerMailId(userName, password);
out.print(userMailId);
	UserBean usr=new UserBean();
	usr.setUserName(userName);
	usr.setPassword(password);
	int cusId=UserDAO.getUserId(usr);
	usr.setId(cusId);
	
	double BalanceLp=0,redeemedAmount=0;
	availLP=UserDAO.getAvailableLoyaltyPoint(usr);

	
	ArrayList<LoyaltyPointBean> lst=LoyaltyPointDAO.getLoyaltyPointForUser();
	for(LoyaltyPointBean lp : lst){
		ratePerPoint=lp.getRatePerPoint();
		expiryDays=lp.getExpiryDays();
		
	}
	
	Date date = new Date(System.currentTimeMillis());
	double pointCorresToPrice=price/ratePerPoint;
	OrderBean order=new OrderBean();
	long days=0;
	Date updateDate=UserDAO.getUpdatedRedeemDate(usr);
	if(updateDate!=null){
		long diff = date.getTime() - updateDate.getTime();
	    days=TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		
	}
	out.print(date+"  "+updateDate+"  "+days);
	if(val.equals("true")){
		if(days <= expiryDays){
			if(availLP>0){
				if(availLP > pointCorresToPrice){
					BalanceLp=availLP-pointCorresToPrice;
					netPayable=0;
				}
				if(availLP < pointCorresToPrice){
					BalanceLp=0;
					netPayable=price-(availLP*ratePerPoint);
				}
				
			}
			else{
				netPayable=price;
				BalanceLp=0;
			}
			
			redeemedAmount=(availLP-BalanceLp)*ratePerPoint;
			order.setOrderDate(date);
			order.setItemId(itmId);
			order.setCustomerId(cusId);
			order.setQuantity(quantity);
			order.setPrice(price);
			order.setStatus("ordered");
			order.setUpdateDate(date);
			order.setAvailLp(BalanceLp);
			order.setRedeemedAmount(redeemedAmount);
			
			boolean flag=OrderDAO.insertOrderDetails(order);
			if(flag){
				out.print("Inserted Succesfullt");
				EmailDAO.send("smartkartpvtltd@gmail.com","smartkart123", userMailId, "Order Confirm", "Hi "+userName+" Your Order Placed Succesfully");
				response.sendRedirect("CusetomerOrder.jsp");
			}
			else{
				out.print("Error occured");
			}
		}
		else{
			%>
			
			<div id="po" style="width: 600px;height: 250px;background-color: #0000006b;margin-left: 450px;margin-top: 200px;border-radius: 71px;padding-top: 37px;">
				<h1 style="margin-left: 200px;">Sorry.....</h1>
				<h2 style="margin-left: 40px;">Validity of Your Loyalty Point hasbeen Expired...</h2>
				<input type="submit" id="btn" value="ok" onclick="dos()" style="width: 100px;height: 30px;margin-left: 210px;margin-top: 20px;border-radius: 18px;">
			</div>
			
			<%
			BalanceLp=0;
			
			order.setOrderDate(date);
			order.setItemId(itmId);
			order.setCustomerId(cusId);
			order.setQuantity(quantity);
			order.setPrice(price);
			order.setStatus("ordered");
			order.setUpdateDate(date);
			order.setAvailLp(BalanceLp);
			
			boolean flag=OrderDAO.insertOrderDetails(order);
			if(flag){
				EmailDAO.send("smartkartpvtltd@gmail.com","smartkart123", userMailId, "Order Confirm", "Hi "+userName+" Your Order Placed Succesfully");
				//response.sendRedirect("CusetomerOrder.jsp");
			}
			else{
				 
			}
		}
		
		
	}
	else {
		
		BalanceLp=availLP;
		
		order.setOrderDate(date);
		order.setItemId(itmId);
		order.setCustomerId(cusId);
		order.setQuantity(quantity);
		order.setPrice(price);
		order.setStatus("ordered");
		order.setUpdateDate(date);
		order.setAvailLp(BalanceLp);
		
		boolean flag=OrderDAO.insertOrderDetails(order);
		if(flag){
			out.print("Inserted Succesfullt");
			EmailDAO.send("smartkartpvtltd@gmail.com","smartkart123", userMailId, "Order Confirm", "Hi "+userName+" Your Order Placed Succesfully");
			response.sendRedirect("CusetomerOrder.jsp");
		}
		else{
			 
		}
		
	}
		
%>    
  </body>
    </html>