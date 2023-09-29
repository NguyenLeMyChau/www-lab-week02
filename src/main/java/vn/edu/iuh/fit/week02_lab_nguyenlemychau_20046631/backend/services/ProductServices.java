package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services;

import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.enums.ProductStatus;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories.ProductRepository;

import java.util.List;

public class ProductServices {
    private final ProductRepository repository;

    public ProductServices() {
        repository = new ProductRepository();
    }

    public List<Product> findAll(){
        return repository.findAll();
    }

    public void insertProduct(Product product){
        repository.insertProduct(product);
    }

    public void updateStatus(long id, ProductStatus status){
         repository.updateStatus(id, status);
    }


}
