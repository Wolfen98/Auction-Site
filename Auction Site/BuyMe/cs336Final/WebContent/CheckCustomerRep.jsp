<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding Customer Representative</title>
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
			String newEmail = request.getParameter("email");
			String newUsername = request.getParameter("username");
			String newPassword = request.getParameter("password");

			boolean check = false;
			if (!(newEmail.trim()).isEmpty() && !(newUsername.trim()).isEmpty()
					&& !(newPassword.trim()).isEmpty()) { //all of them (except gender) cannot be empty

				//Make an insert statement for the User table:
				String insert = "INSERT INTO CustomerRep(username, password, emailAddr)" + "VALUES (?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newUsername.trim());
				ps.setString(2, newPassword.trim());
				ps.setString(3, newEmail.trim());
				//Run the query against the DB
				ps.executeUpdate();

				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				check = true;
				if (check = true) {
					stmt.close();
				    ps.close();
					con.close();
					response.sendRedirect("creationSuccess.jsp");
					return;
				} else {
					stmt.close();
				    ps.close();
					con.close();
					response.sendRedirect("creationError.jsp");
					return;
				}
			} else {
				stmt.close();
				con.close();
				out.print("CR Creation failed: No empty inputs are allowed");
				response.sendRedirect("creationError.jsp");
				return;
			}

		} catch (Exception ex) {
			out.print("CR Creation failed");
			out.print(ex);
			response.sendRedirect("creationError.jsp");

		}
	%>
</body>
</html>