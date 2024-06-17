<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Orders</title>
        <link rel="stylesheet" href="bootstrap.css">
        <link rel="stylesheet" href="css/Orders.css">
        <style>
            /* Custom CSS for Orders page */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }

            .main {
                max-width: 100%;
                margin: 0 auto;
                padding: 20px;
            }

            .active {
                background-color: #fff;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .order {
                display: flex;
                align-items: center;
                padding: 10px;
                margin-bottom: 10px;
                background-color: #f2f2f2;
                border-radius: 5px;
            }

            .order img {
                width: 80px;
                height: 80px;
                margin-right: 20px;
            }

            .order-info {
                width:20%;
                padding-right:10px;
            }

            .order-info h2 {
                margin: 0;
                font-size: 18px;
            }

            .order-info p {
                margin: 5px 0;
                font-size: 14px;
                color: black;
            }

            .order-info .actions {
                margin-top: 10px;
            }

            .order-info .actions button {
                padding: 5px 10px;
                background-color: #1d67b1;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .order-info .actions button:hover {
                background-color: #14467a;
            }

            .filler {
                height: 20px;
            }
        </style>
    </head>
    <body><%@include file="UserNavbar.jsp" %>
        <div class="main">


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
                    ResultSet rs1 = null;
                    PreparedStatement ps1 = null;
                    java.sql.Connection conn1 = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                        ps = conn.prepareStatement("select o.oid, o.pid, o.image, o.sid, o.price, o.quantity, o.pmethod, o.orderdatetime, p.pname from orders o, product p where o.pid=p.pid and uid=?");
                        ps.setString(1, gid);
                        rs = ps.executeQuery();
                %>

                <div class="orders">
                    <h1 style="color: blue">Your Orders</h1>
                    <%while (rs.next()) {

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                                ps1 = conn1.prepareStatement("select* from address where oid=?");
                                ps1.setInt(1, rs.getInt("oid"));
                                rs1 = ps1.executeQuery();
                                while (rs1.next()) {

                    %>
                    <div class="order">

                        <div style="width: 10%" class="order-info">
                            <img src="Prod_Images/<%=rs.getString("image")%>">
                        </div>

                        <div class="order-info">
                            <p>Product Name: <%=rs.getString("pname")%></p>
                            <p>Quantity: <%=rs.getInt("quantity")%></p>
                            <p>Price: Rs. <%=rs.getInt("price")%></p>
                        </div>


                        <div class="order-info">
                            <h2><%=rs1.getString("name")%></h2>
                            <p><%=rs1.getString("radd")%>, <%=rs1.getString("city")%>, <%=rs1.getString("state")%>, <%=rs1.getString("pin")%></p>
                        </div>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("error: " + e);
                            } finally {
                                try {
                                    if (rs1 != null) {
                                        rs1.close();
                                    }
                                } catch (Exception e) {
                                };
                                try {
                                    if (ps1 != null) {
                                        ps1.close();
                                    }
                                } catch (Exception e) {
                                };
                                try {
                                    if (conn1 != null) {
                                        conn1.close();
                                    }
                                } catch (Exception e) {
                                };
                            }
                        %>
                        <div class="order-info">
                            <p>Price: Rs. <%=rs.getInt("price")%></p>
                            <p>Discount: Rs. 0</p>
                            <p>Delevery Charges: Free</p>
                        </div>

                        <div class="order-info">
                            <p>Total Ammount: Rs. <%=rs.getInt("price")%></p>
                            <p>Payment Method: <%=rs.getString("pmethod")%></p>
                        </div>

                        <div style="width: 10%" class="order-info">
                            <div class="actions">
                                <form action="CancelOrder" method="post">
                                    <input type="hidden" name="oid" value="<%=rs.getInt("oid")%>">
                                    <input type="hidden" name="pid" value="<%=rs.getString("pid")%>">
                                    <input type="hidden" name="quantity" value="<%=rs.getInt("quantity")%>">
                                    <button type="submit">Cancel Order</button>
                                </form>
                            </div>
                        </div>

                    </div>
                    <%}%>
                </div>
            </div>
        </div>

        <%} catch (Exception e) {
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
