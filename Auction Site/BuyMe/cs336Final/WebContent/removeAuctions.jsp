<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Auction</title>
</head>
<body>

<p>Remove Auction: </p>

<br>
	<form method="post" action="removeAuctionHandler.jsp">
	<table>
	<tr>    
	<td>Auction ID:* </td><td><input type="text" name="auctionID"></td>
	</tr>
	</table>
	<br>
	
	<input type="submit" value="Remove Auction">
	</form>
<br>

</body>
</html>