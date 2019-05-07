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

<%
		//fetch what the user picked as bidding option
		String bidOption = request.getParameter("bidOption");
		
		//depending on the radio button selection, show different input forms
		if (bidOption == null){
			out.print("ERROR: You must pick a bidding option to proceed!!");
		}
		else if (bidOption.equals("bidMan")){
			%>
			<p>Start A New Bid: </p>
			
			<form method="post" action="newBidMan.jsp">
			<table>
			<tr>    
			<td>Item ID:* </td><td><input type="text" name="itemID"></td>
			</tr>
			<tr>    
			<td>Bid Amount:* </td><td><input type="text" name="bidAmount"></td>
			</tr>
			</table>
			<br>
			
			<input type="submit" value="Start Bidding Manually">
			</form>
		<%
		}else {
			%>
			<p>Start A New Bid: </p>
		
			<form method="post" action="newBidAuto.jsp">
			<table>
			<tr>    
			<td>Item ID:* </td><td><input type="text" name="itemID"></td>
			</tr>
			<tr>    
			<td>Bid Amount:* </td><td><input type="text" name="bidAmount"></td>
			</tr>
			<tr>
			<td>Secret upper limit:* </td><td><input type="text" name="secretUppLimit"></td>
			</tr>
			</table>
			<br>
			
			<input type="submit" value="Start Bidding Automatically">
			</form>
	<% }%>
</body>
</html>