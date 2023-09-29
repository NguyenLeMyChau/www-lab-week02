package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.connectDB;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class ConnectDB {
    private static ConnectDB instance;
    private EntityManagerFactory emf;

    public ConnectDB() {
        emf = Persistence.createEntityManagerFactory("week02");
    }

    public static ConnectDB getInstance() {
        if (instance == null)
            instance = new ConnectDB();
        return instance;
    }

    public EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }


}