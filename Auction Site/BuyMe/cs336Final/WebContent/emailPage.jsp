<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Email</title>
</head>
<body>
<!-- BY. Anita Kotowska -->
<center><h1>E-mail</h1></center>

	<%
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe","cs336", "lintakoon");
		Statement st = con.createStatement();
		
		String sessionUsername = String.valueOf(session.getAttribute("user"));		
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Account WHERE username = ?");
		pstmt.setString(1, sessionUsername);
		ResultSet rs= pstmt.executeQuery();
		rs.next();
		String userEmail = (String)rs.getString(4);
		
		PreparedStatement p2 = con.prepareStatement("select * from Email where to_ = ?");
		p2.setString(1, userEmail);
		ResultSet rs2= p2.executeQuery();
		
	%>
	<h2>Compose an E-mail: </h2>
	<form method="post" action="sendEmail.jsp">
	<h4>To: <input type="text" name="to_"> <br>
	Subject: <input type="text" name="subject"><br>
	Message: <input type="text" name="content">
	<input type="submit" value="Send"></h4>
	</form>
	
	
	<form method="post" action="searchEmail.jsp">
	<h4>Search E-mail: <input type="text" name="search">
	<input type="submit" value="Search"></h4>
	</form>
	<br>
	<h2>Your E-mails: </h2>
	<table border="1">
	<tr>
		<th>From:</th>
		<th>Subject:</th>
		<th>Content:</th>
	</tr>
	<% while(rs2.next()){ %>
	<tr>
		<td> <%=rs2.getString(2) %>
		
		</td>
		
       	<td><% String subject= rs2.getString(4);
       			if(subject!=null){
       			%>
       			<%=subject %>
       			<% } 
       			else{
       			%>
       			<%= "No Subject" %>
       			<%} %> 
       	</td>
       	
       	<td><% String content= rs2.getString(5);
       			if(content!=null){
       			%>
       			<%=content %>
       			<% } 
       			else{
       			%>
       			<%= "No Content" %>
       			<%} %> 
       	</td>
    </tr>
	<% }
	rs.close();
	st.close();
	con.close();
	p2.close();
	rs2.close();
	%>
	</table>
	<br>
	
	<a href='index.jsp'>Return Home</a>

</body>
</html>