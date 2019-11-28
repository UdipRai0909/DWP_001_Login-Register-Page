<%-- 
    Document   : Register Page
    Created on : Nov 27, 2019, 2:22:09 PM
    Author     : Udip Rai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register</h1>
        <form action="register_control.jsp" method="POST">
            <table>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="firstname"/></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lastname"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address"/></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="confirm_password"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Register"/></td>
                    <td><input type="reset" value="Reset"/></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="index.jsp"><strong>Go to Login</strong></a> </td>
                </tr>
            </table>
        </form>
        <%
        String msg=request.getParameter("msg");
        if(msg==null){msg="";}
        %>
        <p style="color:red;">
        	<%=msg%>
        </p>
    </body>
</html>
