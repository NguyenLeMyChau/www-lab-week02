
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Main Screen</title>

    <style>
    .nav{
      display: flex;
      width: 1440px;
      height: 117px;
      background-color: #176D80;
      align-items: center;
      padding-left: 30px;
    }

    a{
      color: white;
      font-size: 25px;
      text-decoration: none;
      margin: 20px;
    }

    .content{
      display: flex;
      width: 1340px;
      height: 553px;
      align-items: center;
      justify-content: center;
    }

    label{
      font-size: 50px;
    }

  </style>
</head>
<body>
      <div class="nav">
        <a href="products.jsp">Product</a>
        <a href="orders.jsp">Order</a>
        <a href="employees.jsp">Employee</a>
        <a href="customers.jsp">Customer</a>
        <a href="test.jsp">Cart</a>
          <a href="product_detail.jsp">productdetail</a>

      </div>

      <div class="content">
        <label>WWW - Week02 <br>
          Nguyễn Lê Mỹ Châu - 20046631</label>
      </div>
</body>
</html>