<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<p>Enter Login Information: </p>

<br>
	<form method="post" action="checkAdminLogin.jsp">
	<table>
	<tr>    
	<td>Username: </td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password: </td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Log In">
	</form>
<br>
</body>
</html>