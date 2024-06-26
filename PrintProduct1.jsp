<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Print_Product_List</title>
<link rel="icon" href="photo.jpeg">
</head>
<style>
	/*
	body {
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
	    margin: 0;
	}
	table{
		border-collapse: collapse;
	}
    table th, td {
        border: 2px solid black;
    }
    */
    body {
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
	    margin: 0;
        background-color: antiquewhite;
	}
    p{
        font-size: 30px;
        font-family: Arial, sans-serif;
        margin: 5px;

    }
	table{
        background-color: white;
        width: 50%;
        box-shadow: 2px 2px 2px 2px black;
        border-radius: 5px;
		border-collapse: collapse;
	}
    table th, td {
        padding: 10px;
        text-align: center;

        border: 2px solid black;
    }
    a{
        text-decoration: none;
        color: black;
        font-size: 20px;
        font-family: Arial, sans-serif;
        margin: 10px;
        background-color: black;
        color: white;
        transition: transform 0.5s;
        border-radius: 2px;
        padding: 5px 100px;
    }
    a:hover{
        transform: scale(1.1);
        background-color: blue;
        color: white;
    }
</style>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	Statement stmt = conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from shop");
	if(rs != null) {
		out.println("<html>");
		
		out.println("<body");
		out.println("<br>");
		out.println("<p>=======Product_List=======</p>");
		out.println("<table> ");
		out.println("<tr><th>PID</th><th>NAME</th><th>PRICE</th><th>Quantity</th></tr>"+"<br>");
		//out.println("\nPID\tNAME\tPRICE\tQUANTITY"+"<br>");
		
		while(rs.next()) {
			out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td><td>"+rs.getInt(4)+"</td></tr>");
			//out.println(rs.getInt(1)+"\t"+rs.getString(2)+"\t"+rs.getInt(3)+"\t"+rs.getInt(4)+"<br>");
			
		}
		
		out.println("</table></body></html>");
		out.println("<a href=firstpage.html>Click Here For Continues Process</a>");
	} else {
		out.println("Connection Failed");
	}
	
} catch(Exception e) {
	out.println(e);
}


%>

</body>
</html>