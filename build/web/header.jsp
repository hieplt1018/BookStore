<%-- 
    Document   : header
    Created on : Nov 11, 2018, 6:16:26 AM
    Author     : admin
--%>

<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.util.Set"%>
<%@page import="model.Account"%>
<%@page import="model.Category"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
    </head>
    <body>
        <%
            CategoryDAO categoryDao = new CategoryDAO();
            Account user = null;
//            Set<Session> userSessions;
            if (session.getAttribute("user") != null) {
                user = (Account) session.getAttribute("user");
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <div class="header">
		<div class="header-top">
			<div class="container">	
			<div class="header-top-in">			
				<div class="logo">
                                    <a href="index.jsp"><i id="logo">Because book is the world</i></a>
				</div>
				<div class="header-in">
					<ul class="icon1 sub-icon1">
                                            <% if(user != null) { %>
                                                <li  ><a href="account.html">Welcome <%=user.getUserEmail()%></a></li>
                                            <% } %>
                                            <li  ><a href="wishlist.html">WISH LIST (0)</a> </li>
                                            <li ><a href="#" > SHOPPING CART</a></li>
                                            <li > <a href="checkout.jsp" >CHECKOUT</a> </li>	
                                            <li>
                                                <div class="cart">
                                                    <a href="#" class="cart-in"> </a>
                                                    <span> <%=cart.countItem()%></span>
						</div>
					<ul class="sub-icon1 list">
					<h3>Recently added items</h3>
					<div class="shopping_cart">
                                            <% for(Map.Entry<Double, Item> list: cart.getCartItems().entrySet()) { %>
                                           
                                            
                                            <div class="cart_box">
						<div class="message">
                                                    <div class="alert-close"> </div> 
					                <div class="list_img">
                                                            <img src="<%=list.getValue().getBook().getProductPhoto() %>" class="img-responsive" alt="">
                                                        </div>
                                                            <div class="list_desc">
                                                                <h4>
                                                                    <a href="CartServlet?command=remove&bookId=<%=list.getValue().getBook().getBookId()%>"> <%=list.getValue().getBook().getBookName() %></a>
                                                                    <span class="quantity"><%=list.getValue().getQuantity() %> x </span>
                                                                    <span class="actual">$<%=list.getValue().getBook().getBookPrice() %></span></div>
                                                                </h4>
                                                                
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <% } %>
	                        </div>
	                        <div class="total">
	                        	<div class="total_left">CartSubtotal: </div>
	                        	<div class="total_right">$<%=cart.totalCart() %></div>
	                        	<div class="clearfix"> </div>
	                        </div>
                            <div class="login_buttons">
							  <div class="check_button"><a href="checkout.jsp">Check out</a></div>
							  <div class="clearfix"></div>
						    </div>
					      <div class="clearfix"></div>
						</ul>
							</li>
						</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			</div>
		</div>
		<div class="header-bottom">
		<div class="container">
			<div class="h_menu4">
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li class="active"><a href="index.jsp"><i> </i>Home</a></li>
					<li ><a href="#" >Category</a>
						<ul class="drop">
                                                    <%
                                                        for (Category c : categoryDao.getAllCategories()) {
                                                    %>
							<li><a href="products.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%></a></li>
                                                    <%
                                                        }
                                                    %>
						</ul>
						</li> 						
						<li><a href="contact.html" >Contact </a></li>
					
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
			</div>
		</div>
		</div>
		<div class="header-bottom-in">
			<div class="container">
			<div class="header-bottom-on">
			<p class="wel"><a href="login.jsp">Welcome visitor you can login or create an account.</a></p>
			<div class="header-can">
				<ul class="social-in">
						<li><a href="#"><i> </i></a></li>
						<li><a href="#"><i class="facebook"> </i></a></li>
						<li><a href="#"><i class="twitter"> </i></a></li>					
						<li><a href="#"><i class="skype"> </i></a></li>
					</ul>	
					<div class="down-top">		
							<select class="in-drop">
							  <option value="Dollars" class="in-of">Dollars</option>
							  <option value="Euro" class="in-of">Euro</option>
							  <option value="Yen" class="in-of">Yen</option>
							</select>
					 </div>
					<div class="search">
						<form>
							<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
							<input type="submit" value="">
						</form>
					</div>

					<div class="clearfix"> </div>
			</div>
			<div class="clearfix"></div>
		</div>
		</div>
		</div>
	</div>
    </body>
</html>
