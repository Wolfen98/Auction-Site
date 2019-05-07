<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Make a Sales Report</title>
</head>
<body>

	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("adminLogin.jsp");
		}
	%>

	<h1>Generate a sales report</h1>

	<ul>
		<li><a href="CheckSalesRep.jsp?type=totalEarnings">Total
				Earnings</a></li>
		<li><a href="CheckSalesRep.jsp?type=bestBuyers">Best Buyers</a></li>
		<li><a href="CheckSalesRep.jsp?type=bestSellingItems">Best
				Selling Items</a></li>
		<li><a href="CheckSalesRep.jsp?type=earningsPerItem">Earnings
				Per Item</a></li>
		<li><a href="CheckSalesRep.jsp?type=earningsPerEndUser">Earnings
				Per End-User</a></li>
		<li><a href="CheckSalesRep.jsp?type=earningsPerItemType">Earnings
				Per Item Type</a></li>

	</ul>


</body>
</html>