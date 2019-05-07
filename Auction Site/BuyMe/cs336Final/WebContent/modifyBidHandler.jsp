<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Bid</title>
</head>
<body>

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String newSC = request.getParameter("secretUpperLimit");
		String newAlertMsg= request.getParameter("alert");
		

		if (!(newSC.trim()).isEmpty() && !(newAlertMsg.trim()).isEmpty()) 
		{ //all of them (except gender) cannot be empty
		
			//Make an updatestatement for the User table:
			String update = "UPDATE Bid " 
					+ "SET secretUpperLimit=?, alertMsg=?"
					+ "WHERE bidNumber=?";;
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newSC.trim());
			ps.setString(2, newAlertMsg.trim());
			//Run the query against the DB
			ps.executeUpdate();
			
			
			//Run the query against the DB
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			stmt.close();
			ps.close();
			con.close();
			out.print("Update succeeded");
			response.sendRedirect("AucControl.jsp");
		}
		else {
			con.close();
			stmt.close();
			out.print("Update failed: No empty inputs are allowed");
			response.sendRedirect("AucControl.jsp");
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Update failed");
		response.sendRedirect("error.jsp");
	}
%>

</body>
</html>