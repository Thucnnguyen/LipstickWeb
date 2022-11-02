/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Models.Order;
import Models.Product;
import Models.User;
import Models.brand;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Acer
 */
public class DBContext {

    public static Connection getConnection() {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=Lipstick";
        String user = "sa";
        String pass = "12345";
        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    //check user
    public static boolean checkLogin(String account, String password) {

        Connection con = DBContext.getConnection();
        String sql = "select * from  users where account=? and password= ?";
        List<User> list = null;
        User user = new User();
        try {
            list = new ArrayList<>();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, account);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return true;
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //Product
    public static Product getProductByID(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "select * from Products "
                + "where ProductID = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, id);
        ResultSet rs = stm.executeQuery();
        Product pro = null;
        if (rs.next()) {
            pro = new Product();
            pro.setProductid(rs.getString("ProductID"));
            pro.setBrandID(rs.getString("BrandID"));
            pro.setName(rs.getString("ProductName"));
            pro.setDetail(rs.getString("Detail"));
            pro.setPrice(rs.getFloat("price"));
            pro.setDiscount(rs.getFloat("discount"));
            pro.setImages(rs.getString("image"));
        }
        return pro;
    }

    public static int CountProduct() throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "select count(*) from Products ";
        PreparedStatement stm = con.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }

    public static int CountProductSearch(String search) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "select count(*) from Products where ProductName like ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, "%" + search + "%");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }
    
    public static List<Product> searchProduct(String search, String index) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "with x as ( select ROW_NUMBER() over (order by ProductID asc) as stt, *\n"
                + "               from Products where ProductName like ?)\n"
                + "                select * from x where stt between ? *9-8 and ?*9";
        List<Product> list = new ArrayList<>();
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, "%" + search + "%");
        stm.setString(2, index);
        stm.setString(3, index);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Product pro = new Product();
            pro.setProductid(rs.getString("ProductID"));
            pro.setBrandID(rs.getString("BrandID"));
            pro.setName(rs.getString("ProductName"));
            pro.setDetail(rs.getString("Detail"));
            pro.setPrice(rs.getFloat("price"));
            pro.setDiscount(rs.getFloat("discount"));
            pro.setImages(rs.getString("image"));
            list.add(pro);
        }
        return list;

    }

    public static List<Product> getAllProduct() {
        Connection con = DBContext.getConnection();
        String sql = "select * from Products";
        List<Product> list = null;
        try {
            list = new ArrayList<>();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Product pro = new Product();
                pro.setProductid(rs.getString("ProductID"));
                pro.setBrandID(rs.getString("BrandID"));
                pro.setName(rs.getString("ProductName"));
                pro.setDetail(rs.getString("Detail"));
                pro.setPrice(rs.getFloat("price"));
                pro.setDiscount(rs.getFloat("discount"));
                pro.setImages(rs.getString("image"));
                list.add(pro);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static List<Product> getProductByIndex(String index) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "with x as ( select ROW_NUMBER() over (order by ProductID asc) as stt, *\n"
                + "from Products )\n"
                + "select * from x where stt between ? *9-8 and ?*9";
        List<Product> list = new ArrayList<>();
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, index);
        stm.setString(2, index);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Product pro = new Product();
            pro.setProductid(rs.getString("ProductID"));
            pro.setBrandID(rs.getString("BrandID"));
            pro.setName(rs.getString("ProductName"));
            pro.setDetail(rs.getString("Detail"));
            pro.setPrice(rs.getFloat("price"));
            pro.setDiscount(rs.getFloat("discount"));
            pro.setImages(rs.getString("image"));
            list.add(pro);
        }
        con.close();

        return list;
    }

    public static List<Product> getProductByBrand(String index, String brandID) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "with x as ( select ROW_NUMBER() over (order by ProductID asc) as stt, *\n"
                + "               from Products where BrandID = ?)\n"
                + "                select * from x where stt between ? *9-8 and ?*9";
        List<Product> list = new ArrayList<>();
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, brandID);
        stm.setString(2, index);
        stm.setString(3, index);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Product pro = new Product();
            pro.setProductid(rs.getString("ProductID"));
            pro.setBrandID(rs.getString("BrandID"));
            pro.setName(rs.getString("ProductName"));
            pro.setDetail(rs.getString("Detail"));
            pro.setPrice(rs.getFloat("price"));
            pro.setDiscount(rs.getFloat("discount"));
            pro.setImages(rs.getString("image"));
            list.add(pro);
        }
        return list;
    }

    public static int CountProductbyBrand(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "select count(*) from Products where BrandID = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, id);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }

    //Brand
    public static List<brand> getAllBrand() {
        Connection con = DBContext.getConnection();
        String sql = "select * from Brand";
        List<brand> list = null;
        try {
            list = new ArrayList<>();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                brand br = new brand();
                br.setBranID(rs.getString("BrandID"));
                br.setBrandName(rs.getString("BrandName"));
                list.add(br);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void register(String account, String pass, String email, String phone, String location) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "insert into Users(account,Password,email,phonenumber,location) values(?,?,?,?,?)";
        PreparedStatement stm = con.prepareCall(sql);
        stm.setString(1, account);
        stm.setString(2, pass);
        stm.setString(3, email);
        stm.setString(4, phone);
        stm.setString(5, location);
        stm.executeUpdate();
    }

    public static void saveOrder(Order o) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "insert into orders values(?,?,?,?,?)";
        PreparedStatement stm = con.prepareCall(sql);
        stm.setString(1, o.getId());
        stm.setString(2, o.getOwner());
        stm.setString(3, o.getEmail());
        stm.setString(4, o.getPhone());
        stm.setString(5, o.getAddress());
        stm.executeUpdate();
    }
    
    public static void saveOrder_Details(String OID, String PID, int quanity) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "insert into Order_Details values(?,?,?)";
        PreparedStatement stm = con.prepareCall(sql);
        stm.setString(1, OID);
        stm.setString(2, PID);
        stm.setInt(3, quanity);
        stm.executeUpdate();
    }
    
    public static User searchUserByAccount(String account) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "select * from Users where account = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, account);
        ResultSet rs = stm.executeQuery();
        User user = null;
        if (rs.next()) {
            user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
        }
        return user;
    }
    
    public static boolean searchUser(String account) throws SQLException {
        Connection con = DBContext.getConnection();
        String sql = "select * from Users where account = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, account);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return true;
        }
        return false;
    }
}
