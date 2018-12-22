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
import model.Book;
import model.Category;

/**
 *
 * @author admin
 */
public class BookDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private ConnectDB connectdb;

    public BookDAO() {
        connectdb = new ConnectDB();
    }

    public ArrayList<Book> getBooksByCategory(long category_id) {
        ArrayList<Book> list = new ArrayList();
        String sql = "SELECT * FROM book WHERE category_id ='" + category_id + "'";
        System.out.println(sql);
        try {
            rs = connectdb.getStatement().executeQuery(sql);
            while (rs.next()) {
                double id = rs.getDouble("book_id");
                String name = rs.getString("book_name");
                String author = rs.getString("book_author");
                String pulisher = rs.getString("book_pulisher");
                double price = rs.getDouble("book_price");
                String photo = rs.getString("book_photo");
//                SanPham sp = new SanPham(id, name, company, price);
                Book book = new Book(id, name, author, pulisher, price, category_id, photo);
                list.add(book);
            }
        } catch (Exception e) {
            System.out.println("Please check getAllBook index.jsp in SanPhamDAO");
        }
        connectdb.closeConnect();
        return list;
    }
    
    public Book getBook(double book_id) throws SQLException {
        String sql = "SELECT * FROM book WHERE book_id='" + book_id + "'";
        stmt = connectdb.openConnect().prepareStatement(sql);
        rs = stmt.executeQuery();
        Book book = null;
        while (rs.next()) {
            double id = rs.getDouble("book_id");
            String name = rs.getString("book_name");
            String author = rs.getString("book_author");
            String pulisher = rs.getString("book_pulisher");
            double price = rs.getDouble("book_price");
            String photo = rs.getString("book_photo");
            book = new Book(book_id, name, author, pulisher, price, id, photo);
        }
        return book;
    }
    //test
    
    // lấy danh sách sản phẩm
    public ArrayList<Book> getListBookByNav(double categoryID, int firstResult, int maxResult) throws SQLException {
        String sql = "SELECT * FROM book WHERE category_id = '" + categoryID + "' limit ?,?";
        stmt = connectdb.openConnect().prepareStatement(sql);
        stmt.setInt(1, firstResult);
        stmt.setInt(2, maxResult);
        rs = stmt.executeQuery();
        ArrayList<Book> list = new ArrayList<>();
        while (rs.next()) {
            Book book = new Book();
            book.setBookId(rs.getDouble("book_id"));
            book.setBookName(rs.getString("book_name"));
            book.setProductPhoto(rs.getString("book_photo"));
            book.setBookPrice(rs.getDouble("book_price"));
            book.setBookAuthor(rs.getString("book_author"));
            book.setBookPulisher(rs.getString("book_pulisher"));
            book.setCategoryId(rs.getDouble("category_id"));
            list.add(book);
        }
        return list;
    }
    
    public int countProductByCategory(long categoryID) throws SQLException {
        String sql = "SELECT count(book_id) FROM book WHERE category_id = '" + categoryID + "'";
        stmt = connectdb.openConnect().prepareStatement(sql);
        rs = stmt.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    
    public ArrayList<Book> getAllBook() throws SQLException {
        ArrayList<Book> list = new ArrayList();
        String sql = "SELECT * FROM db_bai3.book;";
        stmt = connectdb.openConnect().prepareStatement(sql);
        rs = stmt.executeQuery();
        while (rs.next()) {
            Book book = new Book();
            book.setBookId(rs.getDouble("book_id"));
            book.setBookName(rs.getString("book_name"));
            book.setProductPhoto(rs.getString("book_photo"));
            book.setBookPrice(rs.getDouble("book_price"));
            book.setBookAuthor(rs.getString("book_author"));
            book.setBookPulisher(rs.getString("book_pulisher"));
            book.setCategoryId(rs.getDouble("category_id"));
            list.add(book);
        }
        return list;
    }
    public static void main(String[] args) throws SQLException {
        BookDAO dao = new BookDAO();
//        for (Book ds : dao.getBooksByCategory(1)) {
//            System.out.println(ds.getBookName() + ": " + ds.getBookPrice());
//        }
        System.out.println(dao.getBook(1).getBookName());
    }
}
