package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.frontend.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.*;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.ProductServices;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrderModel {
    private final OrderServices services = new OrderServices();
    List<Order> orders = services.findAll();

    public void insertOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ProductServices productServices = new ProductServices();

//        String cusId = request.getParameter("cusId");
//        String empId = request.getParameter("empId");
//
        Customer customer = new Customer(2);

        Employee employee = new Employee(3);

        List<Product> productList = (List<Product>) request.getSession().getAttribute("products");

        System.out.println("productList" + productList);

        List<Integer> quantityList = (List<Integer>) request.getSession().getAttribute("quantity");

        List<OrderDetail> orderDetails = new ArrayList<>();

        System.out.println("quantityList" + quantityList);

        System.out.println("ordersize" + orders.size());

        int orderSize = orders.size()+1;

        Order order = new Order(orderSize,LocalDateTime.now(), employee, customer);


        for (int i = 0; i < productList.size(); i++){
            double price = productServices.getProductPrice(productList.get(i).getProduct_id()).getPrice();
            OrderDetail od = new OrderDetail(quantityList.get(i), price*quantityList.get(i), "", new Order(orderSize), productList.get(i));
            orderDetails.add(od);
        }

        order.setOrderDetails(orderDetails);
        services.insertOrder(order);



        response.sendRedirect("orders.jsp");
    }
}
