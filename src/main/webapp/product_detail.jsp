<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.services.ProductServices" %>
<%@ page import="vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.models.Product" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Product Detail</title>
    <style>
        body{
            background-color: #176D80;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .frameInformatiuon{
            width: 500px;
            height: 500px;
            background-color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }


        table{
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }

        th,td{
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
            width: 100%;
            height: 100%;
        }

        input[type=number] {
            width: 50px;
            height: 30px;
            font-size: 16px;
            padding-left: 15px;
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

    </style>
</head>
<body>
        <%
            ProductServices productServices = new ProductServices();

            long id = Long.parseLong(request.getParameter("product_id"));

            Product product = productServices.getProduct(id);
        %>
        <div style="display: flex; flex-direction: row">
            <div class="frameInformatiuon" style="margin-left: 100px">
                <img src="<%=productServices.getProductImg(id).getPath()%>" alt="#">
            </div>

            <div class="frameInformatiuon" style="margin-left: 250px">
                    <table>
                        <tr>
                            <th>ProductId</th>
                            <td><%=id%></td>
                        </tr>

                        <tr>
                            <th>Name</th>
                            <td><%=product.getName()%></td>
                        </tr>

                        <tr>
                            <th>Price</th>
                            <td><%=productServices.getProductPrice(id).getPrice()%></td>
                        </tr>

                        <tr>
                            <th>Description</th>
                            <td><%=product.getDescription()%></td>
                        </tr>

                        <tr>
                            <th>Manufacturer Name</th>
                            <td><%=product.getManufacturer()%></td>
                        </tr>

                        <tr>
                            <th>Unit</th>
                            <td><%=product.getUnit()%></td>
                        </tr>

                        <tr>
                            <th><label for="quantity">Quantity</label></th>
                            <td><input type="number" name="quantity" id="quantity"></td>
                        </tr>

                    </table>

                <button class="btnAdd">ADD CART</button>

            </div>

        </div>







</body>
</html>
