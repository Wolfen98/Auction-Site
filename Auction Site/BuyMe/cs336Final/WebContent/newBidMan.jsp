<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Place Bid Manually</title>
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
		
		
		if (!(newItemID.trim()).isEmpty() && !(newBidAmount.trim()).isEmpty()) 
		{ //itemName, itemColor, itemBrand, itemStorage, closingDateAndTime cannot be empty!!
		
			
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
			String insert = "INSERT INTO Bid(bidAmount, buyerEmailAddr, auctionID)" + "VALUES (?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			if (lastBidPrice == 0){
				if (Double.parseDouble(newBidAmount) < startingBidPrice + bidIncrement){
					out.print("Bid failed: bid amount is smaller than required amount");
					return;
				}else{
					ps.setString(1, newBidAmount);
					ps.setString(2, userEmail);
					ps.setString(3, newItemID);
					//Run the query against the DB
					ps.executeUpdate();
					
					String update = "UPDATE Item SET lastBidPrice = ?, lastBidder = ? WHERE itemID = ?";
					ps = con.prepareStatement(update);
					ps.setString(1, newBidAmount);
					ps.setString(2, userEmail);
					ps.setString(3, newItemID);
					
					ps.executeUpdate();
				}
			}else{
				if (Double.parseDouble(newBidAmount) < lastBidPrice + bidIncrement){
					out.print("Bid failed: bid amount is smaller than required amount");
					return;
				}else{
					ps.setString(1, newBidAmount);
					ps.setString(2, userEmail);
					ps.setString(3, newItemID);
					//Run the query against the DB
					ps.executeUpdate();
					
					String update = "UPDATE Item SET lastBidPrice = ?, lastBidder = ? WHERE itemID = ?";
					ps = con.prepareStatement(update);
					ps.setString(1, newBidAmount);
					ps.setString(2, userEmail);
					ps.setString(3, newItemID);
					ps.executeUpdate();
				}
			}
			
			//Run the query against the DB
			/* ps.executeUpdate(); */
			
			
			%><!-- BY. Anita Kotowska --><%	
			//Alert users if higher bid has been placed
						
						ps = con.prepareStatement("select * from Bid where auctionID = (select max(bidNumber) from Bid where auctionID = newItemID)");
						rss= pstmt.executeQuery();

						//Get current date and time
						java.util.Date dt = new java.util.Date();
						java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String currentTime = sdf.format(dt);	
						
						while(rss.next()){ 
							//email of user interested in item being added
							String alertThisEmail = rss.getString(4);
							insert = "INSERT INTO Email(from_, to_, subject, content, date_time)"
									+ "VALUES (?, ?, ?, ?, ?)";

							ps = con.prepareStatement(insert);

							ps.setString(1, "admin@buyme.com");
							ps.setString(2, alertThisEmail);
							ps.setString(3, "Higher Bidder");
							ps.setString(4, "Someone bidded higher on an item you bidded on");
							ps.setString(5, currentTime);
									
							ps.executeUpdate();
						}
			
			
			
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
