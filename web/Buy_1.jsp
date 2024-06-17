<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Buy</title>
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/Buy.css">
        <style>.well
            {
                margin-left: 0%;
                margin-right: 0%;

            }</style>
    </head>
    <body>
        <%@include file="UserNavbar.jsp" %>
        <form action="Buy.jsp" method="post">
            <div class="well" style=" background-color: greenyellow;">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <input type="text" name="pname" class="form-control" placeholder="Pet Name">
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
            <%
                HttpSession httpSession = request.getSession();
                String uid = (String) httpSession.getAttribute("currentuser");
            %>

            

            <%
                int flag = 0;
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
                        <img style="padding: 0 0 0 0 ;" src="Prod_Images/<%=rs.getString("image")%>" width=180 height=200>
                        <h4><%=rs.getString("pname")%></h4>
                        <p><b>ID: </b><%=rs.getString("pid")%></p>
                        <p><b>Manufacturer: </b><%=rs.getString("manufacturer")%></p>
                        <p><b>Mfg Date: </b><%=rs.getDate("mfg")%></p>
                        <p><b>Stock: </b><%=rs.getInt("quantity")%></p>
                        <p><b>Price: </b><%=rs.getInt("price")%></p>
                        <%if (rs.getInt("quantity") > 0) {
                        %>
                        <form action="PlaceOrder.jsp" method="post">
                            <input type="number" name="orderquantity" onkeypress="return event.charCode >= 48 && event.charCode <= 57" placeholder="Enter quantity" max="<%=rs.getInt("quantity")%>" required >
                            <input type="hidden" name="pid" value="<%=rs.getString("pid")%>">
                            <p></p>
                            <button>Buy</button></form></div>
                            <%
                            } else {
                            %>

                    <button>Out Of Stock</button></div>
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
