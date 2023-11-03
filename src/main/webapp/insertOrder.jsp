<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Order"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.OrderServices" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/6/2023
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Insert Order</title>
    <style>
        body{
            background-color: #176D80;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .frameInsert{
            width: 590px;
            height: 462px;
            background-color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .btnAdd{
            width: 150px;
            height: 50px;
            background-color: #176D80;
            color: white;
            margin: 15px;
            font-size: 25px;
            font-weight: 100;
            border: none;

        }

        h2{
            color: #176D80;
            font-size: 45px;
        }

        input[type=text] {
            width: 300px;
            height: 35px;
            margin-bottom: 10px;
            font-size: 20px;
            padding-left: 20px;
        }

        label{
            font-size: 20px;
        }


        select, option{
            width: 300px;
            height: 35px;
        }


    </style>


</head>
<body>
<%
    OrderServices orderServices = new OrderServices();
    List<Order> orders = orderServices.findAll();

%>

<form action="controls?action=insert_order" method="post">
    <div class="frameInsert">
        <h2>Add Order</h2>
        <table>
            <tr>
                <td><label for="orderId">OrderID</label></td>
                <td><input type="text" name="orderId" id="orderId" value="<%=orders.size() + 1%>" disabled/><br/></td>
            </tr>

            <tr>
                <td><label for="date">Order Date</label></td>
                <td><input type="text" name="date" id="date" value="<%=LocalDateTime.now()%>" disabled/><br/></td>
            </tr>

            <tr>
                <td><label for="cusId">CustomerId</label></td>
                <td><input type="text" name="cusId" id="cusId"/><br/></td>
            </tr>

            <tr>
                <td><label for="empId">EmployeeId</label></td>
                <td><input type="text" name="empId" id="empId"/><br/></td>
            </tr>

        </table>


        <div style="display: flex; flex-direction: row">
            <button type="submit" name="action" value="insert_order" class="btnAdd">ADD</button>
            <button type="reset" value="Clear" class="btnAdd">CLEAR</button>
        </div>

    </div>

</form>

</body>
</html>
