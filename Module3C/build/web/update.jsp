<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 40px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            background: #fff;
            max-width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"], a {
            background-color: #2980b9;
            color: white;
            padding: 10px 15px;
            border: none;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover, a:hover {
            background-color: #1a5276;
        }
    </style>
</head>
<body>

<h2>Update Product</h2>

<%
    // ✅ Declare variables BEFORE using them
    String product_id = request.getParameter("product_id");
    String product_name = request.getParameter("product_name");
    String product_quantity = request.getParameter("product_quantity");
%>

<form action="updatedb.jsp" method="post">
    <label>Product ID (read-only):</label>
    <input type="text" name="product_id" value="<%= product_id %>" readonly />

    <label>Product Name:</label>
    <input type="text" name="product_name" value="<%= product_name %>" required />

    <label>Product Quantity:</label>
    <input type="number" name="product_quantity" value="<%= product_quantity %>" required />

    <input type="submit" value="Update Product" />
    <a href="display.jsp">Cancel</a>
</form>

</body>
</html>
