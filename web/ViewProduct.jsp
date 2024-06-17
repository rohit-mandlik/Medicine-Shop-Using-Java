<%-- 
    Document   : ViewProduct
    Created on : 11-May-2023, 4:59:50 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product</title>
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/Buy.css">
        <Style>
            body{
                background-image: url("images/bg3.jpg");
            }
            h2{
                text-align: center;
                padding: 20px 0 0 0;
                color: black;
                width:80%;
                margin-left:10%;
                margin-right: 10%;
                margin-bottom: 0;
                background-color: white;
            }
            .slider {
                height:60%;
                position: relative;
                left: 60%; /* Adjust the percentage as needed */
                transform: translateX(-50%);
            }

            .slider-container {
                width: 100%;
                max-width: 800px; /* Adjust the maximum width as needed */
                margin: 0 auto;
                overflow: hidden;
                white-space: nowrap;
                margin-bottom: 10%;
                margin-top: 10%
            }

            .slider-container img {
                width: 400px;
                height: 400px;
                display: inline-block;
            }

            .slider-arrows {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                left: 10px;
                right: 10px;
                z-index: 3;
            }

            .slider-arrows span {
                display: inline-block;
                font-size: 30px;
                color: #000;
                cursor: pointer;
                padding: 10px;
                background-color: rgba(255, 255, 255, 0.7);
                border-radius: 50%;
                margin: 0 5px;
            }

            .slider-arrows span:hover {
                background-color: rgba(74, 5, 247, 0.9);
            }

            .card {
                width:100%;
                height:auto;
                margin: auto;
                text-align: center;
                font-family: sans-serif;
                background-color: whitesmoke;
            }

            .card p{
                padding: 0;
                padding-bottom: 10px;
                margin:0;
                background-color: #f7e1b5;
            }

            .input{
                border: 1px solid #808080;
                border-radius:3px;
                background-color: white;
                text-align: center;
                color:black;
                width: 40%;
            }

            .card input[type=number]::-webkit-inner-spin-button,
            .card input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
            }

            .button {
                border: none;
                outline: 0;
                padding: 12px;
                color: white;
                background-color: black;
                text-align: center;
                width:40%;
                cursor: pointer;
                font-size: 18px;
            }

            .button:hover {
                opacity: 0.7;
            }

            .card:hover{
                box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.3);
            }




        </style>
    </head>
    <body>
        <% HttpSession httpSession = request.getSession();
            String uid = (String) httpSession.getAttribute("currentuser");
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

        <script>
            function validateForm() {
                var uid = "<%= uid%>"; // Get the value of uid from the server-side code

                if (uid === null || uid.trim() === "") {
                    alert("Please Login"); // Show the alert message
                    return false; // Prevent form submission
                }
            }
        </script>

        <%
            int flag = 0;
            ResultSet rs = null;
            PreparedStatement ps = null;
            java.sql.Connection conn = null;

            String query = "";

            query = "select p.pname,p.image,p.image1,p.image2,p.pid,p.manufacturer,p.mfg,p.exp,p.price,i.quantity from product p,inventory i where p.pid=i.pid and p.pid=?";
            String pid = request.getParameter("pid");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                ps = conn.prepareStatement(query);
                ps.setString(1, pid);
                rs = ps.executeQuery();
        %>
        <%
            while (rs.next()) {
                if (flag == 4) {
                    flag = 1;
        %><%
            } else
                flag++;
        %>

        <table style="width:80%; background-color: white;margin-top:0;margin-right:10;margin-left:10%">
            <h2><%=rs.getString("pname")%></h2>
            <tr style="width:100%">
                <td style="width:50%; margin-right:50%">
                    <div class="slider">
                        <div class="slider-container">
                            <img src="Prod_Images/<%=rs.getString("image")%>" alt="Image 1">
                            <img src="Prod_Images/<%=rs.getString("image1")%>" alt="Image 2">
                            <img src="Prod_Images/<%=rs.getString("image2")%>" alt="Image 3">
                            <!-- Add more images as needed -->
                        </div>
                        <div class="slider-arrows">
                            <span class="prev-arrow">&lt;</span>
                        </div>
                        <div style="margin-left: 65%" class="slider-arrows">
                            <span class="next-arrow">&gt;</span>
                        </div>
                    </div>
                </td>
                <td style="width:50%; margin-left:50%; font-size: 20px;text-align: left;">
                    <p style="color: mediumblue" ><b style="color:purple">Product ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </b><%=rs.getString("pid")%></p>
                    <p style="color: mediumblue" ><b style="color:purple">Manufacturer &nbsp;: </b><%=rs.getString("manufacturer")%></p>
                    <p style="color: mediumblue" ><b style="color:purple">Mfg Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b> <%=rs.getDate("mfg")%></p>
                    <p style="color: mediumblue" ><b style="color:purple">Expiry Date &nbsp;&nbsp;&nbsp;&nbsp;: </b><%=rs.getDate("exp")%></p>
                    <p style="color: mediumblue" ><b style="color:purple">Stock &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </b><%=rs.getInt("quantity")%></p>
                    <p style="color: mediumblue" ><b style="color:purple">Price &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </b>Rs. <%=rs.getFloat("price")%></p>
                    <%
                        if (rs.getInt("quantity") > 0) {
                            int r = rs.getInt("quantity");
                    %>
                    <form action="AddressForm1.jsp" method="post" onsubmit="return validateForm();">
                        <p style="color: mediumblue" ><b style="color:purple">Enter Quantity :</b><input class="input" type="number" name="orderquantity" onkeypress="return event.charCode >= 48 && event.charCode <= 57" oninput="validateInput(this, <%=r%>)" placeholder="Enter quantity" min="1" max="<%=r%>" required></p>

                        <input type="hidden" name="pid" value="<%=rs.getString("pid")%>">

                        <p></p>
                        <input style="color: yellow" class="button" type="submit" name="Buy" value="Buy">
                        <input style="color: yellow" class="button" type="submit" name="Buy" value="Add To Cart">
                        </br></br><a href="userFeedback.jsp">Click here to give your feedback</a>
                    </form>
                    <%
                    } else {
                    %>
                    <button style="color: yellow;background-color: orangered; width:70%" class="button">Temporarily Unavailable</button>
                    </br></br><a href="userFeedback.jsp">Click here to give your feedback</a>
                </td>
            </tr>
        </table>
        <%
            }
        %>

        <%
            }
        %>

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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="css/Slider.js" type="text/javascript"></script>

        <script>
                            $(document).ready(function () {
                                var slideIndex = 0;
                                var images = $('.slider-container img');

                                function showSlide(n) {
                                    slideIndex = n;
                                    if (slideIndex < 0) {
                                        slideIndex = images.length - 1;
                                    } else if (slideIndex >= images.length) {
                                        slideIndex = 0;
                                    }

                                    images.hide();
                                    images.eq(slideIndex).show();
                                }

                                function nextSlide() {
                                    showSlide(slideIndex + 1);
                                }

                                function prevSlide() {
                                    showSlide(slideIndex - 1);
                                }

                                $('.next-arrow').click(function () {
                                    nextSlide();
                                });

                                $('.prev-arrow').click(function () {
                                    prevSlide();
                                });

                                showSlide(slideIndex);
                            });

                            function validateInput(input, maxQuantity) {
                                if (input.value < 0 || input.value > maxQuantity) {
                                    input.setCustomValidity(`Please Enter Orderable Quantity`);
                                } else {
                                    input.setCustomValidity('');
                                }
                            }

        </script>
    </body>
</html>
