<%--
Document   :Upload Image
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
    
    <%@ include file="AdminHeader.jsp" %>
    
    <%
    	/*String code=request.getParameter("code");
    	String text=request.getParameter("text");

    	String name=request.getParameter("name");
    	double price=Double.parseDouble(request.getParameter("price"));
    	
    	session.setAttribute("itm_code", code);
    	session.setAttribute("itm_text", text);
    	session.setAttribute("itm_name", name);
    	session.setAttribute("itm_price",price);*/
    	
    	File file ;
    	int maxFileSize = 5000 * 1024;
    	int maxMemSize = 5000 * 1024;
    	String filePath = "D:/MyEclipseProjects/SmartKart/WebContent/item_images/";
    	String fileName="";
    	
    	
    	String contentType = request.getContentType();

    	if ((contentType.indexOf("multipart/form-data") >= 0)) {
    		
    		  DiskFileItemFactory factory = new DiskFileItemFactory();
    	      factory.setSizeThreshold(maxMemSize);
    	      factory.setRepository(new File("c:\\temp"));
    	      ServletFileUpload upload = new ServletFileUpload(factory);
    	      upload.setSizeMax( maxFileSize );
    	      
    	      try{
    	    	  List fileItems = upload.parseRequest(request);
    	    	  Iterator i = fileItems.iterator();
    	    	  
    	    	  while ( i.hasNext () ) 
    	          {
    	             FileItem fi = (FileItem)i.next();
    	             if ( !fi.isFormField () )  {
    	                 String fieldName = fi.getFieldName();
    	                 fileName = fi.getName();
    	                 boolean isInMemory = fi.isInMemory();
    	                 long sizeInBytes = fi.getSize();
    	                 file = new File( filePath + fileName) ;
    	                 fi.write( file ) ;
    	                 out.println("Uploaded Filename: " + filePath + fileName + "<br>");
    	             }
    	          }
    	      }
    	      catch(Exception e){
    	    	  
    	      }
    	}
    	else{
    		out.print("no file Uploaded");
    	}
      session.setAttribute("fileName",fileName);
      response.sendRedirect("additems.jsp");
    		
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