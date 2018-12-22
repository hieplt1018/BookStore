/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author admin
 */
public class Cart {
    private HashMap<Double, Item> cartItems;

    public Cart() {
        cartItems = new HashMap<>();
    }

    public Cart(HashMap<Double, Item> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Double, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Double, Item> cartItems) {
        this.cartItems = cartItems;
    }
    
    public void plusToCart(Double key, Item item) {
        boolean check =  cartItems.containsKey(key);
        if(check) {
            int oldQuantity = item.getQuantity();
            item.setQuantity(oldQuantity + 1);
            cartItems.put(key, item);
        } else {
            cartItems.put(key, item);
        }
    }
    
    public void subToCart(Double key, Item item) {
        boolean check = cartItems.containsKey(key);
        if(check) {
            int oldQuantity = item.getQuantity();
            if(oldQuantity <= 1) {
                cartItems.remove(key);
            } else {
                item.setQuantity(oldQuantity - 1);
                cartItems.put(key, item);
            }
        }
    }
    
    public void removeToCart(Double key) {
        boolean check = cartItems.containsKey(key);
        if(check) {
            cartItems.remove(key);
        }
    }

    public int countItem() {
        return cartItems.size();
    }
        
    public double totalCart() {
        double count = 0;
        for (Map.Entry<Double, Item> list: cartItems.entrySet()) {
            count += list.getValue().getBook().getBookPrice() * list.getValue().getQuantity();
        }
        return count; 
    }
}
