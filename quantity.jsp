<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update_Quantity</title>
<link rel="icon" href="photo.jpeg">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

String i= request.getParameter("id");
String q= request.getParameter("qnt");

try {
	
	
	int id = Integer.parseInt(i);
	int qn = Integer.parseInt(q);
	
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	String query = "update shop set pqnt="+"'"+qn+"'"+" where pid="+"'"+id+"'";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.execute();
	 
       out.println("<script type='text/javascript'>");
       out.println("alert('Product Quantity Update Successfully');");
       out.println("window.location.href = 'firstpage.html';");
       out.println("</script>");
	
} catch(Exception ae) {
	out.println(ae);
}



%>


</body>
</html>