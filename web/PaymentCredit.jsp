<%-- 
    Document   : PaymentCredit
    Created on : 10-May-2023, 4:32:34 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
            HttpSession httpSession = request.getSession();
            String event = request.getParameter("btnselect");

            if (event.equals("Cancel")) {
                out.println("alert('Order Cancelled');");
                response.sendRedirect("Buy.jsp");
            } else {
                long cn = Long.parseLong(request.getParameter("card-number"));
                String chn = request.getParameter("card-name");
                String exp = request.getParameter("expiry-date");
                int cvv = Integer.parseInt(request.getParameter("cvv"));

                String pmethod = "Card Payment";

                String aname = (String) httpSession.getAttribute("aname");
                String amail = (String) httpSession.getAttribute("amail");
                String acontact = (String) httpSession.getAttribute("acontact");
                String apincode = (String) httpSession.getAttribute("apincode");
                String acity = (String) httpSession.getAttribute("acity");
                String astate = (String) httpSession.getAttribute("astate");
                String araddress = (String) httpSession.getAttribute("araddress");
                String guid = (String) httpSession.getAttribute("currentuser");

                int qr = (Integer) httpSession.getAttribute("orderquantity");
                String pid = (String) httpSession.getAttribute("pid");

                Connection conn = null;
                ResultSet rs = null;
                ResultSet rs1 = null;
                PreparedStatement ps = null;
                PreparedStatement ps1 = null;
                PreparedStatement ps2 = null;
                PreparedStatement ps3 = null;
                PreparedStatement ps4 = null;
                PreparedStatement ps5 = null;
                String a, im, b;
                int c, d;
                
                String query1 = "select P.pid,O.sid,P.price,p.image from inventory o,product p where p.pid=? and p.pid=o.pid";
                String query2 = "insert into orders(pid,sid,uid,quantity,price,pmethod,image) values(?,?,?,?,?,?,?)";
                String query3 = "select max(oid) as oid from orders";
                String query4 = "insert into address(name,email,mob,pin,city,state,radd,username,oid)values(?,?,?,?,?,?,?,?,?)";
                String query5 = "insert into payment(oid,cardno,chname,expdate,cvv) values(?,?,?,?,?)";
                String query6 = "delete from cart where pid=?";

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    ps = conn.prepareStatement(query1);
                    ps.setString(1, pid);
                    rs = ps.executeQuery();
                    
                    ps5 = conn.prepareStatement(query6);
                        ps5.setString(1, pid);
                        int q = ps5.executeUpdate();

                    if (rs.next()) {
                        a = rs.getString("pid");
                        b = rs.getString("sid");
                        c = rs.getInt("price");
                        im=rs.getString("image");

                        ps2 = conn.prepareStatement(query2);
                        ps2.setString(1, a);
                        ps2.setString(2, b);
                        ps2.setString(3, guid);
                        ps2.setInt(4, qr);
                        ps2.setInt(5, qr * c);
                        ps2.setString(6, pmethod);
                        ps2.setString(7, im);
                        int i = ps2.executeUpdate();
                    }

                    ps1 = conn.prepareStatement(query3);
                    rs1 = ps1.executeQuery();

                    if (rs1.next()) {
                        d = rs1.getInt("oid");

                        ps3 = conn.prepareStatement(query4);
                        ps3.setString(1, aname);
                        ps3.setString(2, amail);
                        ps3.setString(3, acontact);
                        ps3.setString(4, apincode);
                        ps3.setString(5, acity);
                        ps3.setString(6, astate);
                        ps3.setString(7, araddress);
                        ps3.setString(8, guid);
                        ps3.setInt(9, d);
                        int j = ps3.executeUpdate();
                        
                        ps4 = conn.prepareStatement(query5);
                        ps4.setInt(1, d);
                        ps4.setLong(2, cn);
                        ps4.setString(3, chn);
                        ps4.setString(4, exp);
                        ps4.setInt(5, cvv);
                        int k = ps4.executeUpdate();
                        
                        response.sendRedirect("Orders.jsp");
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
                    };
                }
            }

        %>
    </body>
</html>