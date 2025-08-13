<%-- 
    Document   : deletedb
    Created on : 12 Aug, 2025
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <title>Delete Product</title>
    <script>
        function goBack(){
            window.location = "display.jsp";
        }
    </script>
</head>
<body>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root" password="" />

<c:choose>
    <c:when test="${not empty param.product_id}">
        <sql:update dataSource="${db}" var="deleteResult">
            DELETE FROM product WHERE product_id = ?
            <sql:param value="${param.product_id}" />
        </sql:update>

        <c:choose>
            <c:when test="${deleteResult > 0}">
                <script>
                    alert('Product deleted successfully.');
                    window.location = 'display.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script>
                    alert('Product ID not found.');
                    window.location = 'display.jsp';
                </script>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <script>
            alert('Invalid product ID.');
            window.location = 'display.jsp';
        </script>
    </c:otherwise>
</c:choose>

</body>
</html>


