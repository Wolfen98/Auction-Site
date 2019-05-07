<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Account</title>
</head>
<body>
<p>Modify Account: </p>

<br>
	<form method="post" action="modifyAccountHandler.jsp">
	<table>
	<tr>    
	<td>First Name:* </td><td><input type="text" name="firstName"></td>
	</tr>
	<tr>
	<td>Last Name:* </td><td><input type="text" name="lastName"></td>
	</tr>
	<td>Gender: (M/F) </td><td><input type="text" name="gender"></td>
	</tr>
	<tr>
	<td>Birthday:* (mm/dd/yyyy) </td><td><input type="text" name="birthday"></td>
	</tr>
	<tr>
	<td>Earnings:* </td><td><input type="text" name="earnings"></td>
	</tr>
	<tr>
	<td>Password:* </td><td><input type="text" name="password"></td>
	</tr>
	<tr>
	</table>
	<br>
	
	<input type="submit" value="Update Account">
	</form>
<br>

</body>
</html>