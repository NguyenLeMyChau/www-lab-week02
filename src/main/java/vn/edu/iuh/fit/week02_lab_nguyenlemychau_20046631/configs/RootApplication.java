package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.configs;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.connectDB.ConnectDB;

@ApplicationPath("/api")
public class RootApplication extends Application {
    EntityManagerFactory emf = ConnectDB.getInstance().getEntityManagerFactory();

    EntityManager em = emf.createEntityManager();
}
