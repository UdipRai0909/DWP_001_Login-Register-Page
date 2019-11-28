<%@include file="dbConn.jsp" %>
<% 
    // out.println("inside login control"); 
    String uname = request.getParameter("username");
    String password = request.getParameter("password");
    
    try {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username=? and password=MD5(?)");
        ps.setString(1, uname);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            response.sendRedirect("welcome.jsp?msg=" + rs.getString("firstname") + " " + rs.getString("lastname"));
        } else {
            response.sendRedirect("error.jsp?msg=Login Failure!");
        }
    } catch (Exception ex) {
        out.println(ex);

    }
%>