<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invoice_Generate</title>
<link rel="icon" href="photo.jpeg">
<style>
    body{
        margin: 0 auto;
        padding: 0;
        display: flex;
        flex-direction: column;
        
        align-items: center;
        height: 100vh;
        background-color: #f1f1f1;
        }
        p{
            font-size: 30px;
            font-weight: bold;
        }
        a{
            text-decoration: none;
            background-color: #007bff;
            color: white;
            font-size: 20px;
            font-weight: bold;
            border-radius: 2px;
            padding: 5px 20px;
        }
        a:hover{
            transition: 0.5s;
            transform: scale(1.1);
        }
         pre{
            line-height: 0.7; 
            margin: 0;    
            padding: 0;
            font-size: 15px;
            
        }
		
</style>

</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

try {
	ResultSet rs=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/testdatabase","root","Vishal@1722");
	out.println("<html>");
	
	out.println("<body bgcolor=CYAN>");
	out.println("<br>");
	out.println("<p>=======Invoice=======</p>");
	out.println("<pre>");
	Statement stmt = conn.createStatement();
	rs =stmt.executeQuery("select * from bill");
	if(rs != null) {
		
		
		
		while(rs.next()) {
			
			out.println("Product Name        : "+rs.getString("pname")+"<br>");
        	out.println("Product Price       : "+rs.getInt("pprice")+"<br>");
        	out.println("Product qnt         : "+rs.getInt("pqnt")+"<br><br>");
			
		}
		String query = "delete from bill";
		PreparedStatement st = conn.prepareStatement(query);
	    st.execute();
		
		
	} else {
		out.println("Connection Failed");
	}
	rs.close();
	
	int grandtotal=0;
    rs = stmt.executeQuery("select * from total");
    while(rs.next()) {
    	grandtotal = grandtotal + rs.getInt("tot");
    }
    out.println("<br><br>Total Amount to Pay : "+grandtotal+"<br><br>");
    
    String query1 = "delete from total";
    PreparedStatement st = conn.prepareStatement(query1);
    st.execute();
    
    out.println("</pre>");
	
    out.println("<a href=firstpage.html>Click Here For Continues Process</a>");
    
	out.println("</body></html>");
	
	rs.close();
	
	
} catch(Exception e) {
	out.println(e);
}


%>


</body>
</html>