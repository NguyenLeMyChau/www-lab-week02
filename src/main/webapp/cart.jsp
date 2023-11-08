<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories.ProductRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.ProductImage" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product" %>
<%@ page import="java.util.Collections" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.ProductServices" %>
<%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/31/2023
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <style>
        img{
            width: 100px;
            height: 100px;
        }

        table{
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            margin-bottom: 100px;
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

        input[type=text], input[type="text"]:focus {
            font-size: 20px;
            border: none transparent;
            background: transparent;
            text-align: center;
            outline: 0
        }

        input[type=number] {
            width: 50px;
            height: 30px;
            font-size: 20px;
            text-align: center;
        }

        label{
            font-size: 35px;
            color: white;
        }

        .frameTotal{
            width: 100%;
            height: 100px;
            background-color: #176D80;
            justify-content: center;
            bottom: 0;
            position: fixed;
        }

        .btnDelete{
            font-size: 25px;
            border: none transparent;
            background: transparent;
        }

        .btnAdd{
            width: 100px;
            height: 30px;
            background-color: white;
            color: #176D80;
            font-size: 25px;
            font-weight: 100;
            border: none;
        }

    </style>
</head>
<body>
<%
    ProductServices productServices = new ProductServices();

    List<Product> products = (List<Product>) request.getSession().getAttribute("products");
    List<Integer> quantitys = (List<Integer>) request.getSession().getAttribute("quantity");

    double total = 0;

%>

<table>
    <tr>
        <th>Image</th>
        <th>ProductId</th>
        <th>ProductName</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Delete</th>
    </tr>
    <%
        if(products != null){
            for (int i = 0; i < products.size(); i++){
                long id = products.get(i).getProduct_id();
                Product product1 = productServices.getProduct(id);
                total += productServices.getProductPrice(id).getPrice() * quantitys.get(i);
    %>
    <tr>
        <td><img src="<%=productServices.getProductImg(id).getPath()%>"></td>
        <td><input type="text" name="product_id" id="product_id" value="<%=id%>" readonly></td>
        <td><%=product1.getName()%></td>
        <td><%=productServices.getProductPrice(id).getPrice()%></td>
        <td><input type="number" name="quantity" id="quantity" value="<%=quantitys.get(i)%>"></td>
        <td>
            <form action="controls?action=deleteCart&product_id=<%=id%>" method="post">
                <button type="submit" name="action" class="btnDelete">Delete</button>
            </form>
        </td>
        <%}
        }%>

    </tr>

</table>

<div class="frameTotal">
    <label>Total:</label>
    <input style="color: white; font-size: 35px; text-align: left;" type="text" value="<%=total%>">

    <form action="controls" method="post">
        <button type="submit" name="action" class="btnAdd" value="insert_order">Pay Now</button>
    </form>

</div>
</body>
</html>
