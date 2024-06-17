<%-- 
    Document   : Payment1
    Created on : 09-May-2023, 4:38:53 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Payment Method</title>
        <link rel="stylesheet" href="bootstrap.css"><!--  -->
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/AddProduct.css">
        <style>

            .body{
                height:100%
            }
            .active{
                width:100%;
                height:100%
            }
            .bigcard{
                width:30%;
                margin-left:60%;
                margin-right:10%;
                margin-top:10%;
                background-color: blanchedalmond;
                position:absolute;
            }
            .bigcard input[type="radio"]{
                margin-left:20%;
                width: 2.5em;
                height: 1em;

            }

            .bigcard label{
                font-size: 20px;
                color:black;
            }
            .bigcard input[type="submit"] {
                height: 35px;
                width: 80%;
                margin-left: 10%;
                margin-bottom: 3%;
                box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.2);
                border-radius:5px;
                background-color: #0ca1a6;
                color: white;
                border:1px solid #0ca1a6;
                -webkit-transition-duration: 0.4s;
                transition-duration: 0.4s;
            }
            .bigcard input[type="submit"]:hover{
                background-color: #4CAF50;
                border:1px solid #4CAF50;
                color: white;
            }

        </style>
    </head>
    <body>
        <%@include file="UserNavbar.jsp" %>
        <div class="active">

            <form action="Payment.jsp" method="post">
                <div class="bigcard">
                    <br>
                    <h2 style="text-align: center;">Select Payment Method</h2><br>
                    <input type='radio' name='rd' value="Credit/Debit" class="big" required><label>Credit / Debit </label><br><br>
                    <input type='radio' name='rd' value="Cash On Delevery" class="big" required><label>Cash On Delivery</label>
                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p><br><br>
                    <input type="submit" name="btnselect" value="Done">
                    </form>
                    <form action="Payment.jsp" method="post">
                        <input type="submit" name="btnselect" value="Cancel">
                        </div>
                    </form>
                </div>
                </body>
                </html>