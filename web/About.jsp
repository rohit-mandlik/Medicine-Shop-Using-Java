<%-- 
    Document   : About
    Created on : 21-May-2023, 4:05:30 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <style>
            /* CSS styles */
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            .hero-section {
                height: 100vh;
                background-image: url('images/bg1.jpg');
                background-size: cover;
                background-position: center;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                color: #fff;
            }

            .hero-section h1 {
                font-size: 40px;
            }

            .hero-section p {
                justify-content: center;
                font-size: 24px;
                margin-bottom: 50%;
                color:white;
                margin: 0 20% 0 20%;
                background-color: rgb(0, 0, 0, 0.6)
            }

            .cta-button {
                display: inline-block;
                padding: 12px 24px;
                background-color: #4cae4c;
                color: #333;
                font-size: 20px;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            .cta-button:hover {
                background-color: #eee;
            }
        </style>
    </head>
    <body>
        <%@include file="Home_Navbar.jsp" %>

        <div class="hero-section">
            <h1 style="color: #FF5722"><b>About Us</b></h1>
        <p style="color: white;">   Our online medicine shopping portal offers a convenient, accessible, and reliable solution for individuals to purchase their healthcare products and medications. With a user-friendly interface, a wide range of pharmaceutical products, and a commitment to quality assurance, we aim to enhance the overall healthcare experience and empower individuals to take control of their well-being. Join us on this transformative journey as we reshape the way you access the medicines you need.
        The primary goal of our online medicine shopping portal is to provide individuals with a hassle-free and efficient way to obtain the medications they need. With just a few clicks, users can browse through a comprehensive catalog of pharmaceutical products, including prescription medications, over-the-counter drugs, vitamins, and supplements. Our platform streamlines the entire process, eliminating the need to physically visit a pharmacy and saving valuable time and effort.
        </p>
    </div>
        
    </body>
</html>
