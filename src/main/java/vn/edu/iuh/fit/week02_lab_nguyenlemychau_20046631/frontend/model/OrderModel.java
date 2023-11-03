package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.frontend.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Customer;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Employee;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices;

import java.time.LocalDateTime;
import java.util.List;

public class OrderModel {
    private final OrderServices services = new OrderServices();
    List<Order> orders = services.findAll();

    public void insertOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{


        String cusId = request.getParameter("cusId");
        String empId = request.getParameter("empId");


        Customer customer = new Customer(Long.parseLong(cusId));

        Employee employee = new Employee(Long.parseLong(empId));

        Order order = new Order(orders.size() + 1, LocalDateTime.now(), employee, customer);

        services.insertOrder(order);

        response.sendRedirect("orders.jsp");
    }
}
