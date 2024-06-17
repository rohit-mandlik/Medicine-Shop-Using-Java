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
        <title>Payment</title>
        <link rel="stylesheet" href="bootstrap.css"><!--  -->
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/AddProduct.css">
        <style>
            .body{
                height: 100%;
                background-image: url("images/payment3.jpg");
            }

            .active{
                width: 100%;
                height: 100%
            }

            .bigcard2{
                width: 30%;
                align-content: center;
                align-items: center;
                align-self: center;
                alignment-baseline: central;
                alignment-adjust: central;
                margin-left: 60%;
                margin-right: 10%;
                margin-top: 1%;
                background-color: blanchedalmond;
                position: absolute;
            }

            .bigcard2 input[type="radio"]{
                margin-left: 20%;
                width: 2.5em;
                height: 1em;
            }

            .bigcard2 label{
                font-size: 20px;
                color: black;
                margin-left: 15%;
            }

            .bigcard2 input[type="text"] {
                width: 70%;
                margin-left: 15%;
            }

            .bigcard2 input[type="submit"] {
                height: 35px;
                width: 80%;
                margin-left: 10%;
                margin-bottom: 3%;
                box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.2);
                border-radius: 5px;
                background-color: #0ca1a6;
                color: white;
                border: 1px solid #0ca1a6;
                -webkit-transition-duration: 0.4s;
                transition-duration: 0.4s;
            }

            .bigcard2 input[type="submit"]:hover{
                background-color: #4CAF50;
                border: 1px solid #4CAF50;
                color: white;
            }

            .bigcard2 a {
                height: 35px;
                width: 80%;
                margin-left: 10%;
                margin-bottom: 3%;
                box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.2);
                border-radius: 5px;
                background-color: #0ca1a6;
                color: white;
                border: 1px solid #0ca1a6;
                -webkit-transition-duration: 0.4s;
                transition-duration: 0.4s;
            }

        </style>

        <script>
            // Function to validate the card payment form
            function validateForm() {
                var cardNumber = document.getElementById("card-number").value;
                var cardName = document.getElementById("card-name").value;
                var expiryDate = document.getElementById("expiry-date").value;
                var cvv = document.getElementById("cvv").value;

                // Validate card number (16 digits)
                if (cardNumber.length !== 16 || isNaN(cardNumber)) {
                    alert("Please enter a valid 16-digit card number.");
                    return false;
                }

                // Validate cardholder name (non-empty)
                if (cardName.trim() === "") {
                    alert("Please enter the cardholder name.");
                    return false;
                }

                // Validate expiry date (format: MM/YY)
                var dateRegex = /^(0[1-9]|1[0-2])\/\d{4}$/;
                if (!dateRegex.test(expiryDate)) {
                    alert("Please enter a valid expiry date in the format MM/YYYY.");
                    return false;
                }

                // Validate CVV (3 digits)
                if (cvv.length !== 3 || isNaN(cvv)) {
                    alert("Please enter a valid 3-digit CVV number.");
                    return false;
                }

                // Form is valid, submit the form
                return true;
            }

            // Function to handle "Done" button click event
            function handleDoneButtonClick() {
                if (validateForm()) {
                    // Add any additional actions you want to perform when "Done" button is clicked
                    alert("Payment submitted successfully!");
                }
            }
        </script>
    </head>

    <body>
        <%@include file="UserNavbar.jsp" %>
        <div class="active">
            <form id="paymentForm" action="PaymentCredit.jsp" method="post">
                <div class="bigcard2">
                    <br>
                    <h2 style="text-align: center;">Card Payment</h2><br>
                    <label for="card-number">Card Number:</label><br>
                    <input type="text" id="card-number" name="card-number" placeholder="Enter card number" maxlength="16" required>
                    <br><br>
                    <label for="card-name">Cardholder Name:</label><br>
                    <input type="text" id="card-name" name="card-name" placeholder="Enter cardholder name" required>
                    <br><br>
                    <label for="expiry-date">Expiry Date:</label><br>
                    <input type="text" id="expiry-date" name="expiry-date" placeholder="MM/YYYY" required>
                    <br><br>
                    <label for="cvv">CVV:</label><br>
                    <input type="text" id="cvv" name="cvv" placeholder="Enter CVV" maxlength="3" required>

                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p><br><br>
                    </form>
                    <input type="submit" name="btnselect" value="Done" onclick="handleDoneButtonClick()"><!-- comment -->
                    <form id="paymentForm" action="PaymentCredit.jsp" method="post">
                        <input type="submit" name="btnselect" value="Cancel">
                        </div>
                    </form>
                </div>
                </body>
                </html>
