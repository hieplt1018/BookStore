/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BillDAO;
import DAO.BillDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;

/**
 *
 * @author admin
 */
public class CheckOutServlet extends HttpServlet {
    private final BillDAO billDao = new BillDAO();
    private final BillDetailDAO billDetailDao = new BillDetailDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Account ac = (Account) session.getAttribute("user");
        try {
            double ID = new Date().getTime();
            Bill bill = new Bill();
            bill.setBillID(ID);
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setUserID(ac.getID());
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotal(cart.totalCart());
            billDao.insertBill(bill);
            for (Map.Entry<Double, Item> list : cart.getCartItems().entrySet()) {
                billDetailDao.insertBillDetail(new BillDetail(0, ID, list.getValue().getBook().getBookId(), list.getValue().getBook().getBookPrice(), list.getValue().getQuantity()));
            }
            cart = new Cart();
            session.setAttribute("cart", cart);
        } catch (Exception e) {
        }
        response.sendRedirect("/BookStore2/index.jsp");
    }
}
