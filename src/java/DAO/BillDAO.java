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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Bill;

/**
 *
 * @author admin
 */
public class BillDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private ConnectDB connectdb;

    public BillDAO() {
        connectdb = new ConnectDB();
    }
    
    public void insertBill(Bill bill) {
        String sql = "INSERT INTO bill VALUES(?,?,?,?,?,?)";
        try {
            stmt = connectdb.openConnect().prepareStatement(sql);
            stmt.setDouble(1, bill.getBillID());
            stmt.setDouble(2, bill.getUserID());
            stmt.setDouble(3, bill.getTotal());
            stmt.setString(4, bill.getPayment());
            stmt.setString(5, bill.getAddress());
            stmt.setTimestamp(6, bill.getDate());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Loi insert accout");
        }
    }
    
    public ArrayList<Bill> getListBill() {
        ArrayList<Bill> list = new ArrayList();
        String sql = "SELECT * FROM bill";
        System.out.println(sql);
        try {
            rs = connectdb.getStatement().executeQuery(sql);
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getDouble("bill_id"));
                bill.setUserID(rs.getDouble("user_id"));
                bill.setTotal(rs.getDouble("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setDate(rs.getTimestamp("date"));
                bill.setAddress(rs.getString("address"));
                list.add(bill);
            }
        } catch (Exception e) {
            System.out.println("Please check getAllProduct index.jsp in SanPhamDAO");
        }
        connectdb.closeConnect();
        return list;
    }
    
    public static void main(String[] args) throws SQLException {

        new BillDAO().insertBill(new Bill(0, 0, 0, "s", "s", new Timestamp(new Date().getTime())));
    }
}
