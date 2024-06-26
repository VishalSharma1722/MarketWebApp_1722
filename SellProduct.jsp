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
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	
	Statement stmt = con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from shop where pid = '"+id+"'");
	
	int remain = 0;
    
    while(rs.next()) {
		if(rs.getInt("pqnt")<qn) {
			
			remain = remain+rs.getInt("pqnt");
			out.println("<script type='text/javascript'>");
	        out.println("alert('Product Quantity not Available Please Enter less Quantity !');");
	        out.println("window.location.href = 'sellProduct.html';");
	        out.println("</script>");
			
		} else {
			remain = rs.getInt("pqnt")-qn;
			
			String query = "update shop set pqnt="+"'"+remain+"'"+" where pid="+"'"+id+"'";
			PreparedStatement st = con.prepareStatement(query);
			st.execute();
			
			//System.out.println("\nProduct sell\n");
			//updateInvoice(id, qn);
			request.setAttribute("id", id);
	        request.setAttribute("qnt", qn);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("SellOption.jsp");
	        dispatcher.forward(request, response);
			
			
		}
	}
	
	
	
	
	 
    /*   
	out.println("<script type='text/javascript'>");
       out.println("alert('Product Delete Successfully');");
       out.println("window.location.href = 'firstpage.html';");
       out.println("</script>");
       */
	
} catch(Exception ae) {
	out.println(ae);
}



%>


</body>
</html>