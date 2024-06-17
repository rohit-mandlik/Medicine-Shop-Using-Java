<%-- 
    Document   : userFeedback_1
    Created on : 10-May-2023, 9:00:15 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="java.lang.Object.*" %>
    <%
        HttpSession httpSession = request.getSession();
        String guid = (String) httpSession.getAttribute("currentuser");

        String name = request.getParameter("nm");
        String eid = request.getParameter("eid");
        String contact = request.getParameter("mbn");
        String feedback = request.getParameter("fb");

        String query1 = "insert into feedback(uid,name,eid,contact,feedback) values (?,?,?,?,?)";

        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement ps1 = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
            ps1 = conn.prepareStatement(query1);
            ps1.setString(1, guid);
            ps1.setString(2, name);
            ps1.setString(3, eid);
            ps1.setString(4, contact);
            ps1.setString(5, feedback);
            int i = ps1.executeUpdate();

            response.sendRedirect("ThanksForFeedback.jsp");

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
                if (ps1 != null) {
                    ps1.close();
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
