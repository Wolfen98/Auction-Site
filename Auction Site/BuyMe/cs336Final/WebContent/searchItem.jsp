<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%-- joy --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe - Search for Items</title>
</head>
<body>
	<%
	
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe","cs336", "lintakoon");
		Statement st = con.createStatement();
		String userInput = request.getParameter("search");
		userInput = "%"+userInput+"%";
		PreparedStatement pstmt = con.prepareStatement("select * from Item");
		ResultSet rs= pstmt.executeQuery();
	
	%>

	<form method="post" action="searchHandler.jsp">
		<p>
			Item Name: (e.g. iPhone) <input type="text" name="itemName"><br> 
			Item Color: (e.g. Silver) <input type="text" name="itemColor"><br> 
			Item Brand: (e.g. Apple) <input type="text" name="itemBrand"><br> 
			Storage Size (GB): (e.g. 64) <input type="text" name="itemStorage"> <input type="submit" value="Search">
		</p>
	</form>
	<% 
	con.close();
	st.close();
	rs.close();
	%>
	<a href='index.jsp'>Return Home</a>
	
</body>
</html>