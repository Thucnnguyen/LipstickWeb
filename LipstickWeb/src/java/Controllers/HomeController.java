/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Dao.DBContext;
import Models.Cart;
import Models.Order;
import Models.Product;
import Models.ProductInCart;
import Models.User;
import Models.brand;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = (String) request.getAttribute("action");
        System.out.println(action);
        switch (action) {
            case "homePage":
                showHomePage(request, response);
                break;
            case "buy":
                buy(request, response);
                break;
            case "showCart":
                showCart(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "checkout":
                checkout(request, response);
                break;
            case "detail":
                showProduct(request, response);
                break;
            case "thankyou":
                thankyou(request, response);
                break;
        }

    }

    public void showProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String productid = request.getParameter("productid");
            Product product = DBContext.getProductByID(productid);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/WEB-INF/Layers/show.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brandID = request.getParameter("brandID");
        List<Product> productList;
        HttpSession session = request.getSession();
        int pageSize = 9;
        if (brandID == null) {
            try {

                int count = DBContext.CountProduct();
                int endPages = count / pageSize;
                if ((count % pageSize) != 0) {
                    endPages++;
                }
                String index = request.getParameter("index");
                if (index == null) {
                    index = "1";
                }
                productList = DBContext.getProductByIndex(index);
                List<brand> BrandList = DBContext.getAllBrand();
                request.setAttribute("listProduct", productList);
                request.setAttribute("listBrand", BrandList);
                session.setAttribute("endPages", endPages);

            } catch (SQLException ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                int count = DBContext.CountProductbyBrand(brandID);
                int endPages = count / pageSize;
                if ((count % pageSize) != 0) {
                    endPages++;
                }
                String index = request.getParameter("index");
                if (index == null) {
                    index = "1";
                }
                productList = DBContext.getProductByBrand(index, brandID);
                List<brand> BrandList = DBContext.getAllBrand();
                request.setAttribute("brandID", brandID);
                request.setAttribute("listBrand", BrandList);
                request.setAttribute("listProduct", productList);
                session.setAttribute("endPages", endPages);
            } catch (SQLException ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }

    public static void buy(HttpServletRequest request, HttpServletResponse response) {
        try {
            String productID = request.getParameter("productID");
            Product product = DBContext.getProductByID(productID);
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            int checkExist = cart.search(productID);
            if (checkExist == -1) {
                cart.add(new ProductInCart(product, 1));
            } else {
                cart.get(checkExist).setQuantity(cart.get(checkExist).getQuantity() + 1);
            }
            int quantity = 0;
            for (int i = 0; i < cart.size(); i++) {
                quantity += cart.get(i).getQuantity();
            }
            session.setAttribute("quantity", quantity);
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("/home/homePage.do").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void showCart(HttpServletRequest request, HttpServletResponse response) {
        try {
            String productID = request.getParameter("productID");
            System.out.println();
            if (productID == null) {
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                request.setAttribute("user", user);
                request.getRequestDispatcher("/WEB-INF/Layers/show.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("cart");
                int index = cart.search(productID);
                int quantity = (int) session.getAttribute("quantity");
                session.setAttribute("quantity", quantity - cart.get(index).getQuantity());
                cart.delete(index);
                request.getRequestDispatcher("/WEB-INF/Layers/show.jsp").forward(request, response);
            }
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void search(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            int pageSize = 9;
            String search = request.getParameter("Search");
            int count = DBContext.CountProductSearch(search);
            int endPages = count / pageSize;
            if ((count % pageSize) != 0) {
                endPages++;
            }
            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }
            List<Product> productList = DBContext.searchProduct(search, index);
            request.setAttribute("listProduct", productList);
            List<brand> BrandList = DBContext.getAllBrand();
            request.setAttribute("listBrand", BrandList);
            request.setAttribute("Search", search);
            session.setAttribute("endPages", endPages);
            request.setAttribute("controller", "home");
            request.setAttribute("action", "homePage");
            request.getRequestDispatcher("/WEB-INF/Layers/main.jsp").forward(request, response);
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void checkout(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            String owner = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String words = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxyz";
            int length = 5;
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < length; i++) {
                int index = (int) (words.length() * Math.random());
                sb.append(words.charAt(index));
            }
            String id = sb.toString();
            try {
                Order o = new Order(id, owner, email, phone, address);
                DBContext.saveOrder(o);
                for (ProductInCart p : cart.getList()) {
                    System.out.println(p.getQuantity());
                    DBContext.saveOrder_Details(id, p.getProduct().getProductid(), p.getQuantity());
                }
            } catch (SQLException ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("cart", null);
            session.setAttribute("quantity", null);
            request.getRequestDispatcher("/home/thankyou.do").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void thankyou(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Layers/show.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
