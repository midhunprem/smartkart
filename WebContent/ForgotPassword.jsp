<%--
Document   :Forgot Password
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ include file="HomeHeader.jsp" %>

    <div id="content">
        <div class="forgotpassword-page">
           <div class="form">
             
            <form class="forgotpassword-form" id="lgForm" name="forgotpassword" action="ForgotPasswordAction.jsp" method="post">
              <input type="text" name="uname" placeholder="User name"/><br>
             
             <input type="text" name="email" placeholder="email address"/><br>
              <button>Submit</button>
              
              
           </form>
           
        </div>
      </div>
    </div>

</body>
</html>