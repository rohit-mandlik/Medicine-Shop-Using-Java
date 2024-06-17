<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Orders</title>
        <link rel="stylesheet" href="css/Orders.css">
    </head>
    <body>
        <%@include file="UserNavbar.jsp" %>
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
                java.sql.Connection conn = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    cs = conn.prepareCall("call getorders(?)");
                    cs.setString(1, gid);
                    rs = cs.executeQuery();
            %><div class="filler2"></div>
            <table class="tables">
                <h1 style="color: #1d67b1;padding:12px 0 12px 0; margin-bottom:0">Orders</h1>
                <tr>
                    <th>Order ID</th>
                    <th>Product ID</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Seller ID</th>
                    <th>Order Date and Time</th>
                </tr>
                <%while (rs.next()) {
                %>

                <tr>
                    <td><%=rs.getInt("oid")%></td>
                    <td><%=rs.getString("pid")%></td>
                    <td><%=rs.getInt("price")%></td>
                    <td><%=rs.getInt("quantity")%></td>
                    <td><%=rs.getString("sid")%></td>
                    <td><%=rs.getTimestamp("orderdatetime")%>
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
