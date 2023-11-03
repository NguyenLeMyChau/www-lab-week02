<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.ProductServices" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Products</title>
    <style>
        .header{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 1456px;
            height: 117px;
            background-color: #176D80;
            color: white;
            font-size: 40px;
            margin-bottom: 50px;
        }

        table{
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }

        th {
            background-color: #176D80;
            color: white;
            padding: 15px;
        }

        td{
            padding: 10px;
        }


        tr:nth-child(even){
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: coral;
        }

        a{
            font-size: 25px;
            text-decoration: none;
        }

        img{
            width: 100px;
            height: 100px;
        }

        input[type=number] {
            width: 50px;
            height: 30px;
            font-size: 16px;
            padding-left: 15px;
        }
    </style>
</head>
<body>
<%
    ProductServices productServices = new ProductServices();
    List<Product> products = productServices.findAll();
%>
<div class="header">
    <label>Products</label>
</div>
<table>
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Price</th>
        <th><a href="insertProduct.jsp" style="color: white">Insert</a> </th>
    </tr>
    <%
        for(Product product: products){
            long id = product.getProduct_id();

    %>
        <tr>
            <td><img src="<%=productServices.getProductImg(id).getPath()%>"></td>
            <td><%=product.getName()%></td>
            <td><%=productServices.getProductPrice(id).getPrice()%></td>
            <td><a href="product_detail.jsp?product_id=<%=id%>">View</a></td>
        </tr>

    <%}%>
</table>
</body>
</html>
