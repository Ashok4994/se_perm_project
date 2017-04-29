<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

         <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <!-- Normalize CSS --> 
        <link rel="stylesheet" href="css/normalize.css">

        <!-- Main CSS -->         
        <link rel="stylesheet" href="css/main.css">

        <!-- Bootstrap CSS --> 
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Animate CSS --> 
        <link rel="stylesheet" href="css/animate.min.css">

        <!-- Font-awesome CSS-->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Owl Caousel CSS -->
        <link rel="stylesheet" href="vendor/OwlCarousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendor/OwlCarousel/owl.theme.default.min.css">

        <!-- Main Menu CSS -->      
        <link rel="stylesheet" href="css/meanmenu.min.css">
        

        <!-- nivo slider CSS -->
        <link rel="stylesheet" href="vendor/slider/css/nivo-slider.css" type="text/css" />
        <link rel="stylesheet" href="vendor/slider/css/preview.css" type="text/css" media="screen" />

        <!-- Switch Style CSS -->
        <link rel="stylesheet" href="css/switch-style.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- loginstyle -->
        <link rel="stylesheet" href="css/loginStyle.css" media="screen" type="text/css" />

        <!-- Modernizr Js -->
        <script src="js/modernizr-2.8.3.min.js"></script>



</head>
<body>

 <div class="Signin-Box">
                <h2>Sign In</h2><br>

                <% String s1 = (String) request.getAttribute("msg");
                    if (s1 != null) {
                        out.println(s1);
                    }%>
                <form action="Login" method="post">
                    <input type="text" name="uid" placeholder="UserID">
                    <input type="password" name="passwd" placeholder="Password">
                    <input type="submit" name="login" class="login login-submit" value="Sign In">
                </form>

                <div class="Reg-ForgotP">
                    <a href="register2.jsp">New User? Click here to register.</a>
                    <br>
                    <a href="#">Forgot Password?</a>
                </div>
            </div>


</body>
</html>