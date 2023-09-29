package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.resources;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Response;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order;
import vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices;

import java.util.List;

@Path("/orders")
public class OrderResources {
    private final OrderServices orderServices = new OrderServices();

    @GET
    @Produces("application/json")
    public Response getAll(){
        List<Order> lst = orderServices.findAll();
        return Response.ok(lst).build();
    }

}
