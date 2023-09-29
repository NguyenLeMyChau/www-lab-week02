<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.ProductServices" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.enums.ProductStatus" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 9/23/2023
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ProductServices productServices = new ProductServices();
    List<Product> products = productServices.findAll();
%>
<table width="70%" align="center" border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Unit</th>
        <th>Manufacturer:</th>
        <th>Status</th>
        <th colspan="2"><a href="insertProduct.jsp">Insert</a> </th>
    </tr>
    <%
        for(Product product: products){
        long id = product.getProduct_id();

        String delete_string = "controls?action=delete_product&id="+id;
        String edit_string = "controls?action=edit_product&id="+id;
    %>
    <tr>
        <td><%=id%></td>
        <td><%=product.getName()%></td>
        <td><%=product.getDescription()%></td>
        <td><%=product.getUnit()%></td>
        <td><%=product.getManufacturer()%></td>
        <td><%=product.getStatus()%></td>
        <td><a href=>Update</a> </td>
        <td><a href=<%=delete_string%>>Delete</a> </td>
    </tr>

    <%}%>
</table>
</body>
</html>
