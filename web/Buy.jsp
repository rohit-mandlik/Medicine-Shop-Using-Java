<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Buy</title>
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/Buy.css">
        <style>
            .well{
                margin-bottom: 0%;
            }
        </style>
    </head>
    <body>
        <% HttpSession httpSession = request.getSession();
            String uid = (String) httpSession.getAttribute("currentuser");
            String r1 = null;
            r1 = request.getParameter("pname");
            if (uid != null) {
        %>
        <%@include file="UserNavbar.jsp" %>
        <%
        } else {
        %>
        <%@include file="Home_Navbar.jsp" %>
        <%
            }
        %>
        <form action="Buy.jsp" method="post">
            <div class="well" style=" background-color: greenyellow;">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <%
                            if (r1 == null) {
                        %>
                        <input type="text" name="pname" class="form-control" placeholder="Medicine Name">
                        <%
                        } else {
                        %>
                        <input type="text" value="<%= r1%>" name="pname" class="form-control" placeholder="Medicine Name">
                        <%
                            }
                        %>
                    </div>
                    <div class="col-sm-2">
                        <input type="submit" name="btn" value="Search" class="btn btn-primary">
                    </div>
                </div>
            </div>
        </form>

        <div class="active">
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.sql.*" %>

            <%  int flag = 0;
                ResultSet rs = null;
                PreparedStatement ps = null;
                java.sql.Connection conn = null;

                String query = "";

                String event = request.getParameter("btn");
                String pname = request.getParameter("pname");

                if (event != null) {
                    query = "select p.pname,p.image,p.pid,p.manufacturer,p.mfg,p.price,i.quantity from product p,inventory i where p.pid=i.pid and p.pname LIKE '%" + pname.toString() + "%' order by p.pname";
                } else {
                    query = "select p.pname,p.image,p.pid,p.manufacturer,p.mfg,p.price,i.quantity from product p,inventory i where p.pid=i.pid order by p.pname";
                }
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();
            %><div class="filler2"></div>
            <div class="block">
                <%
                    if (rs == null) {
                %>
                <h1>hdhkdhg</h1>
                <%
                    }
                    while (rs.next()) { 
                        if (flag == 4) {
                            flag = 1;
                %></div><div class="filler2"></div><%
                    } else
                        flag++;
                %>
            <div class="row">
                <div class="column">
                    <div class="card">
                        <form action="ViewProduct.jsp" method="post">
                            <button style="background-color: white; color:black">
                                <img src="Prod_Images/<%=rs.getString("image")%>" width=180 height=200>
                                <h4><%=rs.getString("pname")%></h4>
                                <h5><b>Price: </b>Rs. <%=rs.getFloat("price")%></h5>
                                <%
                                    if (rs.getInt("quantity") >= 0) {
                                %>
                                <form action="ViewProduct.jsp" method="post">
                                    <input type="hidden" name="pid" value="<%=rs.getString("pid")%>">
                                    <p></p>
                                    <button style="background-color: orange">View</button></form></div>
                                    <%
                                    } else {
                                    %>
                            </button></form></div>
                            <%
                                }
                            %>
                </div>
                <%
                    }
                %>
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
