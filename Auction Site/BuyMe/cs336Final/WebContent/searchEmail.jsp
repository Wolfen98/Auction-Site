<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Question</title>
</head>
<body>

<!-- BY. Anita Kotowska -->

	<%
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe","cs336", "lintakoon");
		Statement st = con.createStatement();
		String userInput = request.getParameter("search");
		userInput = "%"+userInput+"%";
		
		String sessionUsername = String.valueOf(session.getAttribute("user"));		
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Account WHERE username = ?");
		pstmt.setString(1, sessionUsername);
		ResultSet rs= pstmt.executeQuery();
		rs.next();
		String userEmail = (String)rs.getString(4);
		
		pstmt = con.prepareStatement("select * from Email where to_ = ? AND (from_ like ? OR subject like ? OR content like ?)");
		pstmt.setString(1, userEmail);
		pstmt.setString(2, userInput);
		pstmt.setString(3, userInput);
		pstmt.setString(4, userInput); 
		rs= pstmt.executeQuery();
	
	%>
	<% if(!rs.next()){ %>
		<h1>No results found.</h1>
	<%} 
	else{
		rs.beforeFirst();%>
		<center><h1>Search Results:</h1></center> 	
	<table border="1">
	<tr>
		<th>From:</th>
		<th>Subject:</th>
		<th>Content:</th>
	</tr>
	<% while(rs.next()){ %>
	<tr>
		<td> <%= rs.getString(2) %>
		</td>
		
       	<td><% String subject= rs.getString(4);
       			if(subject!=null){
       			%>
       			<%= subject %>
       			<% } 
       			else{
       			%>
       			<%= "No Subject" %>
       			<%} %> 
       	</td>
       	
       	<td><% String content= rs.getString(5);
       			if(content!=null){
       			%>
       			<%= content %>
       			<% } 
       			else{
       			%>
       			<%= "No Content" %>
       			<%} %> 
       	</td>
    </tr>
	<% }
		rs.close();
		pstmt.close();
		st.close();
		con.close();%>
	
	</table>
	<% } %>
	<br>
	<a href='emailPage.jsp'>View All E-mails</a>
	<a href='index.jsp'>Return Home</a>
	
</body>
</html>