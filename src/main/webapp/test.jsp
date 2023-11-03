<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories.ProductRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.ProductImage" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/31/2023
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        img{
            width: 100px;
            height: 100px;
        }

    </style>
</head>
<body>
    <%
        ProductRepository productRepository = new ProductRepository();
        List<ProductImage> list = productRepository.findAllPI();
    %>

    <table>
        <tr>
            <th>ImageID</th>
            <th>Note</th>
            <th>Image</th>
            <th>ProductId</th>
        </tr>
        <%
            for (ProductImage productImage : list){


        %>
        <tr>
           <td><%=productImage.getImage_id()%></td>
            <td><%=productImage.getAlternative()%></td>
            <td><img src="<%=productImage.getPath()%>"></td>
            <td><%=productImage.getProduct().getProduct_id()%></td>

        </tr>

        <%}%>

    </table>
</body>
</html>
