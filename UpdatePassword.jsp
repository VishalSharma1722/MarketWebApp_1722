<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
String email = request.getParameter("email");
String newPassword = request.getParameter("pass1");
String reEnterPassword = request.getParameter("pass2");

if(newPassword.equals(reEnterPassword)) {
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");

        //String query = "update register set pass="+"'"+newPassword+"'"+" where email="+"'"+email+"'";
        //PreparedStatement stmt = con.prepareStatement();
        //int result =  stmt.executeUpdate(query);
        //stmt.execute();
        
        String query = "UPDATE register SET pass = ? WHERE email = ?";
		PreparedStatement stmt = con.prepareStatement(query);
		stmt.setString(1, newPassword);
		stmt.setString(2, email);
		int result = stmt.executeUpdate();

        if(result > 0){
            out.println("<script type='text/javascript'>");
            out.println("alert('Password Updated Successfully');");
            out.println("window.location.href = 'login.html';");
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Error updating password');");
            out.println("window.location.href = 'forgot2.html';");
            out.println("</script>");
        }
    }

    catch(Exception e){
        out.println(e);
    }
	} else {
	    out.println("<script type='text/javascript'>");
	    out.println("alert('Passwords do not match');");
	    out.println("window.location.href = 'forgot1.html");
	    out.println("</script>");
	}
%>

</body>
</html>