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
import model.BillDetail;

/**
 *
 * @author admin
 */
public class BillDetailDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private ConnectDB connectdb;

    public BillDetailDAO() {
        connectdb = new ConnectDB();
    }
    public void insertBillDetail(BillDetail bd){
        String sql = "INSERT INTO bill_detail VALUES(?,?,?,?,?)";
        try {
            stmt = connectdb.openConnect().prepareStatement(sql);
            stmt.setInt(1, bd.getBillDetailID());
            stmt.setDouble(2, bd.getBillID());
            stmt.setDouble(3, bd.getProductID());
            stmt.setDouble(4, bd.getProductID());
            stmt.setInt(5, bd.getQuantity());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Loi insert bill detail");
        }
    }
    
    public static void main(String[] args) throws SQLException {
        new BillDetailDAO().insertBillDetail(new BillDetail(0, 0, 0, 0, 0));
    }
}
