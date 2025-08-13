<%-- 
    Document   : display
    Created on : 12 Aug, 2025
    Author     : Admin
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>

    <script>
        function confirmGo(message, url) {
            if (confirm(message)) {
                window.location = url;
            }
        }
    </script>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            padding: 40px;
            color: #333;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        table {
            margin: auto;
            width: 80%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 16px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #34495e;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            color: #2980b9;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .actions a {
            margin: 0 5px;
        }

        .nav-links {
            text-align: center;
            margin-top: 25px;
        }

        .nav-links a {
            margin: 0 15px;
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }

        .nav-links a:hover {
            background-color: #1a5276;
        }
    </style>
</head>
<body>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root" password="" />

<sql:query dataSource="${db}" var="result">
    SELECT * FROM product
</sql:query>

<h2>Product List</h2>

<c:choose>
    <c:when test="${not empty result.rows}">
        <table>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td>${row.product_id}</td>
                    <td>${row.product_name}</td>
                    <td>${row.product_quantity}</td>
                    <td class="actions">
                        <a href="update.jsp?product_id=${row.product_id}&product_name=${row.product_name}&product_quantity=${row.product_quantity}">Update</a>
                        <a href="javascript:void(0);" onclick="confirmGo('Are you sure you want to delete product ${row.product_name}?', 'deletedb.jsp?product_id=${row.product_id}')">Delete</a>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p style="text-align: center; color: #888;">No product records found.</p>
    </c:otherwise>
</c:choose>

<div class="nav-links">
    <a href="insert.jsp">Add New Product</a>
    <a href="index.html">Home</a>
</div>

</body>
</html>
