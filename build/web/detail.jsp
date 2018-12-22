<%-- 
    Document   : detail
    Created on : Nov 11, 2018, 2:09:58 PM
    Author     : admin
--%>

<%@page import="model.Book"%>
<%@page import="DAO.BookDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
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
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <link rel="stylesheet" href="css/etalage.css">
        <script src="js/jquery.etalage.min.js"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1200,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
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
        <jsp:include page="header.jsp"></jsp:include>
        <%
            BookDAO bookDao = new BookDAO();
            Book b = new Book();
            String book_id = "";
            if (request.getParameter("book_id") != null) {
                book_id = request.getParameter("book_id");
                b = bookDao.getBook(Integer.parseInt(book_id));
            }
        %>    
        <div class="container">
            <div class="single">
                <div class="col-md-9 top-in-single">
                    <div class="col-md-5 single-top">	
                        <ul id="etalage">
                            <li>
                                <a href="optionallink.html">
                                    <img class="etalage_thumb_image img-responsive" src="<%=b.getProductPhoto()%>" alt="" >
                                    <img class="etalage_source_image img-responsive" src="<%=b.getProductPhoto()%>" alt="" >
                                </a>
                            </li>
                            <li>
                                <img class="etalage_thumb_image img-responsive" src="images/si2.jpg" alt="" >
                                <img class="etalage_source_image img-responsive" src="images/si2.jpg" alt="" >
                            </li>
                            <li>
                                <img class="etalage_thumb_image img-responsive" src="images/si.jpg" alt=""  >
                                <img class="etalage_source_image img-responsive" src="images/si.jpg" alt="" >
                            </li>
                            <li>
                                <img class="etalage_thumb_image img-responsive" src="images/si1.jpg"  alt="" >
                                <img class="etalage_source_image img-responsive" src="images/si1.jpg" alt="" >
                            </li>
                        </ul>

                    </div>	
                    <div class="col-md-7 single-top-in">
                        <div class="single-para">
                            <h4><%=b.getBookName()%></h4>
                            <div class="para-grid">
                                <span  class="add-to">$<%=b.getBookPrice()%></span>
                                <a href="#" class="hvr-shutter-in-vertical cart-to">Add to Cart</a>					
                                <div class="clearfix"></div>
                            </div>
                            <h5>100 items in stock</h5>
                            <div class="available">
                                <h6>Available Options :</h6>
                                <ul>
                                    <li>Type:
                                        <select>
                                            <option>New</option>
                                            <option>Secondhand</option>
                                        </select>
                                    </li>
                                    <li>Quality:
                                        <select>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </li>
                                </ul>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>

                            <a href="#" class="hvr-shutter-in-vertical ">More details</a>

                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="content-top-in">
                        <div class="col-md-4 top-single">
                            <div class="col-md">
                                <img class="product_img"  src="images/jp2.jpg" alt="" />	
                                <div class="top-content">
                                    <h5>1Q84</h5>
                                    <div class="white">
                                        <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <div class="col-md-4 top-single">
                            <div class="col-md">
                                <img class="product_img" src="images/jp3.jpg" alt="" />	
                                <div class="top-content">
                                    <h5>20,000 leagues under the sea</h5>
                                    <div class="white">
                                        <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>
                        <div class="col-md-4 top-single-in">
                            <div class="col-md">
                                <img class="product_img" src="images/jp1.jpg" alt="" />	
                                <div class="top-content">
                                    <h5>Dance Dance Dance</h5>
                                    <div class="white">
                                        <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
                                        <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>							
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="single-bottom">
                        <h4>Categories</h4>
                        <ul>
                            <li><a href="#"><i> </i>Fusce feugiat</a></li>
                            <li><a href="#"><i> </i>Mascot Kitty</a></li>
                            <li><a href="#"><i> </i>Fusce feugiat</a></li>
                            <li><a href="#"><i> </i>Mascot Kitty</a></li>
                            <li><a href="#"><i> </i>Fusce feugiat</a></li>
                        </ul>
                    </div>
                    <div class="single-bottom">
                        <h4>Product Categories</h4>
                        <ul>
                            <li><a href="#"><i> </i>feugiat(5)</a></li>
                            <li><a href="#"><i> </i>Fusce (4)</a></li>
                            <li><a href="#"><i> </i> feugiat (4)</a></li>
                            <li><a href="#"><i> </i>Fusce (4)</a></li>
                            <li><a href="#"><i> </i> feugiat(2)</a></li>
                        </ul>
                    </div>
                    <div class="single-bottom">
                        <h4>Product Categories</h4>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/st1.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Consectetuer adipiscing elit</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/st2.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Consectetuer adipiscing elit</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="product">
                            <img class="img-responsive fashion" src="images/st3.jpg" alt="">
                            <div class="grid-product">
                                <a href="#" class="elit">Consectetuer adipiscing elit</a>
                                <span class="price price-in"><small>$500.00</small> $400.00</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
