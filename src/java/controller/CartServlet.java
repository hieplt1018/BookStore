/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BookDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Book;
import model.Cart;
import model.Item;

/**
 *
 * @author admin
 */
public class CartServlet extends HttpServlet {
    private final BookDAO bookDao = new BookDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String bookId = request.getParameter("bookId");
        Cart cart = (Cart) session.getAttribute("cart");
        
        try {
            double bookID = Double.parseDouble(bookId);
            Book book = bookDao.getBook(bookID);
            switch(command) {
                case "plus":
                    if(cart.getCartItems().containsKey(bookID)){
                        cart.plusToCart(bookID, new Item(book, cart.getCartItems().get(bookID).getQuantity()));
                    } else {
                        cart.plusToCart(bookID, new Item(book, 1));
                    }
                break;
                case "remove":
                    cart.removeToCart(bookID);
                break;
            }
        } catch (Exception e) {
            System.out.println("Loi CartServlet");
            response.sendRedirect("/BookStore2/index.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("/BookStore2/index.jsp");
    }

}
