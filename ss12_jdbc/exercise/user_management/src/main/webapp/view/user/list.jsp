<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 26/08/2022
  Time: 2:04 CH
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
<div class="px-5">
<h3>DANH SÁCH NGƯỜI DÙNG</h3>

<a href="/user?action=create">+ Thêm mới người dùng</a>

<%--<form action="/user">--%>
<%--    <input type="text" name="nameSearch">--%>
<%--    <input type="submit" name="action" value="search">--%>
<%--</form>--%>

<table class="table table-striped" border="1">
    <tr>
        <th>Id</th>
        <th>Tên người dùng</th>
        <th>Email</th>
        <th>Quốc gia</th>
        <th></th>
        <th></th>
        <th></th>
    </tr>

    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a href="/user?action=edit&id=${user.getId()}">
                <button class="btn btn-primary btn-sm">Chỉnh sửa</button></a></td>
            <td><a href="/user?action=delete&id=${user.getId()}">
                <button class="btn btn-danger btn-sm">Xóa</button></a></td>
            <td><a href="/user?action=view&id=${user.getId()}">
                <button class="btn btn-success btn-sm">Thông tin</button></a></td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
