<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User To DB</title>
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
		String newEmail = request.getParameter("email");
		String newGender = request.getParameter("gender");
		String newBirthday = request.getParameter("birthday");
		String newUsername = request.getParameter("username");
		String newPassword = request.getParameter("password");
		

		if (!(newFirstName.trim()).isEmpty() && !(newLastName.trim()).isEmpty() && !(newEmail.trim()).isEmpty() && !(newBirthday.trim()).isEmpty() && !(newUsername.trim()).isEmpty() && !(newPassword.trim()).isEmpty()) 
		{ //all of them (except gender) cannot be empty
		
			//Make an insert statement for the User table:
			String insert = "INSERT INTO User(emailAddr, userFirstName, userLastName, userGender, userBday)"
					+ "VALUES (?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newEmail.trim());
			ps.setString(2, newFirstName.trim());
			ps.setString(3, newLastName.trim());
			ps.setString(4, newGender.trim());
			ps.setString(5, newBirthday.trim());
			
			//Run the query against the DB
			ps.executeUpdate();
			
			insert = "INSERT INTO Account(username, password, emailAddr)" + "VALUES (?, ?, ?)";
			ps = con.prepareStatement(insert);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself		
			ps.setString(1, newUsername.trim());
			ps.setString(2, newPassword.trim());
			ps.setString(3, newEmail.trim());
			ps.executeUpdate();
			
			
			//Run the query against the DB
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			ps.close();
			stmt.close();
			response.sendRedirect("success.jsp");
		}
		else {
			stmt.close();
			con.close();
			out.print("Insert failed: No empty inputs are allowed");
			response.sendRedirect("error.jsp");
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed");
		response.sendRedirect("error.jsp");
	}
%>

</body>
</html>
