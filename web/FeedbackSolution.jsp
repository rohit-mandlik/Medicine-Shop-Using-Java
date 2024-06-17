<%-- 
    Document   : userFeedback
    Created on : 10-May-2023, 8:33:29 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Payment Method</title>
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="css/AddProduct.css">
        <style>
            .active{
                width:100%;
                height:100%
            }
            .bigcard{
                width:40%;
                margin-left:50%;
                margin-right:10%;
                margin-top:1%;
                background-color: blanchedalmond;
            }
            .bigcard input[type="text"]
            {
                position:relative;
                width: 80%;
                margin-left: 10%;
                box-shadow: 0px 2px 0px 0px rgba(0,0,0,0.2);
                border: 1px solid black;
                border-radius:5px;
                outline: none;
                color: black;
                height: 25px;
                background: White;
                font-size: 18px;
                text-align:left;
            }

            .bigcard textarea
            {
                position:relative;
                width: 80%;
                margin-left: 10%;
                box-shadow: 0px 2px 0px 0px rgba(0,0,0,0.2);
                border: 1px solid black;
                border-radius:5px;
                outline: none;
                color: black;
                height: 25px;
                background: White;
                font-size: 18px;
                text-align:left;
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
            .bigcard h3{
                margin-left: 10%;
            }
        </style>
    </head>
    <%@include file="AdminNavbar.jsp"  %>
    <body>
        <div class="active">
            <div class="bigcard">
                <form action="FeedbackSolution" method="post">
                    <br>
                    <h2 style="text-align: center;">Feedback Solution</h2>
                    <input type="hidden" name="uid" value="<%=request.getParameter("uid")%>">
                    <h3>User Name</h3><input type='text' value="<%=request.getParameter("name")%>" name='nm' readonly required>
                    <h3>Feedback</h3><input type='text' value="<%=request.getParameter("feedback")%>" name='fb' readonly required>
                    <h3>Messege</h3><textarea style="height:60px; resize: vertical;" name='msg' placeholder="Enter Messege" required></textarea>

                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p><br>
                    <input type="submit" name="btnsend" value="Send">
                </form>
                <form action="FeedbackReport.jsp">
                    <input type="submit" name="btnsend" value="Cancel">
                </form>
            </div>
        </div>
    </body>
</html>