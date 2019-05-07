<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Item To DB</title>
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
		String newItemName = request.getParameter("itemName");
		String newItemColor = request.getParameter("itemColor");
		String newItemBrand = request.getParameter("itemBrand");
		String newItemStorage = request.getParameter("itemStorage");
		String newItemImgPath = request.getParameter("itemImgPath");
		String newStartingBidPrice = request.getParameter("startingBidPrice");
		String newBidIncrement = request.getParameter("bidIncrement");
		String newHiddenMin = request.getParameter("hiddenMin");
		String newClosingDateTime = request.getParameter("closingDateTime");
		

		if (!(newItemName.trim()).isEmpty() && !(newItemColor.trim()).isEmpty() && !(newItemBrand.trim()).isEmpty() && !(newItemStorage.trim()).isEmpty() && !(newStartingBidPrice.trim()).isEmpty() && !(newBidIncrement.trim()).isEmpty() && !(newClosingDateTime.trim()).isEmpty()) 
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
			
			
			
			//Make an insert statement for the Catalog table:
			String insert = "INSERT INTO Auction(sellerEmailAddr, closingDateTime, hiddenMin, startingBidPrice, bidIncrement)" + "VALUES (?, ?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, userEmail);
			ps.setString(2, newClosingDateTime.trim());		//maybe check if appropriate date
			if (newHiddenMin.trim() == "")
			{
				ps.setDouble(3, -1);	//No HiddenMin inputted
			}else {
				ps.setDouble(3, Double.parseDouble(newHiddenMin));
			}
			ps.setDouble(4, Double.parseDouble(newStartingBidPrice));
			ps.setDouble(5, Double.parseDouble(newBidIncrement));
			
			//Run the query against the DB
			ps.executeUpdate();
			
			//Fetch auto_incremented data from Auction
			ResultSet rs = ps.getGeneratedKeys();
			int generatedKey = 0;
			if (rs.next()) {
			    generatedKey = rs.getInt(1);
			}
			
			
			//Insert into Item table
			insert = "INSERT INTO Item(itemID, itemName, itemColor, itemBrand, itemStorage, itemImage, datePosted)" + "VALUES (?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(insert);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself		
			ps.setInt(1, generatedKey);
			ps.setString(2, newItemName.trim());
			ps.setString(3, newItemColor.trim());
			ps.setString(4, newItemBrand.trim());
			ps.setString(5, newItemStorage.trim());
			ps.setString(6, newItemImgPath.trim());
			
			java.util.Date dNow = new java.util.Date();
			SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
			ps.setString(7, sdf.format(dNow));
			
			//Run the query against the DB
			ps.executeUpdate();
			
			
%><!-- BY. Anita Kotowska --><%	
//Alert users if this Auction created contains an item that is in an Interest list
			ps = con.prepareStatement("select * from Interest where itemName = ? AND itemColor = ? AND itemBrand = ? AND itemStorage = ?");
			ps.setString(1, newItemName);
			ps.setString(2, newItemColor);
			ps.setString(3, newItemBrand);
			ps.setString(4, newItemStorage);
			rs= ps.executeQuery();

			//Get current date and time
			java.util.Date dt = new java.util.Date();
			sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);	

			while(rs.next()){ 
				//email of user interested in item being added
				String interestedEmail = rs.getString(4);
				insert = "INSERT INTO Email(from_, to_, subject, content, date_time)"
						+ "VALUES (?, ?, ?, ?, ?)";

				ps = con.prepareStatement(insert);

				ps.setString(1, "admin@buyme.com");
				ps.setString(2, interestedEmail);
				ps.setString(3, "Item on Sale!");
				ps.setString(4, "An item you were interested in has been put up for auction. Head to the site now to bid!");
				ps.setString(5, currentTime);
						
				ps.executeUpdate();
			
			}
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			response.sendRedirect("success.jsp");
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
