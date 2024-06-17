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

        <%@include file="AdminNavbar.jsp" %>
        <div class="active">
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.sql.*" %>
            <%
                HttpSession httpSession = request.getSession();
                String gid = (String) httpSession.getAttribute("currentuser");
            %>

            <div class="filler"></div>

            <%
                int flag = 0;
                ResultSet rs = null;
                CallableStatement cs = null;
                PreparedStatement ps = null;
                java.sql.Connection conn = null;
                String query1 = "select * from feedback";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    ps = conn.prepareStatement(query1);
                    rs = ps.executeQuery();
            %>
            <table class="tables">
                <h1 style="color: #1d67b1;padding:12px 0 12px 0; margin-bottom:0">Feedbacks</h1>
                <tr>
                    <th>Feedback ID</th>
                    <th>User Name</th>
                    <th>Email ID</th>
                    <th>Contact No.</th>
                    <th>Feedback</th>
                    <th>Date and Time</th>
                    <th>Action</th>
                </tr>
                <%while (rs.next()) {
                %>

                <tr>
                <form action="FeedbackSolution.jsp" method="post">
                    <td>
                        <%=rs.getInt("fid")%>
                        <input type="hidden" name="uid" value="<%=rs.getString("uid")%>">
                    </td>
                    <td><%=rs.getString("name")%>
                        <input type="hidden" name="name" value="<%=rs.getString("name")%>">
                    </td>
                    <td><%=rs.getString("eid")%>
                        <input type="hidden" name="feedback" value="<%=rs.getString("feedback")%>">
                    </td>
                    <td><%=rs.getString("contact")%></td>
                    <td><%=rs.getString("feedback")%></td>
                    <td><%=rs.getString("feedbackdatetime")%></td>
                    <td><input type="submit" value="Message" name="btnview"></td>
                </form>
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
