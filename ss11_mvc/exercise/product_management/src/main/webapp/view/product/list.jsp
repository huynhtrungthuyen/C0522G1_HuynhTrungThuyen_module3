<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 24/08/2022
  Time: 10:47 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Products List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h3>DANH SÁCH SẢN PHẨM</h3>

<a href="/product?action=create">+ Thêm sản phẩm mới</a>

<form action="/product">
    <input type="text" name="nameSearch">
    <input type="submit" name="action" value="search">
</form>

<table class="table table-striped">
    <tr>
        <th>Id</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th></th>
        <th></th>
        <th></th>
    </tr>

    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">
                <button class="btn btn-primary btn-sm">Chỉnh sửa</button></a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">
                <button class="btn btn-danger btn-sm">Xóa</button></a></td>
            <td><a href="/product?action=view&id=${product.getId()}">
                <button class="btn btn-success btn-sm">Thông tin</button></a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>