<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Page</title>
<link rel="icon" href="photo.jpeg">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

String e = request.getParameter("email");

try{
	boolean result = false;
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from register where email='" + e + "'");

    while(rs.next()){
        String em = rs.getString("email"); 

        if(e.equals(em)){
            result = true;
        }
    }

    if(result == true){
        response.sendRedirect("forgot2.html?email=" + e);
    } else{
        out.println("<script type='text/javascript'>");
        out.println("alert('Invalid Email');");
        out.println("window.location.href = 'forgot1.html';");
        out.println("</script>");
    }
} catch(Exception ae){
	out.println(ae);
}
%>
</body>
</html>