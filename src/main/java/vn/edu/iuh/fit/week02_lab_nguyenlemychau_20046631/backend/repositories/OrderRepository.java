package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order;

import java.util.List;

public class OrderRepository {
    private EntityManager em;
    private EntityTransaction trans;

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

    //Lập Order
    public void insertOrder(Order order){
        try {
            trans.begin();
            em.persist(order);
            trans.commit();
        } catch (Exception e){
            e.printStackTrace();
            trans.rollback();
        }
    }
}
