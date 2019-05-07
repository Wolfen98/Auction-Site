URL: http://ec2-18-219-85-27.us-east-2.compute.amazonaws.com:8080/BuyMe/

Apache Tomcat Manager
Username: admin
Password: adminadmin

I: All of our group members worked on this together
II: I (Seyeon Park) worked on this part
I did not get to make bidding automatically work on backend because I was not sure which bidding should be registered if there are multiple people doing automatic bidding on same item
I added a page where it would redirect user back to home page after successful insertion of data to database (such as creating auction, creating account, starting bid)
III: I (Joy), worked on this part
IV: I (Anita), worked on this part
Extra feature: Let user send emails

Code for alerting user for automatic bidding in newBidAuto.jsp (not included in project):
%><!-- BY. Anita Kotowska --><%	
//Alert users if someone bid higher than their secret upper limit					
ps = con.prepareStatement("select * from Bid where auctionID=newItemID AND secretUpperLimit IS NOT NULL AND secretUpperLimit<newBidAmount");
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
ps.setString(3, "Upper Limit Surpassed");
ps.setString(4, "Sorry, automatic bidding stopped because someone bid over your upper limit.");
ps.setString(5, currentTime);
ps.executeUpdate();
}

V: I (Anirban Chakraborty) worked on this part and did bug testing on the entire project

Additional Comments:

Seyeon and I added a browsing page on index.jsp to bid and search more easily. 
Anita added item search for every category combination (searchItem.jsp and searchHandler.jsp)
Anirban added closings for connections to databases for most jsp.


Admin
Username: admin
Password: pass

