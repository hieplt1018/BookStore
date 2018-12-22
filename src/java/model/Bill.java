/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class Bill {
    private double billID;
    private double userID;
    private double total;
    private String payment;
    private String address;
    private Timestamp Date;

    public Bill() {
    }

    public Bill(double billID, double userID, double total, String payment, String address, Timestamp Date) {
        this.billID = billID;
        this.userID = userID;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.Date = Date;
    }

    public double getBillID() {
        return billID;
    }

    public void setBillID(double billID) {
        this.billID = billID;
    }

    public double getUserID() {
        return userID;
    }

    public void setUserID(double userID) {
        this.userID = userID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getDate() {
        return Date;
    }

    public void setDate(Timestamp Date) {
        this.Date = Date;
    }
    
    
}
