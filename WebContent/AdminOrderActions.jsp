<%--
Document   :AdminOrderActions
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@page import="com.mvc.smartkart.dao.EmailDAO"%>
<%@page import="com.mvc.smartkart.dao.RedeemHistoryDAO"%>
<%@page import="com.mvc.smartkart.beans.RedeemHistoryBean"%>
<%@page import="com.mvc.smartkart.dao.UserDAO"%>
<%@page import="com.mvc.smartkart.beans.UserBean"%>
<%@page import="com.mvc.smartkart.dao.OrderDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.mvc.smartkart.beans.OrderBean"%>
<%@page import="com.mvc.smartkart.dao.LoyaltyPointDAO"%>
<%@page import="com.mvc.smartkart.beans.LoyaltyPointBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
  <%
  	OrderBean ord=new OrderBean();
	UserBean usr=new UserBean();
	RedeemHistoryBean rdh=new RedeemHistoryBean();
	
	String userName=(String)session.getAttribute("userName");
	String password=(String)session.getAttribute("password");
	
	
  	String status=request.getParameter("status");
  	int id=Integer.parseInt(request.getParameter("id"));
  	Double price=Double.parseDouble(request.getParameter("price"));
  	int cusId=Integer.parseInt(request.getParameter("cusId"));
  	String itemName=OrderDAO.getItemNameForAdmin(id);
  	String userMailId=UserDAO.getCustomerMailIdByCusId(cusId);
  	String cusName=UserDAO.getCustomerNameByCusId(cusId);
  	
  	double lpAmount=0,ratePerPoint=0,payableInPercent=0;
  	Date date = new Date(System.currentTimeMillis());
  	//out.print(id+"  "+price+"   "+status);
  	
  	ArrayList<LoyaltyPointBean> lpLst=LoyaltyPointDAO.getLoyaltyPointForAdmin();
  	for(LoyaltyPointBean obj:lpLst){
  		lpAmount=obj.getRatePerPoint();
  		ratePerPoint=obj.getRatePerPoint();
  		payableInPercent=obj.getPayable();
  	}
  	usr.setId(cusId);
 
  	int availLp=UserDAO.getAvailableLoyaltyPoint(usr);
	double creditPoint=availLp;
	double lpApplyableAmount=(payableInPercent*price)/100;
  	if(status.equals("shipped")){
  		
  		creditPoint=Math.round(availLp+(lpApplyableAmount/lpAmount));
  		 out.print(payableInPercent+"  "+price+"  "+ratePerPoint+"  "+lpApplyableAmount+" "+creditPoint);
  	}
  	
  	String name=UserDAO.getCustomerNameById(cusId);
  	double point=(lpApplyableAmount/lpAmount);
  	
	rdh.setDate(date);
	rdh.setName(name);
	rdh.setPoint(point);
	rdh.setPointRate(ratePerPoint);
	
	
  	ord.setId(id);
  	ord.setStatus(status);
  	ord.setUpdateDate(date);
  	
  	usr.setAvailableLP(creditPoint);
  	usr.setLastRedeemDate(date);
  	//	out.print(creditPoint+"  "+price+"   "+lpAmount+"  "+ cusId);
  	
  	boolean flag=OrderDAO.updateOrderStatus(ord);
  	if(flag){
  		boolean result=UserDAO.updateUserLoyaltyPoint(usr);
  		if(result){
  			boolean value=RedeemHistoryDAO.insertRedeemHistory(rdh);
  			EmailDAO.send("smartkartpvtltd@gmail.com","smartkart123", userMailId, "Shipment Alert", "Hi "+cusName+" Your Ordered item "+itemName+" has Shipped on "+date);
  			response.sendRedirect("viewOrders.jsp");
  		}
  		else{
  			response.sendRedirect("error.jsp?Error Occured in Updating the details");
  		}
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