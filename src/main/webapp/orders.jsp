<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Order</title>

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
    </style>
</head>
<body>
<%
    OrderServices orderServices = new OrderServices();
    List<Order> orders = orderServices.findAll();

%>
<div class="header">
    <label>Orders</label>
</div>
<table>
    <tr>
        <th>Order ID</th>
        <th>Order Date</th>
        <th>Customer ID</th>
        <th>Employee ID</th>
        <th colspan="2"><a href="insertOrder.jsp" style="color: white">Insert</a> </th>
    </tr>

    <%
    for (Order order : orders){
    %>

    <tr>
        <td><%=order.getOrder_id()%></td>
        <td><%= DateTimeFormatter.ofPattern("dd/MM/yyyy").format(order.getOrderDate())%></td>
        <td><%=order.getCustomer().getId()%></td>
        <td><%=order.getEmployee().getId()%></td>
    </tr>

    <%}%>

</table>
</body>
</html>
