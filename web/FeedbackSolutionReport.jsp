<%-- 
    Document   : FeedbackSolutionReport
    Created on : 13-May-2023, 8:42:22 pm
    Author     : Dell
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Orders</title>

        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/Orders.css">
    </head>
    <body>
        <%@include file="UserNavbar.jsp" %>
        <div class="active">
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.sql.*" %>
            <%
                HttpSession httpSession = request.getSession();
                String guid = (String) httpSession.getAttribute("currentuser");
            %>

            <div class="filler"></div>

            <%
                int flag = 0;
                ResultSet rs = null;
                CallableStatement cs = null;
                PreparedStatement ps = null;
                java.sql.Connection conn = null;
                String query1 = "select * from feedbacksolutiion where uid=?";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    ps = conn.prepareStatement(query1);
                    ps.setString(1, guid);
                    rs = ps.executeQuery();
            %>
            <table class="tables">
                <h1 style="color: #1d67b1;padding:12px 0 12px 0; margin-bottom:0">Feedback Solution</h1>
                <tr>
                    <th>ID</th>
                    <th>Your Feedback</th>
                    <th>Date and Time</th>
                    <th>Reply</th>
                </tr>
                <%while (rs.next()) {
                %>

                <tr>
                    <td><%=rs.getInt("fsid")%></td>
                    <td><%=rs.getString("feedback")%></td>
                    <td><%=rs.getString("datetime")%></td>
                    <td><%=rs.getString("message")%></td>
                </tr><tr></tr>

                <%
                    }
                %>
            </table>
        </div>
        <%
            } catch (Exception e) {
                out.println("error: " + e);
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                } catch (Exception e) {
                };
                try {
                    if (cs != null) {
                        cs.close();
                    }
                } catch (Exception e) {
                };
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (Exception e) {
                };
            }
        %>
    </body>
</html>
