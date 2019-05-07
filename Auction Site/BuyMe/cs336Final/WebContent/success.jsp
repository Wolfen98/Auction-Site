<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta HTTP-EQUIV="REFRESH" content="5; url=index.jsp">
<title>Success</title>
</head>
<body>


	<%-- <% 
		if ((session.getAttribute("user") == null)) {
		%>
		You are not logged in<br/>
		<a href="Login.jsp">Please Login</a>
		<%} else {
		%>
		<h1>Welcome <%=session.getAttribute("user")%></h1>
		<a href='qAndA.jsp'>Questions Page</a>  
		<a href='logout.jsp'>Log out</a>
		<%
		    }

%> --%>


	Insert succeeded :)
	<br>
	<br>
	You will be automatically redirected in 5 seconds...
	
	<!-- /* Thread.sleep(5000);
	response.sendRedirect("index.jsp"); */ -->


</body>
</html>