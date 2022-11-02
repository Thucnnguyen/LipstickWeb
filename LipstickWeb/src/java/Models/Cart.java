/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class Cart {

    private List<ProductInCart> list = null;

    public Cart() {
        list = new ArrayList<>();
    }

    public void add(ProductInCart product) {
        list.add(product);
    }

    public List<ProductInCart> getList() {
        return list;
    }

    public void empty() {
        list.clear();
    }

    public int size() {
        return list.size();
    }

    public int search(String productID) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getProduct().getProductid().equals(productID)) {
                return i;
            }
        }
        return -1;
    }

    public ProductInCart get(int index) {
        return list.get(index);
    }

    public void delete(int index) {
        list.remove(index);
    }

    public float sum() {
        float sum = 0;
        for (ProductInCart c : list) {
            sum += c.getQuantity() * (c.getProduct().getPrice() - c.getProduct().getPrice() * (c.getProduct().getDiscount() / 100));
        }
        return sum;
    }
}
