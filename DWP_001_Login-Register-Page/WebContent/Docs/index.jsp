<%-- 
    Document   : welcome
    Created on : Nov 20, 2019, 7:46:42 AM
    Author     : tufanb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login!</h1>
        <%
        //do not miss action and method form attributes in a form. 
        //action leads the input in the form to the specified location for further processing when form is submitted. 
        //Put values of the 'name' attribute properly so that the input values can be easily taken out from the request. 
        %>
        <form action="login_control.jsp" method="POST">
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="pwd"/> </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Login"></td>
                </tr>
            </table>
        </form>
        <br/>
        <a href="register.jsp">Register</a>
    </body>
</html>
