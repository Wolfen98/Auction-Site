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
	<center>
		<h1>Customer Representative Dashboard</h1>
	</center>
	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("Login.jsp");
		}

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336", "lintakoon");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from CustomerService");
	%>
	<h3>To Answer a Question, Enter the ID and Answer the Question</h3>
	<form method="post" action="answerQuestionHandler.jsp">
		<table>
			<tr>
				<td>Enter the Question ID:</td>
				<td><input type="text" name="iD"></td>
			</tr>
			<tr>
				<td>Answer the Question:</td>
				<td><input type="text" name="answer"></td>
			</tr>
		</table>
		<br> <input type="submit" value="Answer">

	</form>

	<form method="post" action="searchQuestion.jsp">
		<h4>
			Search a Question: <input type="text" name="search"> <input
				type="submit" value="Search">
		</h4>
	</form>

	<br>
	<table border="1">
		<tr>
			<th>ID:</th>
			<th>Questions:</th>
			<th>Answers:</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td>
				<%
					String answer = rs.getString(3);
						if (answer != null) {
				%> <%=answer%> <%
 	} else {
 %> <%="no answer"%> <%
 	}
 %>
			
		</tr>
		<%
			}
		rs.close();
		st.close();
		con.close();
		%>
	</table>
	<br>
	
	<a href='AucControl.jsp'>Return to Customer Representative Dashboard</a>

</body>
</html>