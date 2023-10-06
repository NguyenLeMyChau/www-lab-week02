<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
Created by IntelliJ IDEA.
  User: CHAU
  Date: 9/30/2023
  Time: 12:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
</head>
<body>
<%
    OrderServices orderServices = new OrderServices();
    List<Order> orders = orderServices.findAll();

%>
<table width="70%" align="center" border="1">
    <tr>
        <th>Order ID</th>
        <th>Order Date</th>
        <th>Customer ID</th>
        <th>Employee ID</th>
        <th colspan="2"><a href="insertOrder.jsp">Insert</a> </th>
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
