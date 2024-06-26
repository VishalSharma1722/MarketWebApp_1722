<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add_Product</title>
<link rel="icon" href="photo.jpeg">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
 
String i= request.getParameter("id");
String n= request.getParameter("name");
String p= request.getParameter("price");
String q= request.getParameter("quantity");

try {
	
	
	int id = Integer.parseInt(i);
	int pr = Integer.parseInt(p);
	int qn = Integer.parseInt(q);
	
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	PreparedStatement stmt = con.prepareStatement("insert into shop values(?,?,?,?)");
	stmt.setInt(1, id);
	stmt.setString(2, n);
	stmt.setInt(3, pr);
	stmt.setInt(4, qn);
	
	int res = stmt.executeUpdate();
	
	
	
	if(res > 0) {
        out.println("<script type='text/javascript'>");
        out.println("alert('Product Added Successfully');");
        out.println("window.location.href = 'firstpage.html';");
        out.println("</script>");
    } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('Product could not be added');");
        out.println("window.location.href = 'firstpage.html';");
        out.println("</script>");
    }
	
} catch(Exception ae) {
	out.println(ae);
}


%>


</body>
</html>