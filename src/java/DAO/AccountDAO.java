/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connect.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author admin
 */
public class AccountDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private ConnectDB connectdb;

    public AccountDAO() {
        connectdb = new ConnectDB();
    }
    //Kiem tra email da ton tai?
    public boolean checkEmail(String email) {
        String sql = "SELECT * FROM account WHERE user_email='" + email + "'";
        try {
            rs = connectdb.getStatement().executeQuery(sql);
            while(rs.next()){
                connectdb.closeConnect();
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Check email bi loi.");
        }
        return false;
    }
    
    public boolean insertUser(Account ac) {
        String sql = "INSERT INTO account VALUES(?,?,?,?)";
        try {
            stmt = connectdb.openConnect().prepareStatement(sql);
            stmt.setDouble(1, ac.getID());
            stmt.setString(2, ac.getUserEmail());
            stmt.setString(3, ac.getUserPass());
            stmt.setBoolean(4, ac.isUserRole());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Loi insert accout");
        }
        return false;

    }
    
    public Account login (String username, String password) {
        String sql = "select * from account where user_email='" + username + "' and user_pass='" + password + "'";
        try {
            rs = connectdb.getStatement().executeQuery(sql);
            if(rs.next()){
                Account ac = new Account();
                ac.setID(rs.getDouble("user_id"));
                ac.setUserEmail(rs.getString("user_email"));
                ac.setUserPass(rs.getString("user_pass"));
                ac.setUserRole(rs.getBoolean("user_role"));
                return ac;
            }
        } catch (SQLException ex) {
            System.out.println("Login loi");
        }
        return null;
    }
    
    public Account getUser(double userID) {
        try {
            String sql = "SELECT * FROM account WHERE user_id = ?";
            stmt = connectdb.openConnect().prepareStatement(sql);
            stmt.setDouble(1, userID);
            rs = stmt.executeQuery();
            Account u = new Account();
            while (rs.next()) {
                u.setUserEmail(rs.getString("user_email"));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        AccountDAO ac = new AccountDAO();
        System.out.println(ac.checkEmail("duyta"));
        System.out.println(ac.login("hieplt1018@gmail.com", "12345678").getUserEmail());
    }
}
