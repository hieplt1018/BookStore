/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.AccountDAO;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import tools.MD5;

/**
 *
 * @author admin
 */
public class AccountServlet extends HttpServlet {
    AccountDAO acDao = new AccountDAO();
            
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String command = request.getParameter("command");
        String url = "";
        Account account = new Account();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                account.setID(new java.util.Date().getTime());
                account.setUserEmail(request.getParameter("email"));
                account.setUserPass(request.getParameter("pass"));
                account.setUserRole(false);
                acDao.insertUser(account);
                session.setAttribute("user", account);
                url = "/index.jsp";
                break;
            case "login":
                account = acDao.login(request.getParameter("email"), request.getParameter("pass"));
                if (account != null) {
                    session.setAttribute("user", account);
                    url = "/index.jsp";
                } else {
                    request.setAttribute("error", "Error email or password!");
                    url = "/login.jsp";
                }
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }
}
