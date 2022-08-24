<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 24/08/2022
  Time: 12:04 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Display</title>
</head>
<body>
<h3 style="width: 30%; text-align: center">Danh sách khách hàng</h3>
<table style="border: solid 3px; width: 30%" border="1" cellpadding="2" cellspacing="2">
    <tr style="magin-top: solid 1px">
        <th>ID</th>
        <th>Name</th>
        <th>Date of Birth</th>
        <th>Address</th>
        <th>Image</th>
    </tr>

    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td style="text-align: center">${customer.id}</td>
            <td>${customer.name}</td>
            <td style="text-align: center">${customer.dateOfBirth}</td>
            <td>${customer.address}</td>
            <td style="text-align: center"><img src="${customer.image}" alt="" style="width: 60px"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>