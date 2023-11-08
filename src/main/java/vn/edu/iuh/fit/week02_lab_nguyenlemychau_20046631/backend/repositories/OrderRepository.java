package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.OrderDetail;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product;

import java.util.List;

public class OrderRepository {
    private final EntityManager em;
    private final EntityTransaction trans;

    public OrderRepository() {
        em = Persistence
                .createEntityManagerFactory("week02")
                .createEntityManager();
        trans = em.getTransaction();
    }

    //FindAll
    public List<Order> findAll(){
        return em.createQuery("select o from Order o", Order.class).getResultList();
    }

    //getOrder theo ID
    public Order getOrder(long id){
        try {
            trans.begin();
            String query = "select * from orders where order_id = ?1";
            Order order = (Order) em.createNativeQuery(query, Order.class)
                    .setParameter(1, id).getSingleResult();
            trans.commit();
            return order;
        } catch (Exception e) {
            trans.rollback();
        }
        return null;
    }
    public List<OrderDetail> getListOrderDetailFromId(long id){
        try {
            trans.begin();
            String query = "select * from order_detail where order_id = ?1";
            List<OrderDetail> orderDetails = (List<OrderDetail>) em.createNativeQuery(query, OrderDetail.class)
                    .setParameter(1, id).getResultList();
            trans.commit();
            return orderDetails;
        } catch (Exception e) {
            trans.rollback();
        }
        return null;
    }

    //Lập Order
    public void insertOrder(Order order){
        try {
            trans.begin();
            em.persist(order);
            trans.commit();
        } catch (Exception e){
            e.printStackTrace();
            trans.rollback();
        }finally {
            em.close();
        }
    }

    public void insertOrderDetail(OrderDetail orderDetail){
        try {
            trans.begin();
            em.persist(orderDetail);
            trans.commit();
        } catch (Exception e){
            e.printStackTrace();
            trans.rollback();
        }finally {
            em.close();
        }
    }
}
