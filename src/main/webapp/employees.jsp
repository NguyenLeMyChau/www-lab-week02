<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.repositories.EmployeeRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Employee" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/31/2023
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Employees</title>

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
            EmployeeRepository employeeRepository = new EmployeeRepository();
            List<Employee> employees = employeeRepository.findAll();
        %>
        <div class="header">
            <label>Employees</label>
        </div>
        <table>
            <tr>
                <th>EmployeeId</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Birthday</th>
                <th>Address</th>
            </tr>

            <%
                for(Employee employee : employees){
                    long empId = employee.getId();
            %>
            <tr>
                <td><%=empId%></td>
                <td><%=employee.getFullname()%></td>
                <td><%=employee.getEmail()%></td>
                <td><%=employee.getPhone()%></td>
                <td><%=DateTimeFormatter.ofPattern("dd/MM/yyyy").format(employee.getDob())%></td>
                <td><%=employee.getAddress()%></td>
            </tr>

            <%}%>
        </table>
</body>
</html>
