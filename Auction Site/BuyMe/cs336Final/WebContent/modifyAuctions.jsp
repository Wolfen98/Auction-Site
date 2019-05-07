<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Auction</title>
</head>
<body>
<p>Modify Auction: </p>

<br>
	<form method="post" action="modifyAuctionHandler.jsp">
	<table>
	<tr>    
	<td>Winner:* </td><td><input type="text" name="winner"></td>
	</tr>
	<tr>
	<td>Closing Date Time:* </td><td><input type="text" name="closingDateTime"></td>
	</tr>
	<tr>
	<td>hiddenMin:* </td><td><input type="text" name="hiddenMin"></td>
	</tr>
	</table>
	<br>
	
	<input type="submit" value="Update Auction">
	</form>
<br>

</body>
</html>
