<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("cRepLogin.jsp");
	} else {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336",
					"lintakoon");
			int bidNum = Integer.parseInt(request.getParameter("bidNumber"));

			String delete = "DELETE FROM Bid WHERE bidNumber=?";
			ps = con.prepareStatement(delete);
			ps.setInt(1, bidNum);

			int check = 0;
			check = ps.executeUpdate(); //this is so that if deletion goes wrong, it redirects back to AucControl through error page
			if (check < 1) {
				con.close();
				ps.close();
				response.sendRedirect("removalError.jsp");
			} else {
				con.close();
				ps.close();
				// Bid was successfully deleted
%>
<jsp:include page="AucControl.jsp" flush="true" />
<h1>Bid Removed</h1>

<%
	}
		} catch (Exception e) {
			e.printStackTrace();
			out.print(e);
			out.print("Remove failed");
			response.sendRedirect("error.jsp");
		}
	}
%>