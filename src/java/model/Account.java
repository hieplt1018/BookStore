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
public class Account {
    private double ID;
    private String userEmail;
    private String userPass;
    private boolean userRole;

    public Account() {
    }

    public Account(double ID, String userEmail, String userPass, boolean userRole) {
        this.ID = ID;
        this.userEmail = userEmail;
        this.userPass = userPass;
        this.userRole = userRole;
    }

    public double getID() {
        return ID;
    }

    public void setID(double ID) {
        this.ID = ID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public boolean isUserRole() {
        return userRole;
    }

    public void setUserRole(boolean userRole) {
        this.userRole = userRole;
    }
    
    
}
