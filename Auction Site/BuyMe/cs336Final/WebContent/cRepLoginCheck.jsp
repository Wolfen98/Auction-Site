<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

	try {

		//Get the database connection
		
	    String userid = request.getParameter("username");   
	    String pwd = request.getParameter("password");
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe","cs336", "lintakoon");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("select * from CustomerRep  where username ='" + userid + "' and password ='" + pwd + "'");
	    if (rs.next()) {
	        session.setAttribute("user", userid); // the username will be stored in the session
	        //out.println("welcome " + userid);
	        //out.println("<br> <a href='logout.jsp'>Log out</a>");
	        response.sendRedirect("AucControl.jsp");
	    } else {
	        out.println("Invalid password <a href='cRepLogin.jsp'>try again</a>");
	    }
	
	
		//close the connection.
		con.close();
	    st.close();
	    rs.close();

	} catch (Exception e) {
		out.println("Error with creating C Rep Account");
		out.println(e);
	}
%>
</body>
</html>