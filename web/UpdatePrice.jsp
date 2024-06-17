<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <script>
            window.onload = function () {
                alert('Price Updated Successfully');
                window.location.href = 'AddInventory.jsp';
            };
        </script>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
            float pr = Float.parseFloat(request.getParameter("price"));
            String prod = request.getParameter("pid");
            HttpSession httpSession = request.getSession();
            String guid = (String)httpSession.getAttribute("currentuser");
            ResultSet rs = null;
            Connection conn = null;
            PreparedStatement ps = null;
            String query = "update product set price=? where pid=?";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                ps = conn.prepareStatement(query);
                ps.setFloat(1, pr);
                ps.setString(2, prod);
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