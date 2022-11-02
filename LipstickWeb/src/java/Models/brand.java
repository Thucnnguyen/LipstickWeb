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
public class brand {
    private String branID;
    private String brandName;

    public brand() {
    }

    public brand(String branID, String brandName) {
        this.branID = branID;
        this.brandName = brandName;
    }

    public String getBranID() {
        return branID;
    }

    public void setBranID(String branID) {
        this.branID = branID;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
    
}
