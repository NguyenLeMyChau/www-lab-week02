<%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 9/27/2023
  Time: 10:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Insert Product</title>
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
            width: 350px;
            height: 40px;
            margin-bottom: 10px;
            font-size: 20px;
            padding-left: 20px;
        }

        label{
            font-size: 20px;
        }


        select{
            width: 300px;
            height: 30px;
        }

    </style>
</head>
<body>
    <form action="controls?action=insert_products" method="post">
        <div class="frameInsert">
            <h2>Add Order</h2>
            <table>
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input type="text" name="name" id="name"/></td>
                </tr>

                <tr>

                    <td><label for="desc">Description</label></td>
                    <td><input type="text" name="desc" id="desc"/></td>
                </tr>

                <tr>
                    <td><label for="unit">Unit</label></td>
                    <td><input type="text" name="unit" id="unit"/></td>
                </tr>

                <tr>
                    <td><label for="manu">Manufacturer</label></td>
                    <td><input type="text" name="manu" id="manu"/></td>
                </tr>

                <tr>
                    <td><label for="status">Status</label></td>
                    <td>
                        <select name="status" id="status">
                            <option label="ACTIVE" >ACTIVE</option>
                            <option label="IN_ACTIVE">IN_ACTIVE</option>
                            <option label="TERMINATED">TERMINATED</option>
                        </select>
                    </td>
                </tr>
            </table>

            <div style="display: flex; flex-direction: row">
                <button type="submit" name="action" value="" class="btnAdd">ADD</button>
                <button type="reset" class="btnAdd">CLEAR</button>
            </div>

        </div>

    </form>
</body>
</html>
