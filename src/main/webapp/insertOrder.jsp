<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/6/2023
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        OrderServices orderServices = new OrderServices();
        List<Order> orders = orderServices.findAll();

    %>

    <title>Insert Order</title>
    <form action="controls?action=insert_order" method="post">
        OrderID: <input name="orderId" value="<%=orders.size() + 1%>" disabled /><br/>
        Order Date:<input name="date" value="<%=LocalDateTime.now()%>" disabled/><br/>
        Customer Id: <input name="cusId"/><br/>
        EmployeeId: <input name="empId"/><br/>

        <input type="submit" value="Insert"/>
        <input type="reset" value="Clear"/>
    </form>
</head>
<body>
</body>
</html>
