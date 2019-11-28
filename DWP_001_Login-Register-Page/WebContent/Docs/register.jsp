<%-- 
    Document   : register
    Created on : Nov 25, 2019, 8:32:09 PM
    Author     : tufanb
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
                    <td>First Name:</td>
                    <td><input type="text" name="firstname"/></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="lastname"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address"/></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td><input type="password" name="confpassword"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Register"/></td>
                    <td><input type="reset" value="Reset"/></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="index.jsp">Go to Login</a> </td>
                </tr>
            </table>
        </form>
        <%
        String msg=request.getParameter("msg");
        if(msg==null){msg="";}
        %>
        <%=msg%>
    </body>
</html>
