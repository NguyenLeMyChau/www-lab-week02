package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.enums.ProductStatus;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.ProductImage;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.ProductPrice;

public class ProductRepository{
    private final EntityManager em;
    private final EntityTransaction trans;

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

    public Product getProduct(long id){
        try {
            trans.begin();
            String query = "select * from product where product_id = ?1";
            Product product = (Product) em.createNativeQuery(query, Product.class)
                    .setParameter(1, id).getSingleResult();
            trans.commit();
            return product;
        } catch (Exception e) {
            trans.rollback();
            logger.error(e.getMessage());
        }
        return null;
    }


    public ProductImage getProductImg(long id){
        try {
        trans.begin();
        String query = "select * from product_image where product_id = ?1";
        ProductImage productImage = (ProductImage) em.createNativeQuery(query, ProductImage.class)
                    .setParameter(1, id).getSingleResult();
        trans.commit();
        return productImage;
    } catch (Exception e) {
        trans.rollback();
        logger.error(e.getMessage());
    }
        return null;
    }

    public ProductPrice getProductPrice(long id){
        try {
            trans.begin();
            String query = "select * from product_price where product_id = ?1";
            ProductPrice productPrice = (ProductPrice) em.createNativeQuery(query, ProductPrice.class)
                    .setParameter(1, id).getSingleResult();
            trans.commit();
            return productPrice;
        } catch (Exception e) {
            trans.rollback();
            logger.error(e.getMessage());
        }
        return null;
    }

//    public List<Object[]> getListProduct(){
//
//        try {
//            trans.begin();
//
//            String query = "SELECT path, name, price " +
//                    "FROM product p " +
//                    "JOIN product_image pi ON p.product_id = pi.product_id " +
//                    "JOIN product_price pp ON p.product_id = pp.product_id";
//
//            List<Object[]> products = em.createNativeQuery(query, Object[].class).getResultList();
//            trans.commit();
//            return  products;
//        } catch (Exception e) {
//            trans.rollback();
//            logger.error(e.getMessage());
//        }
//        return null;
//    }

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
        String query = "select * from product where product_id = ?1";
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
