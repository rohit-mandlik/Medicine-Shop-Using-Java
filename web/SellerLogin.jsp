<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Login</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
            String uid1 = request.getParameter("userid");
            String pass1 = request.getParameter("password");

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("currentuser", uid1);

            ResultSet rs = null;
            Connection conn = null;
            PreparedStatement ps = null;

            String query2 = "SELECT sid,pass from Seller WHERE sid=?";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                ps = conn.prepareStatement(query2);
                ps.setString(1, uid1);

                rs = ps.executeQuery();
                if (rs.next()) {
                    if ((rs.getString(2)).equals(pass1)) {
                        response.sendRedirect("SellerHomepage.jsp");
                    } else {
                        response.sendRedirect("SellerLoginError1.html");
                    }
                } else {
                    response.sendRedirect("SellerLoginError2.html");
                }
            } catch (Exception e) {
                out.println(e);
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