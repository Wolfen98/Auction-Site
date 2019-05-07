<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Register</title>
</head>
<body>

	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("adminLogin.jsp");
		}
	%>

	<h1>Create a Customer Representative Account</h1>
	<br>
	<form method="post" action="CheckCustomerRep.jsp">
		<table>
			<tr>
				<td>Email Address(MUST BE ADMIN(eg. admin@buyme.com)):*</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
			<tr>
				<td>User Name:*</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
			<tr>
				<td>Password:*</td>
				<td><input type="text" name="password"></td>
			</tr>
		</table>
		<br> <input type="submit" value="Create CR Account">
	</form>
	<br>

</body>
</html>