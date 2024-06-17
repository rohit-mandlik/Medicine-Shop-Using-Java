<%--

<style>
    /* Navigation bar styles */
    .navbar {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        width: 100%;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    .navbar a {
        display: inline-block;
        text-decoration: none;
        padding: 0 10px;
        font-weight: bold;
        color: black;
    }

    .navbar a:hover {
        color: white;
        background-color: black;
        padding: 0 10px;
    }

    /* Media queries for responsive design */
    @media screen and (max-width: 768px) {
        .navbar {
            justify-content: center;
            flex-wrap: wrap;
            background-color: #f2f2f2;
            margin-top: 10px;
            padding: 10px;
        }

        .navbar a {
            margin: 0 5px;
            margin-bottom: 5px;
            display: block;
            text-align: center;
        }
    }

</style>
<div class="main">

    <div class="header" >

        <div class="container2" >

            <div class="navbar">
                <Button style="margin-right:50%; font-size: large; border: none; background-color: #0ca1a6;">Medicine Store</Button>
                <a href="Homepage.jsp">HOME</a>
                <a href="Buy.jsp">BUY</a>
                <a href="Orders.jsp">ORDERS</a>
                <a href="userFedback.jsp">Feedback</a>
                <a href="Logout.jsp">LOGOUT</a>
            </div>
        </div>
    </div>
</div>

--%>
<head>
    <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
</head>

<div class="menu-bar">
    <ul>
        <img style="height:70px;width:55px;padding-top:1%; margin-right: 1%" src="images/Ganesha.png" alt=""/>
        <p class="left-button" style="font-size:20px; padding-top:1%"><b>Ashtavinayak</br>Medical Store</b></p>
        <li><a href="Homepage.jsp"><i class="fa fa-home" aria-hidden="true"></i> <b>Home</b></a></li>
        <li><a href="Buy.jsp"><i class="fa fa-paw" aria-hidden="true"></i> <b>Search Medicine</b></a></li>
        <li><a href="Orders.jsp"><i class="fa fa-reply" aria-hidden="true"></i> <b>Your Orders</b></a>
            <div class="sub">
                <ul>
                    <li><a href="CancelledOrders.jsp">Cancelled Orders</a></li>
                </ul>
        </li>
        <li><a href="Cart.jsp"><i class="fa fa-reply" aria-hidden="true"></i> <b>Cart</b></a></li>
        <li><a href="#"><i class="fa fa-paw" aria-hidden="true"></i><b>Feedback</b></a> 
            <div class="sub">
                <ul>
                    <li><a href="userFeedback.jsp">Give Feedback</a></li>
                    <li><a href="FeedbackSolutionReport.jsp">Reply on Your Feedback</a></li>
                </ul>
            </div>
        </li>
        <li><a href="Logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> <b>Logout</b></a></li>
    </ul>
</div>
<div class="footer">
    <p>&copy; 2023 Ashthavinayak Medical Store. All rights reserved.</p> 
</div>
