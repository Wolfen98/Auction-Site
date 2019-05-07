<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Bids</title>
</head>
<body>
<p>Modify Bids: </p>

<br>
	<form method="post" action="modifyBidHandler.jsp">
	<table>
	<tr>    
	<td>Secret Upper Limit:* </td><td><input type="text" name="secretUpperLimit"></td>
	</tr>
	<tr>
	<td>Alert Message:* </td><td><input type="text" name="alert"></td>
	</table>
	<br>
	
	<input type="submit" value="Update Bid">
	</form>
<br>

</body>
</html>