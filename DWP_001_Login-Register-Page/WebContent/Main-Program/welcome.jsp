<%-- 
    Document   : welcome
    Created on : Nov 22, 2019, 6:04:53 AM
    Author     : tufanb
--%>

<%@ include file="dbConn.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        
    <style>
	    h2 {
	    	text-align : center;
	    	font-weight : bolder;
    		font-size : 30px;
	    }
    	table {
	    	border-collapse : collapse; 
	    	width : 50%;
	    	margin : 0 auto;
	    	border : 1px solid #000;
    	}
    	tr, th, td {
    		padding : 20px;
    		border : 2px solid #000;
    	}
    	th {
    		border-bottom : 2px;
    		text-align : center;
    	}
    	a.log_out {
    		color : red !important;
    		font-weight : bolder;
    		font-size : 30px;
    		display : block;
    		margin : 0.5% 0 0 45.7%;
    	}
    </style>
    <body>
        <%
            String msg = request.getParameter("msg");
        %>
        <h1 style="color:green">Welcome user <%=msg%>!!</h1>
        <br/>

        <h2>User List</h2>
        <table>
            <tr>
            	<th>First Name</th>
	            <th>Last Name</th>
	            <th>User name</th>
	            <th>Address</th>
	            <th colspan="2">Action(s)</th>
            </tr>
             <%
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");
             %>
             <% while (rs.next()) {%>
	            <tr>
	                <td><%=rs.getString("firstname")%></td>
	                <td><%=rs.getString("lastname")%></td>
	                <td><%=rs.getString("username")%></td>
	                <td><%=rs.getString("address")%></td>
	                <td><a href="delete.jsp?id=<%=rs.getString("userId")%>">Delete</a></td>
	                <td><a href="edit.jsp?id=<%=rs.getString("userId")%>">Edit</a></td>
	            </tr>
			 <%}%>
        </table>
        <a class="log_out" href="index.jsp"><strong>Log out</strong></a>
    </body>
</html>
