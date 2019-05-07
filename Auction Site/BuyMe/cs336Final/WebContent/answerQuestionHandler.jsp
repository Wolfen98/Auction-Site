<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answer Question Handler</title>
</head>
<body>
<%
	String quesID = null;
	String answer = null;
	Connection con = null;
	Statement stmt = null;
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		con = db.getConnection();

		//Create a SQL statement
		stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String newQuesID = request.getParameter("iD");
		String newAnswer= request.getParameter("answer");
		

		if (!(newQuesID.trim()).isEmpty() && !(newAnswer.trim()).isEmpty()) 
		{ //all of them (except gender) cannot be empty
		
			//Make an updatestatement for the User table:
			String update = "UPDATE CustomerService " 
					+ "SET answer=?"
					+ "WHERE questionID=?";;
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);

			//Add parameters of the query. Start with 1, the 0-parameter is the UPDATE statement itself
			ps.setString(1, newAnswer.trim());
			ps.setString(2, newQuesID.trim());
			//Run the query against the DB
			ps.executeUpdate();
			
			
			//Run the query against the DB
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			ps.close();
			stmt.close();
			out.print("Question answered");
			response.sendRedirect("answerQuestions.jsp");
		}
		else {
			con.close();
			stmt.close();
			out.print("Answer cannot be done. Maybe mismatch in ID and answers, maybe null pointer");
			response.sendRedirect("asnwerQuestions.jsp");
		}
		
	} catch (Exception ex) {
		out.print(ex);
		con.close();
		stmt.close();
		out.print("Answer cannot be done");
		response.sendRedirect("answerQuestions.jsp");
	}
%>
</body>
</html>