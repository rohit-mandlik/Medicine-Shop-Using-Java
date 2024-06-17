<%-- 
    Document   : SellerCancelledOrders
    Created on : 20-May-2023, 2:12:41 pm
    Author     : Dell
--%>

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
                    java.sql.Connection conn = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                        PreparedStatement ps = conn.prepareStatement("select o.oid, o.pid, o.sid, o.uid, o.orderdatetime,o.datetime, o.quantity,o.price,o.image,c.fname, c.lname,p.pname from cancelledorders o, customer c,product p where o.uid=c.uid and o.pid=p.pid and sid=?");
                        ps.setString(1, gid);
                        rs = ps.executeQuery();
                %>
                <table class="tables">
                    <h1 style="color: #1d67b1;padding:12px 0 12px 0; margin-bottom:0">Cancelled Orders</h1>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Order Date and Time</th>
                        <th>Cancelled Date and Time</th>
                    </tr>
                    <%while (rs.next()) {
                    %>

                    <tr>
                        <td><%=rs.getInt("oid")%></td>
                        <td><%=rs.getString("uid")%></td>
                         <td><%=rs.getString("fname")%> <%=rs.getString("lname")%></td>
                        <td><%=rs.getString("pid")%></td>
                        <td><%=rs.getString("pname")%></td>
                        <td><img src="Prod_Images/<%=rs.getString("image")%>" width="100" height="100"></td>
                        <td>Rs. <%=rs.getInt("price")%></td>
                        <td><%=rs.getInt("quantity")%></td>
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
                    if (conn != null) {
                        conn.close();
                    }
                } catch (Exception e) {
                };
            }
        %>
    </body>
</html>
