<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>ReStock</title>
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/Buy.css">

    </head>
    <body>
        <%@include file="AdminNavbar.jsp" %>
        <form action="AddInventory.jsp" method="post">
            <div class="well" style=" background-color: greenyellow;">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <input type="text" name="pname" class="form-control" placeholder="Medicine Name">
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
                String guid = (String) httpSession.getAttribute("currentuser");
            %>

            <%
                int flag = 0;
                ResultSet rs = null;
                PreparedStatement ps = null;
                java.sql.Connection conn = null;

                String query = "";

                String event = request.getParameter("btn");
                String pname = request.getParameter("pname");

                if (event == null) {
                    query = "select p.pid,i.quantity,p.pname,p.image,p.manufacturer,p.mfg,p.exp,p.price from product p,inventory i where p.pid=i.pid and i.sid=? order by p.pname";
                } else {
                    query = "select p.pid,i.quantity,p.pname,p.image,p.manufacturer,p.mfg,p.exp,p.price from product p,inventory i where p.pid=i.pid and i.sid=? and p.pname LIKE '%" + pname.toString() + "%' order by p.pname";
                }

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                    ps = conn.prepareStatement(query);
                    ps.setString(1, guid);
                    rs = ps.executeQuery();
            %>
            <div class="block">
                <%
                    while (rs.next()) {
                        if (flag == 4) {
                            flag = 1;
                %>
            </div>
            <%
                } else
                    flag++;
            %>
            <div class="row">
                <div class="column">
                    <div class="card" style="margin-bottom: 30px">

                        <img src="Prod_Images/<%=rs.getString("image")%>" width=180 height=200>
                        <h4><%=rs.getString("pname")%></h4>
                        <p><b>ID: </b><%=rs.getString("pid")%></p>
                        <p><b>Manufacturer: </b><%=rs.getString("manufacturer")%></p>
                        <p><b>Mfg: </b><%=rs.getString("mfg")%></p>
                        <p><b>Exp: </b><%=rs.getString("exp")%></p>
                        <p><b>Stock: </b><%=rs.getInt("quantity")%></p>
                        <p><b>Price: </b><%=rs.getString("price")%></p>

                        <p style="background-color: #c7254e; margin-bottom: 4px"></p>

                        <form action="UpdateInventory.jsp" method="post">
                            <p><input type="text" name="restock" placeholder="quantity" onkeypress="return event.charCode >= 48 && event.charCode <= 57" required></p>
                            <p></p>
                            <input type="hidden" name="pid" value="<%=rs.getString("pid")%>" >
                            <p><button Style="width: 90%; border-radius: 30px">ReStock</button></p>
                        </form>

                        <p style="background-color: #c7254e; margin-bottom: 4px"></p>

                        <form action="UpdateDates1.jsp" method="post">
                            <p><b>New Mfg Date: </b><input type="date" name="mdate" onkeypress="return event.charCode >= 48 && event.charCode <= 57 || event.charCode == 45" required></p>
                            <p><b>New Exp Date: </b><input type="date" name="edate" onkeypress="return event.charCode >= 48 && event.charCode <= 57 || event.charCode == 45" required></p>
                            <p></p>
                            <input type="hidden" name="pid" value="<%=rs.getString("pid")%>" >
                            <p><button Style="width: 90%; border-radius: 30px">Update Dates</button></p>
                        </form>

                        <p style="background-color: #c7254e; margin-bottom: 4px"></p>

                        <form action="UpdatePrice.jsp" method="post">
                            <input type="hidden" name="pid" value="<%=rs.getString("pid")%>" >
                            <p><input type="text" name="price" placeholder="Price" required></p>
                            <p></p>
                            <p><button Style="width: 90%; border-radius: 30px">Update Price</button></p>
                        </form>

                    <p style="background-color: #c7254e; margin-bottom: 4px"></p>

                    <form action="DeleteProduct" method="post">
                        <input type="hidden" name="pid" value="<%=rs.getString("pid")%>" >
                        <p></p>
                        <p><button Style="width: 90%; border-radius: 30px">Delete Product</button></p>
                    </form>
                </div>
            </div>
            <%
                }
            %>
        </div>
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
