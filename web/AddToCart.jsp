<%-- 
    Document   : AddToCart
    Created on : 08-May-2023, 5:36:35 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
                HttpSession httpSession = request.getSession();
                String guid = (String) httpSession.getAttribute("currentuser");
                int qr = (Integer) httpSession.getAttribute("orderquantity");
                String pid = (String) httpSession.getAttribute("pid");

                Connection conn = null;
                ResultSet rs = null;
                PreparedStatement ps = null;
                PreparedStatement ps2 = null;
                String a, b, im;
                int c;

                String query1 = "select P.pid,O.sid,P.price,P.image from inventory o,product p where p.pid=? and p.pid=o.pid";
                String query2 = "insert into cart (pid,sid,uid,quantity,price,image) values(?,?,?,?,?,?)";

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    ps = conn.prepareStatement(query1);
                    ps.setString(1, pid);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        a = rs.getString("pid");
                        b = rs.getString("sid");
                        c = rs.getInt("price");
                        im = rs.getString("image");

                        ps2 = conn.prepareStatement(query2);
                        ps2.setString(1, a);
                        ps2.setString(2, b);
                        ps2.setString(3, guid);
                        ps2.setInt(4, qr);
                        ps2.setInt(5, qr * c);
                        ps2.setString(6, im);
                        int i = ps2.executeUpdate();
                        response.sendRedirect("Cart.jsp");
                    }
                } catch (Exception E) {
                    out.println(E);
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
                        if (ps2 != null) {
                            ps2.close();
                        }
                    } catch (Exception e) {
                    };
                    try {
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception e) {
                    }
                }
        %>
    </body>
</html>
