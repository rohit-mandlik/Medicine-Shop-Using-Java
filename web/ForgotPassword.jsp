<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Register</title>
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/Register.css">
    </head>
    <body>
        <div class="menu-bar">
            <ul>
                <img style="height:70px;width:55px;padding-top:1%; margin-right: 1%" src="images/Ganesha.png" alt=""/>
                <p class="left-button" style="font-size:20px; padding-top:1%"><b>Ashtavinayak</br>Medical Store</b></p>
                <li><a href="index.html"><i class="fa fa-home" aria-hidden="true"></i> <b>Home</b></a></li>
                <li><a href="About.jsp"><b>About</b></a></li>
                <li><a href="Contact.jsp"><i class="fa fa-reply" aria-hidden="true"></i> <b>Contact</b></a></li>
                <li><a href="#"><i class="fa fa-register" aria-hidden="true"></i><b>Register</b></a> 
                    <div class="sub">
                        <ul>
                            <li><a href="Register.html">Customer</a></li>
                            <li><a href="SellerRegister.html">Seller</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="#"><i class="fa fa-reply" aria-hidden="true"></i> <b>Login</b></a>
                    <div class="sub">
                        <ul>
                            <li><a href="Login.html">Customer</a></li>
                            <li><a href="SellerLogin.html">Seller</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="footer">
            <p>&copy; 2023 Ashtavinayak Medical Store. All rights reserved.</p>
        </div>
        <form action="Register.jsp" method="post">
            <div class="container">
                <div class="registerbox" style="text-align: center">
                    <h2>Forgot Password?</h2>
                    <input type="text" name="uid" placeholder="Enter User Id" required>
                    <input type="password" name="password" id="newPassword" placeholder="Enter New Password" required>
                    <input type="password" name="cpassword" id="confirmPassword" placeholder="Confirm New Password" required oninput="checkPasswordMatch()">

                    <input type="submit" value="Submit" onclick="return validateForm()" /><br/><br/>

                    <p id="passwordMatchMessage" style="color: red; display: none;">New password and confirm password must be the same.</p>

                    <script>
                        function checkPasswordMatch() {
                            var newPassword = document.getElementById("newPassword").value;
                            var confirmPassword = document.getElementById("confirmPassword").value;
                            var passwordMatchMessage = document.getElementById("passwordMatchMessage");

                            if (newPassword === confirmPassword) {
                                passwordMatchMessage.style.display = "none";
                            } else {
                                passwordMatchMessage.style.display = "block";
                            }
                        }

                        function validateForm() {
                            var newPassword = document.getElementById("newPassword").value;
                            var confirmPassword = document.getElementById("confirmPassword").value;
                            var passwordMatchMessage = document.getElementById("passwordMatchMessage");

                            if (newPassword !== confirmPassword) {
                                passwordMatchMessage.style.display = "block";
                                return false; // Prevent form submission
                            }

                            return true; // Allow form submission
                        }
                    </script>

                    <a href="Login.html">Back to login</a>
                </div>
            </div>
        </form>

    </body>
</html>