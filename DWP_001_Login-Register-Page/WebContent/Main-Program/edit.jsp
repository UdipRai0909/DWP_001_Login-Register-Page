<%-- 
    Document   : Register Page
    Created on : Nov 27, 2019, 2:22:09 PM
    Author     : Udip Rai
--%>
<%@include file="dbConn.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit</title>
</head>
<body>
	<h1>Edit</h1>
	<%
		int id = Integer.parseInt(request.getParameter("id").trim());
		PreparedStatement ps = conn
				.prepareStatement("SELECT firstname,lastname,address,username FROM users WHERE userId=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
	%>
	<form action="register_control.jsp" method="POST">
		<table>
			<tr>
				<td colspan="2"><input type="hidden" name="userId"
					value="<%=id%>" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstname"
					value="<%=rs.getString("firstname")%>" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastname"
					value="<%=rs.getString("lastname")%>" /></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address"
					value="<%=rs.getString("address")%>" /></td>
			</tr>
			<tr>
				<td>User Name</td>
				<td><input type="text" name="username"
					value="<%=rs.getString("username")%>" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Edit" /></td>
				<td><input type="reset" value="Reset" /></td>
			</tr>
			<tr>
				<td colspan="2"><a href="index.jsp"><strong>Go to
							Login</strong></a></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>
