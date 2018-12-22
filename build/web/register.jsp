<%-- 
    Document   : register
    Created on : Nov 11, 2018, 6:38:55 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
              $(document).ready(function () {
                   var x_timer;
                   $("#username").keyup(function (e) {
                        clearTimeout(x_timer);
                        var user_name = $(this).val();
                        x_timer = setTimeout(function () {
                            check_username_ajax(user_name);
                        }, 1000);
                        });

                   function check_username_ajax(username) {
                        $("#user-result").html('<img src="images/ajax-loader.gif" />');
                        $.post('CheckEmailServlet', {"username": username}, function (data) {
                            $("#user-result").html(data);
                         });
                   }
               });
        </script>
        
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="account">
                    <h2 class="account-in">Register</h2>
                    <form action="AccountServlet" method="POST">
                        <div>
                            <span class="word">Username *</span>
                            <input type="text" name="email" id="email">
                            <span id="user-result"></span>
                        </div> 	
                        <div> 
                            <span class="word">Password *</span>
                            <input type="password" name="pass">
                            <span></span>
                        </div>			
                        <input type="hidden" value="insert" name="command">
                        <input type="submit" value="Register"> 
                        <span class="register"><a href="index.jsp" id="register" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 register">Back</a></span>
                    </form>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
