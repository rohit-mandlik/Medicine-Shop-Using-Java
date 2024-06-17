<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <script>
            window.onload = function() {
                alert('Dates Updated Successfully');
                window.location.href = 'AddInventory.jsp';
            };
        </script>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
            String mdate = request.getParameter("mdate");
            String edate = request.getParameter("edate");
            String prod = request.getParameter("pid");
            HttpSession httpSession = request.getSession();
            String guid = (String) httpSession.getAttribute("currentuser");
            ResultSet rs = null;
            Connection conn = null;
            PreparedStatement ps = null;
            String query = "UPDATE product SET mfg=?, exp=? WHERE pid=?";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                ps = conn.prepareStatement(query);
                ps.setString(1, mdate);
                ps.setString(2, edate);
                ps.setString(3, prod);
                int i = ps.executeUpdate();
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
