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
                    PreparedStatement ps = null;
                    java.sql.Connection conn = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                        ps = conn.prepareStatement("select o.oid, o.pid, o.image, o.sid, o.price, o.quantity, o.pmethod, o.orderdatetime, p.pname, a.name, a.city, a.state, a.radd, a.pin from orders o, product p, address a where o.pid=p.pid and a.oid=o.oid and uid=?");
                        ps.setString(1, gid);
                        rs = ps.executeQuery();
                %>

                <table class="tables">
                    <tr>
                        <th style="text-align: center; font-size: 30px">Orders</th>
                    </tr>
                    <%while (rs.next()) {
                    %>

                    <tr>
                        <td>
                            <table style="Border:none; text-align: center">
                                <tr>
                                    <td style="width:25%;Border:none; text-align: center">
                                        <form action="CancelOrder" method="post">
                                            <input type="hidden" name="oid" value="<%=rs.getString("name")%>">
                                            <p><b><%=rs.getString("name")%></b></p>
                                            <p><%=rs.getString("radd")%>,<%=rs.getString("city")%>,</p>
                                            <p><%=rs.getString("state")%>,<%=rs.getInt("pin")%></p>
                                            <p><input type="submit" value="Change Shipping Address" name="btnaddress" /></p>
                                        </form>
                                    </td>
                                    <td style="width:25%; text-align: center">
                                        <form action="CancelOrder" method="post">
                                            <p><b><%=rs.getString("pname")%></b></p>
                                            <p><b>Quantity : </b><%=rs.getInt("quantity")%></p>
                                            <p><b>Rate : </b>Rs. <%=rs.getDouble("price") / rs.getInt("quantity")%></p>
                                        </form>
                                    </td>
                                    
                                    <td style="width:20%; text-align: center"><img src="Prod_Images/<%=rs.getString("image")%>" style="width:90%;height:90%"></td><!-- comment -->
                                    <td style="width:20%; text-align: center">
                                        <p style="text-align:center; font-size:20px">Price Details</p>
                                        <p><b>Price : </b>Rs. <%=rs.getDouble("price")%></p>
                                        <p><b>Discount : </b>0</p>
                                        <p><b>Delivery Charges : </b>Free</p>
                                        <p><b>Price : </b>Rs. <%=rs.getDouble("price")%></p>
                                    </td>
                                    
                                    <td style="width:20%; text-align: center">
                                        <form action="CancelOrder" method="post">
                                            <input type="hidden" name="oid" value="<%=rs.getInt("oid")%>">
                                            <input type="hidden" name="pid" value="<%=rs.getString("pid")%>">
                                            <input type="hidden" name="quantity" value="<%=rs.getInt("quantity")%>">
                                            <p><input type="submit" style="width:100%; height:90%;" value="Cancel Order" name="btncancel" /></p>
                                        </form>
                                    </td>

                                </tr>
                            </table>   
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr><td>...</td></tr>
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
