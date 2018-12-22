<%-- 
    Document   : products
    Created on : Nov 11, 2018, 9:00:30 AM
    Author     : admin
--%>

<%@page import="model.Cart"%>
<%@page import="DAO.BookDAO"%>
<%@page import="model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
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
                jQuery(document).ready(function($) {
                        $(".scroll").click(function(event){		
                                event.preventDefault();
                                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $('.alert-close').on('click', function (c) {
                    $('.message').fadeOut('slow', function (c) {
                        $('.message').remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $('.alert-close1').on('click', function (c) {
                    $('.message1').fadeOut('slow', function (c) {
                        $('.message1').remove();
                    });
                });
            });
        </script>
    </head>
    <body>
        <%
            BookDAO bookDao = new BookDAO();
            String category_id = "";
            if(request.getParameter("category") != null){
                category_id = request.getParameter("category");
            }
            Cart cart = (Cart)  session.getAttribute("cart");
            if(cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="container">
            <div class="products">
                <h2 class=" products-in">PRODUCTS</h2>
                <div class=" top-products">
                <%
                    for (Book b : bookDao.getBooksByCategory(Long.parseLong(category_id))) {
                %>
                    <div class="col-md-3 md-col">
                        <div class="col-md">
                            <img class="product_img"  src="<%=b.getProductPhoto()%>" alt="" />
                            <a href="detail.jsp?book_id=<%=b.getBookId()%>" class="compare-in"><%=b.getBookName()%>
                                <div class="compare">
                                    <span>Add to Compare</span>
                                    <span>Add to Whislist</span>
                                </div>
                            </a>	
                            <div class="top-content">
                                <h5><a href="single.html"></a></h5>
                                <div class="white">
                                    <a href="CartServlet?command=plus&bookId=<%=b.getBookId()%>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                    <p class="dollar"><span class="in-dollar">$</span><span><%=b.getBookPrice()%></span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>							
                        </div>
                    </div>
                <%
                    }
                %>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
