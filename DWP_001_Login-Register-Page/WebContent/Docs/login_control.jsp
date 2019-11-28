<%@page import="java.sql.*"%>
<% //this is the start of a scriptlet. 
    //inside a scriptlet, java code can be placed though we are in a .jsp page. 
    out.println("inside login conrol");//out.print is used to print something to a web page. 
    //Now, let us remember the input parameters we had placed in the 'login.jsp' form for username and password. 
    //same values are used here to uniquely get the input values for particular name attributes. 
    String uname = request.getParameter("username");
    String password = request.getParameter("pwd");

//try catch is used here because we have exception generating codes below: 
    try {
// These two lines of code below show connection to a MySQL database with credentials 
// For this, I have used mysql-connector-java-8.0.18.jar Driver.
// Different drivers are required for different DBMS. 
        Class.forName("com.mysql.cj.jdbc.Driver");//'com.mysql.cj.jdbc.Driver' is the current mysql driver
        //previously, in older driver versions,'com.mysql.jdbc.Driver' was used. 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ismt", "tbhattarai", "password");
//in the above connection string,"jdbc:mysql://localhost:3306/ismt","tbhattarai","password", 
//ismt is the name of the Database. 'tbhattarai' is username and 'password' is the password to connect to the specified database.  
        PreparedStatement pstmt = conn.prepareStatement("select * from user where username=? and password=MD5(?)");
        pstmt.setString(1, uname);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            //if there are values retrieved from database then, the program enters here. 
            response.sendRedirect("welcome.jsp?msg=" + rs.getString("first_name")+" "+rs.getString("last_name"));
        } else {
            //if the user with specified username and password are not available, the program redirects to error.jsp page with the message
            response.sendRedirect("error.jsp?msg=Login Failure!");
        }
    } catch (Exception ex) {
        out.println(ex);

    }

//this is the end of the scriptlet%>