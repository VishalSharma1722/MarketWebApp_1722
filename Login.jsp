<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login_Page</title>
<link rel="icon" href="photo.jpeg">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<%

String user = request.getParameter("username");
String pass = request.getParameter("password");
boolean valid=false;

try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	Statement stmt = con.createStatement();
	
	ResultSet rs = stmt.executeQuery("select * from register where email='"+user+"'");
	
	while(rs.next()) {
		String e = rs.getString(2);
		String p = rs.getString(3);
		
		if(e.equals(user) && p.equals(pass)) {
			
			valid = true;
			
			
		}
		
	}
	
	
	
} catch(Exception ae) {
	out.println(ae);
}

if(valid == true){
	
	out.println("<script type='text/javascript'>");
    out.println("alert('Welcome to Market');");
    out.println("window.location.href = 'firstpage.html';");
    out.println("</script>");
	
}

else{
	
	out.println("<script type='text/javascript'>");
    out.println("alert('Invalid username or password');");
    out.println("window.location.href = 'login.html';");
    out.println("</script>");
	
}
	


%>



</body>
</html>