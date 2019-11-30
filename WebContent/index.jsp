<%--
Document   :Home Page
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ include file="HomeHeader.jsp" %>  
    <%
    	String res=request.getParameter("res");
    	String msg=request.getParameter("msg");
    	if(msg==null || msg== ""){
    		msg="";
    	}
    	else{
    		msg="Invalid Credentials";
    	}
    %>
    

<body style="width:100%;background-image: url(images/addtocart.jpg);background-size: cover;">

    <div id="content">
        <div class="login-page">
           <div class="form">
             <form id="sgForm" class="register-form" name="signIn" action="signinAction.jsp" method="post">
                <input type="text" name="name" placeholder="name"/>
                <input type="text" name="email" placeholder="email address"/>
                <input type="text" name="number" placeholder="Mobile Number"/>
                <input type="text" name="uname" placeholder="User name"/>
                <input type="password" name="pass" placeholder="Password"/>
                <button>create</button>
                <p class="message">Already registered? <a href="index.jsp">Sign In</a></p>
            </form>
            <form class="login-form" id="lgForm" name="login" action="loginAction.jsp" method="post">
              <input type="text" name="uname" placeholder="User name"/>
              <input type="password" name="pass" placeholder="Password"/>
              <button>login</button>
              <p class="message">Not registered? <a href="javascript:myFunction()" id="signup">Create an account</a></p>
            </form>
            <a href="ForgotPassword.jsp">Forgot Password ?</a><br>
            <label style="color: red;font-size: medium;"><%=msg %></label>
        </div>
      </div>
    </div>

</body>
</html>
