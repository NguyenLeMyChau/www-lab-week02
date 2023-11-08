package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.frontend.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.enums.ProductStatus;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.ProductServices;

import java.util.ArrayList;
import java.util.List;

public class ProductModel {
    private final ProductServices services = new ProductServices();

    public void insertProduct(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        String name = req.getParameter("name");
        String desc = req.getParameter("desc");
        String unit = req.getParameter("unit");
        String manu = req.getParameter("manu");
        String status = req.getParameter("status");

        Product product = new Product(name,desc,unit,manu, ProductStatus.valueOf(status));
        services.insertProduct(product);
        resp.sendRedirect("products.jsp");
    }

    public void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws Exception{
            long id = Long.parseLong(req.getParameter("id"));
            services.updateStatus(id, ProductStatus.IN_ACTIVE);
            resp.sendRedirect("products.jsp");
    }

    public void addCart(HttpServletRequest request, HttpServletResponse response) throws Exception{
        List<Product> productList = (List<Product>) request.getSession().getAttribute("products");

        List<Integer> quantity = (List<Integer>) request.getSession().getAttribute("quantity");

        List<Long> listId = (List<Long>) request.getSession().getAttribute("listId");;

        if(productList == null && quantity == null){

            productList = new ArrayList<>();
            quantity = new ArrayList<>();
            listId = new ArrayList<>();

            int quantity1 = Integer.parseInt(request.getParameter("quantity"));
            quantity.add(quantity1);

            long id = Long.parseLong(request.getParameter("product_id"));
            productList.add(new Product(id));

            listId.add(id);

            request.getSession().setAttribute("products", productList);
            request.getSession().setAttribute("quantity", quantity);
            request.getSession().setAttribute("listId", listId);


            response.sendRedirect("products.jsp");

        }

        else{
            long id = Long.parseLong(request.getParameter("product_id"));

            int quantity1 = Integer.parseInt(request.getParameter("quantity"));

            Product p = new Product(id);


            if(listId.contains(id)){
                int index = listId.indexOf(id);
                quantity.set(index, quantity.get(index) + quantity1);
            }
            else{
                quantity.add(quantity1);
                assert productList != null;
                productList.add(p);
                listId.add(id);
            }

            request.getSession().setAttribute("products", productList);
            request.getSession().setAttribute("quantity", quantity);
            request.getSession().setAttribute("listId", listId);

            response.sendRedirect("products.jsp");

        }
    }

    public void deleteCart(HttpServletRequest request, HttpServletResponse response) throws Exception{
        List<Product> productList = (List<Product>) request.getSession().getAttribute("products");

        List<Integer> quantity = (List<Integer>) request.getSession().getAttribute("quantity");

        List<Long> listId = (List<Long>) request.getSession().getAttribute("listId");;

        long id = Long.parseLong(request.getParameter("product_id"));

        productList.remove(listId.indexOf(id));
        quantity.remove(listId.indexOf(id));
        listId.remove(id);

        response.sendRedirect("cart.jsp");
    }
}
