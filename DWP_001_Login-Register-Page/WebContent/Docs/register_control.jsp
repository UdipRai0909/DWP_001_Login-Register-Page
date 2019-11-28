<%-- 
    Document   : register_control
    Created on : Nov 25, 2019, 9:25:26 PM
    Author     : tufanb
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String address = request.getParameter("address");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confPassword = request.getParameter("confpassword");
    if (!password.equals(confPassword)) {
        response.sendRedirect("register.jsp?msg=Your password and confirmed password did not match!");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ismt", "tbhattarai", "password");
            PreparedStatement pstmt = conn.prepareStatement("insert into user(first_name,last_name,address,username,password)values(?,?,?,?,MD5(?))");
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, address);
            pstmt.setString(4, username);
            pstmt.setString(5, password);
            int inserted = pstmt.executeUpdate();
            String msg="";
            if (inserted == 1) {
                msg="User has been created.You can <a href='index.jsp'>login</a> now!";
                response.sendRedirect("register.jsp?msg="+msg);
            } else {
                msg="User could not be created.Please try again with changes.";
                response.sendRedirect("register.jsp?msg="+msg);
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
%>
