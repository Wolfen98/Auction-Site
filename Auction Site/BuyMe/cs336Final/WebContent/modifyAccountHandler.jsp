<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update User</title>
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
		String newFirstName = request.getParameter("firstName");
		String newLastName = request.getParameter("lastName");
		String newEarnings = request.getParameter("email");
		String newGender = request.getParameter("gender");
		String newBirthday = request.getParameter("birthday");
		//String newUsername = request.getParameter("username"); //foreign key error
		String newPassword = request.getParameter("password");
		

		if (!(newFirstName.trim()).isEmpty() && !(newLastName.trim()).isEmpty() && !(newEarnings.trim()).isEmpty() && !(newBirthday.trim()).isEmpty() && !(newPassword.trim()).isEmpty()) 
		{ //all of them (except gender) cannot be empty
		
			//Make an updatestatement for the User table:
			String update = "UPDATE User " 
					+ "SET userFirstName=?, userLastName=?, userGender=?, userBday=?, earnings=?"
					+ "WHERE emailAddr=?";;
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newFirstName.trim());
			ps.setString(2, newLastName.trim());
			ps.setString(3, newGender.trim());
			ps.setString(4, newBirthday.trim());
			ps.setString(5, newEarnings.trim());
			
			//Run the query against the DB
			ps.executeUpdate();
			
			update = "UPDATE Account "+ "SET password=?" +"WHERE accountID=?";;
			ps = con.prepareStatement(update);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself		
			ps.setString(1, newPassword.trim());
			ps.executeUpdate();
			
			
			//Run the query against the DB
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			ps.close();
			stmt.close();
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
		out.println(ex);
		out.println("Update failed");
		response.sendRedirect("error.jsp");
	}
%>

</body>
</html>