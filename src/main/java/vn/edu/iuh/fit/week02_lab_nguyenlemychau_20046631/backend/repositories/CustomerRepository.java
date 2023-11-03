package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Customer;

import java.util.List;

public class CustomerRepository {
    private final EntityManager em;
    private final EntityTransaction trans;

    public CustomerRepository() {
        em = Persistence
                .createEntityManagerFactory("week02")
                .createEntityManager();
        trans = em.getTransaction();
    }
    public List<Customer> findAll(){
        return em.createQuery("select c from Customer c", Customer.class).getResultList();
    }
}
