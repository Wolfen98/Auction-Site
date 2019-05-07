<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
</head>
<body>
	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("adminLogin.jsp");
		}
		//Need dollar format
		Locale temp = new Locale("en", "US");
		NumberFormat curr = NumberFormat.getCurrencyInstance(temp);

		//Getting database connection

		try {
			String retrieval = request.getParameter("type");
			//String userid = request.getParameter("username");
			//String pwd = request.getParameter("password");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336",
					"lintakoon");
			PreparedStatement ps = null;
			ResultSet rs = null;
			String tempQuery = null;
			//Retrieving data from database to generate sales report

			if (retrieval.equals("totalEarnings")) {
				tempQuery = "SELECT SUM(earnings) FROM User WHERE earnings IS NOT NULL";
				ps = con.prepareStatement(tempQuery);
				rs = ps.executeQuery();
				if (rs.next()) {
	%>
	<h2>Total Earnings:</h2>
	<table>
		<%
			do {
		%>
		<tr>
			<td><%=curr.format(rs.getDouble("SUM(earnings)")) %> </td>
		</tr>
		<%
			} while (rs.next());
		%>
	</table>
	<br>
	<a href="AdmControl.jsp">Return to Admin page.</a>
	<%
		rs.close();
					ps.close();
					con.close();
				}

			} else if (retrieval.equals("earningsPerItem")) {
				tempQuery = "SELECT itemName, SUM(lastBidPrice) FROM Item WHERE itemName IS NOT NULL GROUP BY itemName";
				ps = con.prepareStatement(tempQuery);
				rs = ps.executeQuery();
				if (rs.next()) {
	%>
	<h2>Earnings Per Item:</h2>
	<table>
		<%
			do {
		%>
		<tr>
			<td><%=rs.getString("itemName")%></td>
			<td><%=curr.format(rs.getDouble("SUM(lastBidPrice)"))%></td>
		</tr>
		<%
			} while (rs.next());
		%>
	</table>
	<br>
	<a href="AdmControl.jsp">Return to Admin page.</a>
	<%
		rs.close();
					ps.close();
					con.close();
				}
			} else if (retrieval.equals("earningsPerItemType")) {
				tempQuery = "SELECT itemBrand, SUM(lastBidPrice) FROM Item WHERE itemBrand IS NOT NULL GROUP BY itemBrand";
				ps = con.prepareStatement(tempQuery);
				rs = ps.executeQuery();
				if (rs.next()) {
	%>
	<h2>Earnings By Item Type:</h2>
	<table>
		<%
			do {
		%>
		<tr>
			<td><%=rs.getString("itemBrand")%></td>
			<td><%=curr.format(rs.getDouble("SUM(lastBidPrice)"))%></td>
		</tr>
		<%
			} while (rs.next());
		%>
	</table>
	<br>
	<a href="AdmControl.jsp">Return to Admin page.</a>
	<%
		rs.close();
					ps.close();
					con.close();
				}
			} else if (retrieval.equals("earningsPerEndUser")) {
				tempQuery = "SELECT emailAddr, SUM(earnings) FROM User WHERE emailAddr IS NOT NULL GROUP BY emailAddr";
				ps = con.prepareStatement(tempQuery);
				rs = ps.executeQuery();
				if (rs.next()) {
	%>
	<h2>Earnings per Seller:</h2>
	<table>
		<%
			do {
		%>
		<tr>
			<td><%=rs.getString("emailAddr")%></td>
			<td><%=curr.format(rs.getDouble("SUM(earnings)"))%></td>
		</tr>
		<%
			} while (rs.next());
		%>
	</table>
	<br>
	<a href="index.jsp">Return to home.</a>
	<br>
	<a href="AdmControl.jsp">Return to Admin page.</a>
	<%
		rs.close();
					ps.close();
					con.close();
				}
			} else if (retrieval.equals("bestSellingItems")) {
				tempQuery = "SELECT itemName, COUNT(itemName), SUM(lastBidPrice) FROM Item WHERE itemName IS NOT NULL GROUP BY itemName ORDER BY COUNT(itemName) DESC";
				ps = con.prepareStatement(tempQuery);
				rs = ps.executeQuery();
				if (rs.next()) {
	%>
	<h2>Best Selling:</h2>
	<table>
		<%
			do {
		%>
		<tr>
			<td><%=rs.getString("itemName")%></td>
			<td><%=rs.getInt("COUNT(itemName)")%></td>
			<td><%=curr.format(rs.getDouble("SUM(lastBidPrice)"))%></td>
		</tr>
		<%
			} while (rs.next());
		%>
	</table>
	<br>
	<a href="index.jsp">Return to home.</a>
	<br>
	<a href="AdmControl.jsp">Return to Admin page.</a>
	<%
		rs.close();
					ps.close();
					con.close();
				}
			} else if (retrieval.equals("bestBuyers")) {
				tempQuery = "SELECT lastBidder, COUNT(itemID) FROM Item WHERE lastBidder IS NOT NULL GROUP BY lastBidder ORDER BY COUNT(lastBidder) DESC";
				ps = con.prepareStatement(tempQuery);
				rs = ps.executeQuery();
				if (rs.next()) {
	%>
	<h2>Best Buyer</h2>
	<table>
		<%
			do {
		%>
		<tr>
			<td><%=rs.getString("lastBidder")%></td>
			<td><%=rs.getInt("COUNT(itemID)")%></td>
		</tr>
		<%
			} while (rs.next());
		%>
	</table>
	<br>
	<a href="index.jsp">Return to home.</a>
	<br>
	<a href="AdmControl.jsp">Return to Admin page.</a>
	<%
		rs.close();
					ps.close();
					con.close();
				}
			} else {
				//Wrong sales retrieval
				out.println("Incorrect sales report syntax");
				response.sendRedirect("AdmControl.jsp");
				rs.close();
				ps.close();
				con.close();
				return;
			}

		} catch (Exception e) {
			out.println("Something wrong in MySQL");
			e.printStackTrace(); %>
			<a href="index.jsp">Return to home.</a>
			<br>
			<a href="AdmControl.jsp">Return to Admin page.</a>
			
<%
		} %>
	
</body>
</html>