<%@include file="dbConn.jsp" %>

<%
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		String deleteQuery = "DELETE FROM users where userId = ?";
		PreparedStatement ps = conn.prepareStatement(deleteQuery);
		ps.setInt(1, id);
		int status = ps.executeUpdate();
		if(status > 0) {
			response.sendRedirect("welcome.jsp?msg=The user has been deleted successfully");
		} else {
			response.sendRedirect("welcome.jsp?msg=An error occured while deleting the user.");
		}
	} catch(Exception exp) {
		out.println(exp);
	}

%>