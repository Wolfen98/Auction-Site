<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Auction</title>
</head>
<body>

<!-- BY. Seyeon Park -->
<p>Start A New Auction: </p>

<br>
	<form method="post" action="newAuction.jsp">
	<table>
	<tr>    
	<td>Item Name:* </td><td><input type="text" name="itemName"></td>
	</tr>
	<tr>
	<td>Item Color:* </td><td><input type="text" name="itemColor"></td>
	</tr>
	<tr>
	<td>Item Brand:* </td><td><input type="text" name="itemBrand"></td>
	</tr>
	<tr>
	<td>Item Storage:* (GB) </td><td><input type="text" name="itemStorage"></td>
	</tr>
	<tr>
	<td>Item Image URL: </td><td><input type="text" name="itemImgPath"></td>
	</tr>
	<tr>
	<td>Starting Bid Price:* ($) </td><td><input type="text" name="startingBidPrice"></td>
	</tr>
	<tr>
	<td>Bid Increment:* (minimum $ necessary for next bidding) </td><td><input type="text" name="bidIncrement"></td>
	</tr>
	<tr>
	<td>Hidden minimum price (Reserve): </td><td><input type="text" name="hiddenMin"></td>
	</tr>
	<tr>
	<td>Closing date and time:* (YYYY-MM-DD HH:MI:SS)</td><td><input type="text" name="closingDateTime"></td>
	</tr>
	<tr>
	</table>
	<br>
	
	<input type="submit" value="Start Auction">
	</form>
<br>

</body>
</html>