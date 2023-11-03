<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories.CustomerRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Customer" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/31/2023
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Customers</title>

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
            CustomerRepository customerRepository = new CustomerRepository();
            List<Customer> customers = customerRepository.findAll();
        %>
        <div class="header">
            <label>Customers</label>
        </div>
        <table>
            <tr>
                <th>CustomerId</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
            </tr>

            <%
                for (Customer customer : customers){
                    long cusId = customer.getId();
            %>

            <tr>
                <td><%=cusId%></td>
                <td><%=customer.getName()%></td>
                <td><%=customer.getEmail()%></td>
                <td><%=customer.getPhone()%></td>
                <td><%=customer.getAddress()%></td>
            </tr>

            <%}%>
        </table>
</body>
</html>
