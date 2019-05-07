<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions and Answers</title>
</head>
<body>
<!-- BY. Anita Kotowska -->
<center><h1>Questions and Answers</h1></center>

	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("Login.jsp");
	}
	
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe","cs336", "lintakoon");
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from CustomerService");
	
	%>

	<form method="post" action="insertQuestion.jsp">
	<h4>Ask a New Question: <input type="text" name="question">
	<input type="submit" value="Ask"></h4>
	</form>
	
	<form method="post" action="searchQuestion.jsp">
	<h4>Search a Question: <input type="text" name="search">
	<input type="submit" value="Search"></h4>
	</form>
	
	<br>
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
	<br>
	<a href='index.jsp'>Return Home</a>

</body>
</html>