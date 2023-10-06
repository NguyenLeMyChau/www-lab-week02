package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.frontend.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.frontend.model.OrderModel;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.frontend.model.ProductModel;

import java.io.IOException;
@WebServlet("/controls")
public class ServletController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Object actionObject = req.getParameter("action");
            if (actionObject != null) {
                String action = actionObject.toString();
                if (action.equals("delete_product")) {
                    ProductModel pm = new ProductModel();
                    pm.deleteProduct(req, resp);
                }
            } else {
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Object actionObject = req.getParameter("action");
            if (actionObject != null) {
                String action = actionObject.toString();

                if(action.equals("insert_products")){
                    ProductModel pm = new ProductModel();
                    pm.insertProduct(req, resp);
                }

                else if (action.equals("delete_product")) {
                    ProductModel pm = new ProductModel();
                    pm.deleteProduct(req, resp);
                }

                else if (action.equals("insert_order")) {
                    OrderModel om = new OrderModel();
                    om.insertOrder(req, resp);
                }

            } else {
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
