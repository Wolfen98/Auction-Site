<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Dashboard</title>
</head>
<body>
	<ul>
		<li><a href="removeAuctions.jsp">Remove auctions</a></li>
		<li><a href="removeBids.jsp">Remove bids</a></li>
		<li><a href="answerQuestions.jsp">Answer some questions</a></li>
		<li><a href="modifyAccount.jsp">Edit accounts</a></li>
		<li><a href="modifyBids.jsp">Edit bids</a></li>
		<li><a href="modifyAuctions.jsp">Edit auctions</a></li>
	</ul>
	<br>
	
	<jsp:include page="index.jsp"/>

</body>
</html>