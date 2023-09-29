package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.enums.ProductStatus;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProductRepository{
    private EntityManager em;
    private EntityTransaction trans;

    private final Logger logger = LoggerFactory.getLogger(this.getClass().getName());

    public ProductRepository() {
        em = Persistence
                .createEntityManagerFactory("week02")
                .createEntityManager();
        trans = em.getTransaction();
    }

    public List<Product> findAll() {
        return em.createQuery("select p from Product p where p.status = ?1", Product.class)
                .setParameter(1, ProductStatus.ACTIVE)
                .getResultList();
    }

    public void insertProduct(Product product){
        try {
            trans.begin();
            em.persist(product);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            logger.error(e.getMessage());
        }
    }
    public void updateStatus(long id, ProductStatus status) {
        String query = "SELECT * FROM product WHERE product_id = ?1";
         Product product = (Product) em.createNativeQuery(query, Product.class)
                .setParameter(1, id).getSingleResult();
        product.setStatus(status);
        try {
            trans.begin();
            em.merge(product);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            logger.error(e.getMessage());
        }
    }


}
