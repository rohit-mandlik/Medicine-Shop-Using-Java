<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Address Form</title>
        <link rel="stylesheet" href="bootstrap.css">
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/AddProduct.css">
        <style>
            .bigcard1 input[type="submit"] {
                height: 35px;
                width: 100%;
                box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.2);
                border-radius:5px;
                background-color: #0ca1a6;
                color: white;
                border:1px solid #0ca1a6;
                -webkit-transition-duration: 0.4s;
                transition-duration: 0.4s;
            }

            .bigcard1 input[type="submit"]:hover {
                background-color: #4CAF50;
                border:1px solid #4CAF50;
                color: white;
            }

            input[type="email"]
            {
                position:relative;
                width: 100%;
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
        </style>
        <script>
            function validateForm(event) {
                var eidInput = document.getElementsByName("eid")[0];
                var mbnInput = document.getElementsByName("mbn")[0];

                // Email validation regular expression
                var emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

                // Indian mobile number validation regular expression (10 digits)
                var mobilePattern = /^[6-9]\d{9}$/;

                if (!emailPattern.test(eidInput.value)) {
                    event.preventDefault();
                    alert("Please enter a valid email address.");
                } else if (!mobilePattern.test(mbnInput.value)) {
                    event.preventDefault();
                    alert("Please enter a valid 10-digit mobile number.");
                }
            }
        </script>
    </head>
    <body>
        <%@include file="UserNavbar.jsp" %>
        <%
            int orderquantity = Integer.parseInt(request.getParameter("orderquantity"));
            String pid = request.getParameter("pid");
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("orderquantity", orderquantity);
            httpSession.setAttribute("pid", pid);
            String uid = (String) httpSession.getAttribute("currentuser");
            String event = request.getParameter("Buy");
            if (uid == null) {
        %>
        <script>alert('Please Log In');</script>
        <%
                response.sendRedirect("Login.html");
            } else {
                if (event.equals("Add To Cart")) {
                    response.sendRedirect("AddToCart.jsp");
                }
            }
        %>
        <div class="active">
            <div class="filler"></div>

            <div class="bigcard">
                <form action="AddressForm" method="post" onsubmit="validateForm(event)">
                    <h2 style="text-align: center;">Delivery Address</h2>
                    <div class="bigcard1">
                        <h4>Enter Name</h4>
                        <input style="height:35px" type="text" name="name" placeholder="Enter Name" onkeypress="return /[A-Za-z\s]/i.test(event.key)" required>
                        <h4>Enter Mobile No.</h4>
                        <input style="height:35px" type="text" name="mbn" placeholder="Enter Mobile No" maxlength="10" pattern="[6-9]\d{9}" required>
                        <h4>Enter City</h4>
                        <input style="height:35px" type="text" name="city" placeholder="Enter City" onkeypress="return /[A-Za-z\s]/i.test(event.key)" required>
                        <h4>Enter Residential Address</h4>
                        <input style="height:35px" placeholder="Enter Residential Address" type="text" name="address" required>
                        <br><br>
                        <input style="font-size: 18px" name="btndone" type="submit" value="Done">
                    </div>
                    <div class="bigcard2">
                        <h4>Enter Email ID</h4>
                        <input style="height:35px" type="email" name="eid" placeholder="Enter Email Id" required>
                        <h4>Enter Pincode</h4>
                        <input style="height:35px" type="text" name="pin" placeholder="Enter Pincode" onkeypress="return event.charCode >= 48 && event.charCode <= 57" required>
                        <h4>State</h4>
                        <input style="height:35px" type="text" name="state" placeholder="Enter State" onkeypress="return /[A-Za-z\s]/i.test(event.key)" required>
                        <h4>Landmark</h4>
                        <input style="height:35px" placeholder="Enter Landmark" type="text" name="address" required>
                        <br><br>
                        <input style="font-size: 18px" name="btndone" type="submit" value="Cancel">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
