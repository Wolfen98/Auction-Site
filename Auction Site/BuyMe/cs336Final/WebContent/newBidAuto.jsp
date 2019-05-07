<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Place Bid Automatically</title>
</head>
<body>

<!-- BY. Seyeon Park -->
<%

	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String newItemID = request.getParameter("itemID");
		String newBidAmount = request.getParameter("bidAmount");
		String newSecretUpperLimit = request.getParameter("secretUppLimit");
		

		if (!(newItemID.trim()).isEmpty() && !(newBidAmount.trim()).isEmpty() && !((newSecretUpperLimit.trim()).isEmpty())) 
		{
		
			//get current user's emailAddr
			Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe","cs336", "lintakoon");
			Statement st = conn.createStatement();
			
			String sessionUsername = String.valueOf(session.getAttribute("user"));		
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Account WHERE username = ?");
			pstmt.setString(1, sessionUsername);
			ResultSet rss= pstmt.executeQuery();
			rss.next();
			String userEmail = (String)rss.getString(4);
			
			pstmt = conn.prepareStatement("SELECT * FROM Auction WHERE auctionID = ?");
			pstmt.setString(1, newItemID);
			rss= pstmt.executeQuery();
			rss.next();
			Double startingBidPrice = (Double)rss.getDouble(7);
			Double bidIncrement = (Double)rss.getDouble(8);
			
			pstmt = conn.prepareStatement("SELECT * FROM Item WHERE itemID = ?");
			pstmt.setString(1, newItemID);
			rss= pstmt.executeQuery();
			rss.next();
			Double lastBidPrice = (Double)rss.getDouble(9);
			
			
			//Make an insert statement for the Catalog table:
			String insert = "INSERT INTO Bid(bidAmount, secretUpperLimit, buyerEmailAddr, auctionID)" + "VALUES (?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			if (Double.parseDouble(newBidAmount) > Double.parseDouble(newSecretUpperLimit)){	//error check so secretUpperLimit is always higher than bidAmount
				out.print("ERROR: Secret Upper Limit has to be equal or higher than the Bid Amount!!");
			}else {
				ps.setString(1, newBidAmount);
				ps.setString(2, newSecretUpperLimit);
			}
			ps.setString(3, userEmail);
			ps.setString(4, newItemID);
			
			//Run the query against the DB
			ps.executeUpdate();
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			response.sendRedirect("successBid.jsp");
		}
		else {
			out.print("Insert failed: No empty inputs are allowed");
			return; //need to make a jsp page for error handling
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed");
	}
%>

</body>
</html>
