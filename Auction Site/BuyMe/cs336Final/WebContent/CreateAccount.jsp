<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
</head>
<body>
<p>Please Create A New Account: </p>

<br>
	<form method="post" action="newAccount.jsp">
	<table>
	<tr>    
	<td>First Name:* </td><td><input type="text" name="firstName"></td>
	</tr>
	<tr>
	<td>Last Name:* </td><td><input type="text" name="lastName"></td>
	</tr>
	<tr>
	<td>Email Address:* </td><td><input type="text" name="email"></td>
	</tr>
	<tr>
	<td>Gender: (M/F) </td><td><input type="text" name="gender"></td>
	</tr>
	<tr>
	<td>Birthday:* (mm/dd/yyyy) </td><td><input type="text" name="birthday"></td>
	</tr>
	<tr>
	<td>Username:* </td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password:* </td><td><input type="text" name="password"></td>
	</tr>
	<tr>
	</table>
	<br>
	
	<input type="submit" value="Create Account">
	</form>
<br>



</body>
</html>