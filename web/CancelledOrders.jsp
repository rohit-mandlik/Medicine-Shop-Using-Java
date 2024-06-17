<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Orders</title>
        <link rel="stylesheet" href="bootstrap.css">
        <link rel="stylesheet" href="css/Orders.css">
    </head>
    <body>
        <div class="main">
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
                        PreparedStatement ps = conn.prepareStatement("Select c.oid,c.pid,c.image,c.quantity,c.sid,c.price,c.orderdatetime,c.datetime,p.pname from cancelledorders c, product p where p.pid=c.pid and c.uid=?");
                        ps.setString(1, gid);
                        rs = ps.executeQuery();
                %>
                <table class="tables">
                    <h1 style="color: #1d67b1;padding:12px 0 12px 0; margin-bottom:0">Your Cancelled Orders</h1>
                    <tr>
                        <th>Sr. No.</th>
                        <th>Order ID</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Seller ID</th>
                        <th>Order Date and Time</th>
                        <th>Cancelled Date and Time</th>
                    </tr>
                    <%while (rs.next()) {
                    %>

                    <tr>
                        <td><%=flag++ %></td>
                        <td><%=rs.getInt("oid")%></td>
                        <td><%=rs.getString("pid")%></td>
                        <td><%=rs.getString("pname")%></td>
                        <td><img src="Prod_Images/<%=rs.getString("image")%>" width="100" height="100"></td>
                        <td>Rs. <%=rs.getInt("price")%></td>
                        <td><%=rs.getInt("quantity")%></td>
                        <td><%=rs.getString("sid")%></td>
                        <td><%=rs.getTimestamp("orderdatetime")%></td>
                        <td><%=rs.getTimestamp("datetime")%></td>
                    </tr><tr></tr>

                    <%
                        }
                    %>
                </table>
            </div>
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
