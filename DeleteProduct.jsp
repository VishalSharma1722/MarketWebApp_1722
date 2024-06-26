<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete_Product</title>
<link rel="icon" href="photo.jpeg">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

String i= request.getParameter("id");


try {
	
	
	int id = Integer.parseInt(i);
	
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	String query = "delete from shop " + "where pid = " + id;
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.execute();
	 
       out.println("<script type='text/javascript'>");
       out.println("alert('Product Delete Successfully');");
       out.println("window.location.href = 'firstpage.html';");
       out.println("</script>");
	
} catch(Exception ae) {
	out.println(ae);
}



%>


</body>
</html>