<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert New Question</title>
</head>
<body>
<!-- BY. Anita Kotowska -->
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		String userQuestion = request.getParameter("question");	

		
		String insert = "INSERT INTO CustomerService(question, answer)"
				+ "VALUES (?, ?)";

		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, userQuestion);
		ps.setString(2, null);
				
				ps.executeUpdate();
				
				con.close();
				ps.close();
				stmt.close();
				response.sendRedirect("qAndA.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>

</body>
</html>