package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.configs;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.connectDB.ConnectDB;

public class Demo {
    public static void main(String[] args) {
        EntityManagerFactory emf = ConnectDB.getInstance().getEntityManagerFactory();

        EntityManager em = emf.createEntityManager();

        EntityTransaction tr = em.getTransaction();
        tr.begin();
        try {

            tr.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tr.rollback();
        }
    }
    }

