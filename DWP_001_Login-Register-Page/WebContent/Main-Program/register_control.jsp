<%@include file="dbConn.jsp" %>

<%
	
	String fname = request.getParameter("firstname");
	String lname = request.getParameter("lastname");
	String address = request.getParameter("address");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String confPass = request.getParameter("confirm_password");
	
	try {
		if(request.getParameter("userId") != null) {
			int id = Integer.parseInt(request.getParameter("userId"));
	    	PreparedStatement ps = conn.prepareStatement("UPDATE users SET firstname=?, lastname=?, address=?, username=? WHERE userId=?");
	        ps.setString(1, fname);
	        ps.setString(2, lname);
	        ps.setString(3, address);
	        ps.setString(4, username);
	        ps.setInt(5, id);
	        int status = ps.executeUpdate();
	        
	        if(status>0) {
	        	response.sendRedirect("welcome.jsp?msg=The user has been updated successfully.");
	        }
		} else {
			if(fname.isEmpty() || lname.isEmpty() || address.isEmpty() || username.isEmpty() || password.isEmpty() || confPass.isEmpty()) {
				response.sendRedirect("register.jsp?msg=Please dont leave any fields empty.");
			} else {
				if(!password.equals(confPass)) {
					response.sendRedirect("register.jsp?msg=The passwords do not match.");
				} else {
					try {
						String insertQuery = "INSERT INTO users(firstname, lastname, address, username, password) VALUES(?,?,?,?,MD5(?))";
						PreparedStatement ps = conn.prepareStatement(insertQuery);
						
						ps.setString(1, fname);
						ps.setString(2, lname);
						ps.setString(3, address);
						ps.setString(4, username);
						ps.setString(5, password);
						
						int status = ps.executeUpdate();
						String msg = "";
						
						if(status > 0) {
							msg = "The user has been registered successfully.";
							response.sendRedirect("register.jsp?msg=" + msg);
						} else {
							msg = "Failed to create the user.Please try again.";
							response.sendRedirect("register.jsp?msg=" + msg);
						}
						conn.close();
					} catch(Exception exp) {
						out.println(exp);
					}
				}
			}
		}
	} catch(Exception exp) {
		out.println(exp);
	}
%>