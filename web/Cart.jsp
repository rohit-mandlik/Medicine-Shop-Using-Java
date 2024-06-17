<%-- 
    Document   : Cart
    Created on : 20-May-2023, 9:02:31 am
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    PreparedStatement ps = null;
                    java.sql.Connection conn = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                        ps = conn.prepareStatement("select c.pid, c.sid,c.uid,c.quantity,c.price,c.image,p.pname from cart c,product p where p.pid=c.pid and uid=?");
                        ps.setString(1, gid);
                        rs = ps.executeQuery();
                %>
                
                <table class="tables">
                    <h1 style="color: #1d67b1;padding:12px 0 12px 0; margin-bottom:0">My Cart</h1>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Seller ID</th>
                        <th>Action</th>
                    </tr>
                    <%while (rs.next()) {
                    %>

                    <tr>
                    <form action="AddressForm1.jsp" method="post">
                        <td><%=rs.getString("pid")%>
                            <input type="hidden" name="pid" value="<%=rs.getString("pid")%>"></td>
                        <td><%=rs.getString("pname")%>
                        </td>
                        <td><img src="Prod_Images/<%=rs.getString("image")%>" width="100" height="100"></td>
                        <td>Rs. <%=rs.getInt("price")%></td>
                        <td><%=rs.getInt("quantity")%>
                            <input type="hidden" name="orderquantity" value="<%=rs.getInt("quantity")%>">
                        </td>
                        <td><%=rs.getString("sid")%></td>
                        <td>
                            <input style="background-color: green" type="submit" value="Order" name="Buy" />
                        </td>
                    </form>
                    </tr>
                    <tr></tr>

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
                    if (ps != null) {
                        ps.close();
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
