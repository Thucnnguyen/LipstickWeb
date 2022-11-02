/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Acer
 */
public class Product {
    private String productid;
    private String BrandID;
    private String name;
    private double price;
    private double discount;
    private String detail;
    private String images;

    public Product() {
    }

    public Product(String Productid, String BrandID, String name, double price, double discount, String detail, String images) {
        this.productid = Productid;
        this.BrandID = BrandID;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.detail = detail;
        this.images = images;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String Productid) {
        this.productid = Productid;
    }

    public String getBrandID() {
        return BrandID;
    }

    public void setBrandID(String BrandID) {
        this.BrandID = BrandID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
    
}
