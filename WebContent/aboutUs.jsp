<%--
Document   :AboutUs
Created on :November 20,2019
Author     :SmartKart
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="HomeHeader.jsp" %>
<html>

<style>
.mySlides {
display:none;
}

.page-404 {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  height: 100vh;
}

.page-404 h1 {
  font-size: 200px;
}
{
  box-sizing: border-box;
}

body {
  font-family: Arial;
  font-size: 17px;
}

.container {
  position: relative;
  max-width: 800px;
  margin: 0 auto;
}

.container img {vertical-align: middle;}

.myslides {
  position: absolute;
  bottom: 0;
  background: rgb(0, 0, 0); /* Fallback color */
  background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: #f1f1f1;
  width: 100%;
  padding: 20px;
}
.buttonright{
margin-top: -331px;
    margin-left: 1468px
}
.buttonleft{
margin-top: -331px;
   
}

</style>
<body>

<div >

	<table>
		<tr>
			<td><img alt="" src="model2.jpeg" width="500px" height="500px"></td>
			<td></td>
		</tr>
		<tr>
			<td><img alt="" src="model4.jpg" width="500px" height="500px"></td>
			<td></td>
		</tr>
	</table>
</div>
<div >


<img class="mySlides" src="images/img1.jpg" width="1500px" height="600px"  >
<img class="mySlides" src="images/img2.jpg" width="1500px" height="600px">
<img class="mySlides" src="images/img3.jpg" width="1500px" height="600px">
  
 
 <button class=" buttonleft" onclick="plusDivs(-1)">&#10094;</button>
  <button class=" buttonright" onclick="plusDivs(1)">&#10095;</button>
</div>


<section class="buy-pro" style="padding: 100px;">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="pro-block text-center" style="padding: 20px 50px; background: white; box-shadow: 0px 2px 28px 0px #7777775e; border-radius: 5px;">
					<h2 style="font-size: 35px; line-height: 1; text-align:center;">GET TO KNOW SMARTKART</h2>
					
					
					<p>SmartKart is a young and vibrant company that aims to provide good quality branded products.SmartKart is a one stop shop that  all your lifestyle needs which caters to the fashion needs of men,women and kids across the footwear,apparel,jwellery and accessories.
					At SmartKart we strive to achieve the highest level of "Customer Satisfaction" possible.Our website's vision is to create most reliable and frictionless commerce ecosystem that creates life-changing experience for customers and sellers.
					
					
					We are known for delivering what we promise and are very popular in the fashion space be it for men and women.Buying from these websites becomes even cheaper when pay online and with a certain debit card and since all of these websites are trustworthy, there is no issue paying beforehand as well. 
					Also, another amazing thing about all these websites is that if something doesn’t fit you or you don’t want to use it anymore or the product is defective or something like that, you can return the product and you get your money back within a period of time. 
					That is why a lot of people prefer online shopping over actual shopping.
					
					</p>
					
							
				</div>
			</div>
		</div>
	</div>
</section>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</html>
<%@ include file="HomeFooter.jsp" %>