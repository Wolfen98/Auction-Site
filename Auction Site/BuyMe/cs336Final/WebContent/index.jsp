<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
</head>
<body>

	<!-- Everyone worked on this -->
	<h1 style="text-align: center;">BuyMe Auction Site</h1>
	<%

	/* <p> Please select to create new account or log into existing account: </p> */
	
		if ((session.getAttribute("user") == null)) {
	%>

	<h3>Please create new account or log into existing account:</h3>
	<!-- <a href="Login.jsp">Please Login</a> -->

	<form method="post" action="CreateAccount.jsp">
		<input type="submit" value="Create New Account" />
	</form>
	<br>
	<form method="post" action="Login.jsp">
		<input type="submit" value="Login" />
	</form>
	<br>
	<h3>If you're a Customer Representative, log in here:</h3>
	<form method="post" action="cRepLogin.jsp">
		<input type="submit" value="Login" />
	</form>
	<br>
	<h3>If you're an Admin, log in here:</h3>
	<form method="post" action="adminLogin.jsp">
		<input type="submit" value="Login" />
	</form>
	<br>

	<br>
	<h2>Don't see your item?</h2>
	<h3>Log in or create an account to get notified when an item
		you're interested is added to the site!</h3>


	<%
		} else {
	%>

	<p style="text-align: center;">
		<a href='CreateAuction.jsp'>Create Auction</a> <a
			href='ChooseBidOption.jsp'>Start Bidding</a> <a href='searchItem.jsp'>Search
			for Items</a> <a href='qAndA.jsp'>Questions and Answers</a> <a
			href='emailPage.jsp'>View E-mails</a> <a href='logout.jsp'>Log
			out</a>
	</p>

	<h1>
		Welcome,
		<%=session.getAttribute("user")%>
	</h1>


	<br>
	<h2>Don't see your item?</h2>
	<h3>Get notified when an item you're interested is added to the
		site!</h3>
	<form method="post" action="setItemAlert.jsp">
		<p>
			Item Name: (e.g. iPhone) <input type="text" name="itemName">
			<br> Item Color: (e.g. Silver) <input type="text"
				name="itemColor"><br> Item Brand: (e.g. Apple) <input
				type="text" name="itemBrand"><br> Storage Size (GB):
			(e.g. 64) <input type="text" name="itemStorage"> <input
				type="submit" value="Notify Me!">
		</p>
	</form>


	<%
		}
	%>
	<h1>Current Item List:</h1>
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336", "lintakoon");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM Item INNER JOIN Auction WHERE auctionID = itemID;");
		
		
		//GETTING current time
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();

		//get current date
		java.util.Date dNow = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		
		String sessionUsername = String.valueOf(session.getAttribute("user"));		
		PreparedStatement pstmt = conn.prepareStatement("SELECT auctionID FROM Auction WHERE closingDateTime <= ? AND winner IS NULL");
		pstmt.setString(1, sdf.format(dNow));
		ResultSet rss= pstmt.executeQuery();


		while (rss.next()){
			String itemID = (String)rss.getString(1);
			
			pstmt = conn.prepareStatement("SELECT hiddenMin FROM Auction WHERE auctionID = ?");
			pstmt.setString(1, itemID);
			//out.print(itemID);
			ResultSet rsss= pstmt.executeQuery();
			rsss.next();
			Double hiddenMin = (Double)rsss.getDouble(1);
			
			pstmt = conn.prepareStatement("SELECT sellerEmailAddr FROM Auction WHERE auctionID = ?");
			pstmt.setString(1, itemID);
			rsss= pstmt.executeQuery();
			rsss.next();
			String sellerEmailAddr = (String)rsss.getString(1);
			if (hiddenMin != -1)
			{
				pstmt = conn.prepareStatement("SELECT * FROM Item WHERE itemID = ?");
				pstmt.setString(1, itemID);
				rsss= pstmt.executeQuery();
				rsss.next();
				String lastBidder = (String)rsss.getString(8);
				Double lastBidPrice = (Double)rsss.getDouble(9);
				if (hiddenMin > lastBidPrice){
					String update = "UPDATE Auction SET winner = ? WHERE auctionID = ?";
					pstmt = con.prepareStatement(update);
					pstmt.setString(1, "None");
					pstmt.setString(2, itemID);
					pstmt.executeUpdate();
				}else{
					//update winner
					String update = "UPDATE Auction SET winner = ? WHERE auctionID = ?";
					pstmt = con.prepareStatement(update);
					pstmt.setString(1, lastBidder);
					pstmt.setString(2, itemID);
					pstmt.executeUpdate();
					
					//update earnings
					update = "UPDATE User SET earnings = earnings + ? WHERE emailAddr = ?";
					pstmt = con.prepareStatement(update);
					pstmt.setDouble(1, lastBidPrice);
					pstmt.setString(2, sellerEmailAddr);
					pstmt.executeUpdate();
				}
			}else{	//no reserve
				//update winner
				pstmt = conn.prepareStatement("SELECT * FROM Item WHERE itemID = ?");
				pstmt.setString(1, itemID);
				rsss= pstmt.executeQuery();
				rsss.next();
				String lastBidder = (String)rsss.getString(8);
				Double lastBidPrice = (Double)rsss.getDouble(9);
				
				String update = "UPDATE Auction SET winner = ? WHERE auctionID = ?";
				pstmt = con.prepareStatement(update);
				pstmt.setString(1, lastBidder);
				pstmt.setString(2, itemID);
				pstmt.executeUpdate();
				
				//update earnings
				update = "UPDATE User SET earnings = earnings + ? WHERE emailAddr = ?";
				pstmt = con.prepareStatement(update);
				pstmt.setDouble(1, lastBidPrice);
				pstmt.setString(2, sellerEmailAddr);
				pstmt.executeUpdate();
				
			}
			rsss.close();
			
			
		}
		
		rss.close();
		pstmt.close();
		
	%>
	<table border="1">
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Item Color</th>
			<th>Item Brand</th>
			<th>Item Storage</th>
			<th>Item Image</th>
			<th>Date Posted</th>
			<th>Current Bidder</th>
			<th>Current Bid Price</th>
			<th>Starting Bid Price</th>
			<th>Bid Increment</th>
			<th>Closing Date & Time</th>
			<th>Winner!</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><img src="<%=rs.getString(6) %>"width="100"/></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getDouble(9)%></td>
			<td><%=rs.getDouble(16)%></td>
			<td><%=rs.getDouble(17)%></td>
			<td><%=rs.getString(14)%></td>
			<td><%=rs.getString(11)%></td>

		</tr>
		<% 

			}
		con.close();
		st.close();
		rs.close();
		
		}catch(Exception e) {
			out.println("Error with browsing table");
			/* response.sendRedirect("error.jsp"); */
			out.println(e);
		}%>
	</table>


	




</body>
</html>