<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Bid</title>
</head>
<body>

<p>Remove Bid: </p>

<br>
	<form method="post" action="removeBidHandler.jsp">
	<table>
	<tr>    
	<td>Bid Number:* </td><td><input type="text" name="bidNumber"></td>
	</tr>
	</table>
	<br>
	
	<input type="submit" value="Remove Bid">
	</form>
<br>

</body>
</html>