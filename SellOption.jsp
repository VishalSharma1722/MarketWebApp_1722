<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell_Product</title>
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
	String name="a";
	int price=0, total=0;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	Statement stmt = con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from shop where pid = '"+id+"'");
	
	int remain = 0;
    
    while(rs.next()) {
    	name = rs.getString("pname");
    	price = rs.getInt("pprice");
    	
    	total = qn * rs.getInt("pprice");
		}
	
	
    String query = "insert into bill(pid,pname,pprice,pqnt) values('"+id+"', '"+name+"', '"+price+"', '"+qn+"')";
    PreparedStatement st1 = con.prepareStatement(query);
    st1.execute();
    
    
    String query1 = "insert into total(pid,tot) values('"+id+"','"+total+"')";
    PreparedStatement st2 = con.prepareStatement(query1);
    st2.execute();
	
	 
     
	out.println("<script type='text/javascript'>");
    out.println("alert('Product Sell Successfully');");
    out.println("window.location.href = 'sellOption.html';");
    out.println("</script>");
       
	
} catch(Exception ae) {
	out.println(ae);
}



%>


</body>
</html>