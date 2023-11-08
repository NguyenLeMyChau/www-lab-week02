<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.OrderDetail" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.ProductServices" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 11/9/2023
  Time: 12:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Detail</title>
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
    </style>
</head>
<body>
<%
    OrderServices orderServices = new OrderServices();
    ProductServices productServices = new ProductServices();

    long id = Long.parseLong(request.getParameter("order_id"));
    Order order = orderServices.getOrder(id);
    List<OrderDetail> orderDetails = orderServices.getListOrderDetailFromId(id);
%>

<table>
    <tr>
        <th>Order ID</th>
        <th>Order Date</th>
        <th>Customer ID</th>
        <th>Employee ID</th>
    </tr>

    <tr>
        <td><%=order.getOrder_id()%></td>
        <td><%= DateTimeFormatter.ofPattern("dd/MM/yyyy").format(order.getOrderDate())%></td>
        <td><%=order.getCustomer().getId()%></td>
        <td><%=order.getEmployee().getId()%></td>
    </tr>
</table>

<table>
    <tr>
        <th>Image</th>
        <th>ProductID</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Note</th>
    </tr>

    <%
        for(OrderDetail orderDetail : orderDetails){
            long productId = orderDetail.getProduct().getProduct_id();

    %>
    <tr>
        <td><img src="<%=productServices.getProductImg(productId).getPath()%>"></td>
        <td><%=productId%></td>
        <td><%=orderDetail.getQuantity()%></td>
        <td><%=orderDetail.getPrice()%></td>
        <td><%=orderDetail.getNote()%></td>
    </tr>

    <%}%>
</table>

</body>
</html>
