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
public class BillDetail {
    private int billDetailID;
    private double billID;
    private double productID;
    private double price;
    private int quantity;

    public BillDetail() {
    }

    public BillDetail(int billDetailID, double billID, double productID, double price, int quantity) {
        this.billDetailID = billDetailID;
        this.billID = billID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    public int getBillDetailID() {
        return billDetailID;
    }

    public void setBillDetailID(int billDetailID) {
        this.billDetailID = billDetailID;
    }

    public double getBillID() {
        return billID;
    }

    public void setBillID(double billID) {
        this.billID = billID;
    }

    public double getProductID() {
        return productID;
    }

    public void setProductID(double productID) {
        this.productID = productID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
