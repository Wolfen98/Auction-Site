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
		PreparedStatement pstmt = con.prepareStatement("select * from CustomerService where question like ?");
		pstmt.setString(1, userInput);
		ResultSet rs= pstmt.executeQuery();
	
	%>
	<% if(!rs.next()){ %>
		<h1>No results found.</h1>
	<%} 
	else{
		rs.beforeFirst();%>
		<center><h1>Search Results:</h1></center> 	
	<table border="1">
	<tr>
		<th>Questions:</th>
		<th>Answers:</th>
	</tr>
	<% while(rs.next()){ %>
	<tr>
		<td> <%= rs.getString(2) %></td>
       	<td><% String answer= rs.getString(3);
       			if(answer!=null){
       			%>
       			<%= answer %>
       			<% } 
       			else{
       			%>
       			<%= "no answer" %>
       			<%} %>
    </tr>
	<% } %>
	</table>
	<% }
	con.close();
	st.close();
	pstmt.close();
	rs.close();%>
	<br>
	<a href='qAndA.jsp'>View All Questions</a>
	<a href='index.jsp'>Return Home</a>
	
</body>
</html>