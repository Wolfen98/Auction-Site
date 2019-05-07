<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Control</title>
</head>
<body>

	<a href="cRepRegister.jsp">Create a Customer Representative Account</a>
	<a href="SalesRep.jsp">Make some Sales Reports</a>
	<a href="AucControl.jsp">Go to Customer Dashboard</a>
	
	<jsp:include page="index.jsp"/>

</body>
</html>