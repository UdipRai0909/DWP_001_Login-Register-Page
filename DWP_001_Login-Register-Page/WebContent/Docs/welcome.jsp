<%-- 
    Document   : welcome
    Created on : Nov 22, 2019, 6:04:53 AM
    Author     : tufanb
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<%
            //this is a string variable to store msg sent from login_control page
            String msg = request.getParameter("msg");
            //<%= is used to directly print the variable in a jsp page
        %>
	<h1 style="color: green">
		Welcome user
		<%=msg%>!!
	</h1>
	<br />

	<h2>User List</h2>
	<table border="1">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Username</th>
			<th>Address</th>
			<th colspan="2">Action(s)</th>
		</tr>
		<%
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ismt", "tbhattarai", "password");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from user");
                %>
		<% while (rs.next()) {%>
		<tr>
			<td><%=rs.getString("first_name")%></td>
			<td><%=rs.getString("last_name")%></td>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("address")%></td>
			<td><a href="delete.jsp?id=<%=rs.getString("id")%>">Delete</a></td>
			<td><a href="edit.jsp?id=<%=rs.getString("id")%>">Edit</a></td>
		</tr>
		<%}%>
	</table>
</body>
</html>
