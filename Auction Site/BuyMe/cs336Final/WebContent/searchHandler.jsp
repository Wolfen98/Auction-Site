<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set Item Alert</title>
</head>
<body>

	<!-- BY. Anita Kotowska -->

	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//get these from set search button
			String itemName = request.getParameter("itemName");
			String itemColor = request.getParameter("itemColor");
			String itemBrand = request.getParameter("itemBrand");
			String itemStorage = request.getParameter("itemStorage");

			if (itemName != null && !itemName.isEmpty() && itemColor == "" && itemBrand == ""
					&& itemStorage == "") {
				PreparedStatement pstmt = con.prepareStatement("select * from Item where itemName like ?");
				pstmt.setString(1, itemName);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
					con.close();
					pstmt.close();
					rs.close();
	%>
	<h1>No results found.</h1>

	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
				con.close();
				pstmt.close();
				rs.close();
			}

			else if (itemColor != null && !itemColor.isEmpty() && itemName == "" && itemBrand == ""
					&& itemStorage == "") {
				PreparedStatement pstmt = con.prepareStatement("select * from Item where itemColor like ?");
				pstmt.setString(1, itemColor);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
					con.close();
					pstmt.close();
					rs.close();
	%>

	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
				con.close();
				pstmt.close();
				rs.close();
			}

			else if (itemBrand != null && !itemBrand.isEmpty() && itemName == "" && itemColor == ""
					&& itemStorage == "") {
				PreparedStatement pstmt = con.prepareStatement("select * from Item where itemBrand like ?");
				pstmt.setString(1, itemBrand);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
					con.close();
					pstmt.close();
					rs.close();
	%>

	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
				con.close();
				pstmt.close();
				rs.close();
			}

			else if (itemStorage != null && !itemStorage.isEmpty() && itemName == "" && itemBrand == ""
					&& itemColor == "") {
				PreparedStatement pstmt = con.prepareStatement("select * from Item where itemStorage like ?");
				pstmt.setString(1, itemStorage);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
					con.close();
					pstmt.close();
					rs.close();
	%>

	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		con.close();
					pstmt.close();
					rs.close();
				}
			}

			else if (itemName != null && !itemName.isEmpty() && itemColor != null && !itemName.isEmpty()
					&& itemBrand == "" && itemStorage == "") {
				PreparedStatement pstmt = con
						.prepareStatement("select * from Item where itemName like ? AND itemColor like ?");
				pstmt.setString(1, itemName);
				pstmt.setString(2, itemColor);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName != null && !itemName.isEmpty() && itemColor == "" && itemBrand != null
					&& !itemBrand.isEmpty() && itemStorage == "") {
				PreparedStatement pstmt = con
						.prepareStatement("select * from Item where itemName like ? AND itemBrand like ?");
				pstmt.setString(1, itemName);
				pstmt.setString(2, itemBrand);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName != null && !itemName.isEmpty() && itemColor != null && itemName == ""
					&& itemBrand == "" && itemStorage != null && !itemStorage.isEmpty()) {
				PreparedStatement pstmt = con
						.prepareStatement("select * from Item where itemName like ? AND itemStorage like ?");
				pstmt.setString(1, itemName);
				pstmt.setString(2, itemStorage);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName == "" && itemColor != null && !itemColor.isEmpty() && itemBrand != null
					&& !itemBrand.isEmpty() && itemStorage == "") {
				PreparedStatement pstmt = con
						.prepareStatement("select * from Item where itemColor like ? AND itemBrand like ?");
				pstmt.setString(1, itemColor);
				pstmt.setString(2, itemBrand);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName == "" && itemColor != null && !itemColor.isEmpty() && itemBrand == ""
					&& itemStorage != null && !itemStorage.isEmpty()) {
				PreparedStatement pstmt = con
						.prepareStatement("select * from Item where itemColor like ? AND itemStorage like ?");
				pstmt.setString(1, itemColor);
				pstmt.setString(2, itemStorage);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName != null && !itemName.isEmpty() && itemColor != null && !itemColor.isEmpty()
					&& itemBrand != null && !itemBrand.isEmpty() && itemStorage == "") {
				PreparedStatement pstmt = con.prepareStatement(
						"select * from Item where itemName like ? AND itemColor like ? AND itemBrand like ?");
				pstmt.setString(1, itemName);
				pstmt.setString(2, itemColor);
				pstmt.setString(3, itemBrand);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName == "" && itemColor != null && !itemColor.isEmpty() && itemBrand != null
					&& !itemBrand.isEmpty() && itemStorage != null && !itemStorage.isEmpty()) {
				PreparedStatement pstmt = con.prepareStatement(
						"select * from Item where itemColor like ? AND itemBrand like ? AND itemStorage like ?");
				pstmt.setString(1, itemColor);
				pstmt.setString(2, itemBrand);
				pstmt.setString(3, itemStorage);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName != null && !itemName.isEmpty() && itemColor == "" && !itemColor.isEmpty()
					&& itemBrand != null && !itemBrand.isEmpty() && itemStorage != null && !itemStorage.isEmpty()) {
				PreparedStatement pstmt = con.prepareStatement(
						"select * from Item where itemName like ? AND itemColor like ? AND itemStorage like ?");
				pstmt.setString(1, itemName);
				pstmt.setString(2, itemColor);
				pstmt.setString(3, itemStorage);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName != null && !itemName.isEmpty() && itemColor == "" && itemBrand != null
					&& !itemBrand.isEmpty() && itemStorage != null && !itemStorage.isEmpty()) {
				PreparedStatement pstmt = con.prepareStatement(
						"select * from Item where itemName like ? AND itemBrand like ? AND itemStorage like ?");
				pstmt.setString(1, itemName);
				pstmt.setString(2, itemBrand);
				pstmt.setString(3, itemStorage);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

			else if (itemName != null && !itemName.isEmpty() && itemColor != null && !itemColor.isEmpty()
					&& itemBrand != null && !itemBrand.isEmpty() && itemStorage != null && !itemStorage.isEmpty()) {
				PreparedStatement pstmt = con.prepareStatement(
						"select * from Item where itemName like ? AND itemColor like ? AND itemBrand like ? AND itemStorage like ?");
				pstmt.setString(1, itemName);
				pstmt.setString(2, itemColor);
				pstmt.setString(3, itemBrand);
				pstmt.setString(4, itemStorage);
				ResultSet rs = pstmt.executeQuery();
	%>
	<%
		if (!rs.next()) {
	con.close();
			pstmt.close();
			rs.close();%>
	<h1>No results found.</h1>
	<%
		} else {
					rs.beforeFirst();
	%>
	<center>
		<h1>Search Results:</h1>
	</center>
	<table border="1">
		<tr>
			<th>Item ID:</th>
			<th>Item Name:</th>
			<th>Item Color:</th>
			<th>Item Brand:</th>
			<th>Item Storage:</th>
			<th>Item Image:</th>
			<th>Date Posted:</th>
			<th>Last Bidder :</th>
			<th>Last Bid Price:</th>
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
			<td><img src="<%=rs.getString(6)%>" width="100" /></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	con.close();
	pstmt.close();
	rs.close();}

		} catch (Exception ex) {
			response.sendRedirect("error.jsp");
			out.println(ex);
			out.println("Searchfailed");
		}
	%>
	<a href='index.jsp'>Return Home</a>

</body>
</html>