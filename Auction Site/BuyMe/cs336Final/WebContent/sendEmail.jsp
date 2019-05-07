<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send Email</title>
</head>
<body>

<!-- BY. Anita Kotowska -->

	<%
	try{

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		String to_ = request.getParameter("to_");	
		String subject = request.getParameter("subject");	
		String content = request.getParameter("content");	
		
		//Get current date and time
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(dt);
		
		String sessionUsername = String.valueOf(session.getAttribute("user"));		
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Account WHERE username = ?");
		pstmt.setString(1, sessionUsername);
		ResultSet rs= pstmt.executeQuery();
		rs.next();
		String userEmail = (String)rs.getString(4);
		
		pstmt = con.prepareStatement("SELECT * FROM Account WHERE username = ?");
		pstmt.setString(1, sessionUsername);
		rs= pstmt.executeQuery();
		rs.next();
		String acctID = (String)rs.getString(1);
		
		
		String insert = "INSERT INTO Email(from_, to_, subject, content, date_time)"
				+ "VALUES (?, ?, ?, ?, ?)";

		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, userEmail);
		ps.setString(2, to_);
		ps.setString(3, subject);
		ps.setString(4, content);
		ps.setString(5, currentTime);
				
				ps.executeUpdate();
				
				rs.close();
				pstmt.close();
				stmt.close();
				con.close();
				response.sendRedirect("emailSent.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		%><br><%out.print("E-mail could not be sent. Please try again.");
		%><br><a href='emailPage.jsp'>Return to Emails</a><%
	}
%>
	
</body>
</html>