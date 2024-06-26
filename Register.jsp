<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register_page</title>
<link rel="icon" href="photo.jpeg">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

String n = request.getParameter("name");
String e = request.getParameter("email");
String p = request.getParameter("password");

try {
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	PreparedStatement stmt = con.prepareStatement("insert into register values(?,?,?)");
	stmt.setString(1, n);
	stmt.setString(2, e);
	stmt.setString(3, p);
	
	int res = stmt.executeUpdate();
	
	
	
	if(res > 0) {
        out.println("<script type='text/javascript'>");
        out.println("alert('Register Successfully');");
        out.println("window.location.href = 'login.html';");
        out.println("</script>");
    } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('Failed !');");
        out.println("window.location.href = 'register.html';");
        out.println("</script>");
    }
	
} catch(Exception ae) {
	out.println(ae);
}




%>


</body>
</html>