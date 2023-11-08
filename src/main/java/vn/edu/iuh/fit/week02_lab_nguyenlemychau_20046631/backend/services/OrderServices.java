package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services;

import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.OrderDetail;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories.OrderRepository;

import java.util.List;

public class OrderServices {
    private final OrderRepository orderRepository;

    public OrderServices() {
        this.orderRepository = new OrderRepository();
    }

    public List<Order> findAll(){
        return orderRepository.findAll();
    }

    public Order getOrder(long id) {
        return orderRepository.getOrder(id);
    }

    public List<OrderDetail> getListOrderDetailFromId(long id) {
        return orderRepository.getListOrderDetailFromId(id);
    }

    public void insertOrder(Order order){
        orderRepository.insertOrder(order);
    }

    public void insertOrderDetail(OrderDetail orderDetail){
        orderRepository.insertOrderDetail(orderDetail);
    }


}
