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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author admin
 */
public class CategoryDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private ConnectDB connectdb;

    public CategoryDAO() {
        connectdb = new ConnectDB();
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList();
        String sql = "SELECT * FROM db_bai3.category;";
        try {
            rs = connectdb.getStatement().executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("category_name");
//                SanPham sp = new SanPham(id, name, company, price);
                Category category = new Category(id, name);
                list.add(category);
            }
        } catch (Exception e) {
            System.out.println("Please check getAllProduct index.jsp in SanPhamDAO");
        }
        connectdb.closeConnect();
        return list;
    }
    
    public boolean updateCategory(Category c) {
        String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
        try {
            stmt = connectdb.openConnect().prepareStatement(sql);
            stmt.setString(1, c.getCategoryName());
            stmt.setDouble(2, c.getCategoryID());
            return stmt.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean insertCategory(Category c) {
        String sql = "INSERT INTO category VALUES(?,?)";
        try {
            stmt = connectdb.openConnect().prepareStatement(sql);
            stmt.setDouble(1, c.getCategoryID());
            stmt.setString(2, c.getCategoryName());
            return stmt.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteCategory(long category_id) {
        String sql = "DELETE FROM category WHERE category_id = ?";
        try {
            stmt = connectdb.openConnect().prepareStatement(sql);
            stmt.setLong(1, category_id);
            return stmt.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    //test
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
//        for(Category ds: dao.getAllCategories()){
//            System.out.println(ds.getCategoryID()+ ": " + ds.getCategoryName());
//        }
        dao.updateCategory(new Category(9, "Tùng Dương"));
    }
}
