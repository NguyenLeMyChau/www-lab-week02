package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Employee;

import java.util.List;

public class EmployeeRepository {
    private final EntityManager em;
    private final EntityTransaction trans;

    public EmployeeRepository() {
        em = Persistence
                .createEntityManagerFactory("week02")
                .createEntityManager();
        trans = em.getTransaction();
    }
    public List<Employee> findAll(){
        return em.createQuery("select e from Employee e", Employee.class).getResultList();
    }

}
