/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author admin
 */
public class Book {
    private double bookId;
    private double categoryId;
    private String bookName;
    private String bookAuthor;
    private String bookPulisher;
    private String productPhoto;
    private double bookPrice;

    public Book() {
    }
        
    public Book(double bookId, String bookName, String bookAuthor, String bookPulisher, double bookPrice, double category, String productPhoto) {
        this.bookId = bookId;
        this.categoryId = categoryId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPulisher = bookPulisher;
        this.bookPrice = bookPrice;
        this.productPhoto = productPhoto;
    }

    

    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    public double getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(double categoryId) {
        this.categoryId = categoryId;
    }

    public double getBookId() {
        return bookId;
    }

    public void setBookId(double bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPulisher() {
        return bookPulisher;
    }

    public void setBookPulisher(String bookPulisher) {
        this.bookPulisher = bookPulisher;
    }

    public double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(double bookPrice) {
        this.bookPrice = bookPrice;
    }
    
    
}
