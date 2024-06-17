<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Home Page</title>
        <link rel="stylesheet" href="css/Homepage.css">
        <style>html {
  font-family: sans-serif;
  -webkit-text-size-adjust: 100%;
      -ms-text-size-adjust: 100%;
}</style>
    </head>
    <body>
        <%@include file="UserNavbar.jsp" %>
        <div class="active">
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.sql.*" %>

            <%
                HttpSession httpSession = request.getSession();
                String guid = (String) httpSession.getAttribute("currentuser");
            %>

            

            <%
                ResultSet rs = null;
                PreparedStatement ps = null;
                java.sql.Connection conn = null;
                String query = "select fname, lname,uid,address,phno,email from customer where uid=?";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    ps = conn.prepareStatement(query);
                    ps.setString(1, guid);
                    rs = ps.executeQuery();
                    if (rs.next()) {

            %>
            <div class="filler2"></div>
            <div class="card">
                <img src="images/User.png" class="Avatar" width=234 height=234>
                <div class="container">
                    <div class="space1"><b><%=rs.getString("fname")%> <%=rs.getString("Lname")%></b></div>
                    <div class="filler3"></div>
                    <div class="space"><b>ID: </b><%=rs.getString("uid")%></div>
                    <div class="space"><b>Address: </b><%=rs.getString("address")%></div>
                    <div class="space"><b>Phone: </b><%=rs.getString("phno")%></div>
                    <div class="space"><b>Email: </b><%=rs.getString("email")%></div>
                </div>
            </div>
            <%

                    }
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

        </div>
    </body>
</html>
