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
    <div class="header">
        <div class="container2">
            <div class="navbar">
                <Button style="margin-right:30%; font-size: large; border: none; background-color: #0ca1a6;">Medicine Store</Button>
                <a href="SellerHomepage.jsp">HOME</a>
                <a href="AddProduct.html">ADD</a>
                <a href="AddInventory.jsp">RESTOCK</a>
                <a href="UpdateDates.jsp">UPDATE DATES</a>
                <a href="SellerOrders.jsp">ORDERS</a>
                <a href="Logout.jsp">LOGOUT</a>
            </div>
        </div>
    </div>
</div>






<head>
    <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
</head>

<div class="menu-bar">

            <ul>
                <h3 class="left-button">RS MedShop</h3>
                <li><i class="fa fa-home" aria-hidden="true"></i><a href="SellerHomepage.jsp">Home</a></li>
                <li><a href="#"><i class="fa fa-paw" aria-hidden="true"></i>Manage Products</a> 
                    <div class="sub">
                        <ul>
                            <li><a href="AddProduct.html">Add Product</a></li>
                            <li><a href="AddInventory.jsp">Restock</a></li>
                            <li><a href="UpdateDates.jsp">Update Dates</a></li>
                        </ul>
                    </div>

                </li>
                <li><a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i>Reports</a>

                    <div class="sub">
                        <ul>
                            <li><a href="SellerOrders.jsp">Orders Report</a></li>
                            <li><a href="OrderCancelReport.jsp">Order Cancel Report</a></li>
                            <li><a href="FeedbackReport.jsp">User Feedback Report</a></li>
                        </ul>
                    </div>


                </li>
                <li><a href="Logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
            </ul>
        </div>

<div class="footer">
  <p>&copy; 2023 RS MedShop. All rights reserved.</p>
</div>
--%>
<head>
    <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
</head>

<div class="menu-bar">
    <ul><img style="height:70px;width:55px;padding-top:1%; margin-right: 1%" src="images/Ganesha.png" alt=""/>
        <p class="left-button" style="font-size:20px; padding-top:1%"><b>Ashtavinayak</br>Medical Store</b></p>
        <li><a href="SellerHomepage.jsp"><b>Home</b></a></li>
        <li><a href="AddProduct.html"><b>Add Product</b></a></li>
        <li><a href="AddInventory.jsp"><b>Manage products</b></a></li>
        <li><a href="SellerOrders.jsp"><b>Orders</b></a></li>
        <li><a href="SellerCancelledOrders.jsp"><b>Cancelled Orders</b></a></li>
        <li><a href="Logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i><b>Reports</b></a>
            <div class="sub">
                <ul>
                    <li><a href="or"><b>Orders Report</b></a></li>
                    <li><a href="cr"><b>Our Customers</b></a></li>
                    <li><a href="pr"><b>Products</b></a></li>
                    <li><a href="up"><b>Unavailable Products</b></a>
                </ul>
            </div>
        </li>
        <li><a href="FeedbackReport.jsp"><b>Feedbacks</b></a></li>
        <li><a href="Logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i><b>Logout</b></a></li>
    </ul>
</div>
<div class="footer">
    <p>&copy; 2023 Ashtavinayak Medical Store. All rights reserved.</p>
</div>