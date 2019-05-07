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
<p>Choose how you want to bid: </p>

<form method="post" action="CreateBid.jsp">
    <!-- note the CreateBid.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="bidOption" value="bidMan"/>Bid Manually
  <br>
  <input type="radio" name="bidOption" value="bidAuto"/>Bid Automatically
    <!-- when the radio for bars is chosen, then 'bidOption' will have value 
     | 'bidAuto', in the CreateBid.jsp file, when you access request.parameters -->
  <br>
  <input type="submit" value="submit"/>
</form>

</body>
</html>