<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set Item Alert</title>
</head>
<body>

<!-- BY. Anita Kotowska -->

	<%
	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
//get these from set item alrert button page
		String itemName = request.getParameter("itemName");	
		String itemType = request.getParameter("itemType");	
		String itemColor = request.getParameter("itemColor");	
		String itemBrand = request.getParameter("itemBrand");	
		String itemStorage = request.getParameter("itemStorage");	
		
		
		if (!(itemName.trim()).isEmpty() && !(itemType.trim()).isEmpty() && !(itemColor.trim()).isEmpty() && !(itemBrand.trim()).isEmpty() && !(itemStorage.trim()).isEmpty()) 
		{
		//get user email
		String sessionUsername = String.valueOf(session.getAttribute("user"));		
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Account WHERE username = ?");
		pstmt.setString(1, sessionUsername);
		ResultSet rs= pstmt.executeQuery();
		rs.next();
		String userEmail = (String)rs.getString(4);
		
		String insert = "INSERT INTO Interest(emailAddr, itemName, itemColor, itemBrand, itemStorage)"
				+ "VALUES (?, ?, ?, ?, ?)";

		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, userEmail);
		ps.setString(2, itemName);
		ps.setString(3, itemColor);
		ps.setString(4, itemBrand);
		ps.setString(5, itemStorage);
				
		ps.executeUpdate();
		
		rs.close();
		ps.close();
		con.close();
		response.sendRedirect("itemAddedToInterest.jsp");
		}
		else{
			con.close();
			out.print("Insert failed: No empty inputs are allowed");
			out.print("Item cannot be added. Please try again.");
			%><br>
		<a href='index.jsp'>Return Home</a>
			<% return;
		}
		
	}catch (Exception ex) {
		out.print(ex);
		%><br>
	<%out.print("Item cannot be added. Please try again.");
		%><br>
	<a href='index.jsp'>Return Home</a>
	<%
	}
%>

</body>
</html>