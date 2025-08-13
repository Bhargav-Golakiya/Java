<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f4f6f8;
            color: #333;
            max-width: 600px;
            margin: auto;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 12px 20px;
            background-color: #2980b9;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #1a5276;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #2980b9;
        }
    </style>
</head>
<body>

<h2>Add New Product</h2>

<form action="insertdb.jsp" method="post">
    <label for="product_id">Product ID:</label>
    <input type="text" id="product_id" name="product_id" required>

    <label for="product_name">Product Name:</label>
    <input type="text" id="product_name" name="product_name" required>

    <label for="product_quantity">Product Quantity:</label>
    <input type="number" id="product_quantity" name="product_quantity" min="0" required>

    <input type="submit" value="Add Product">
</form>

<a href="display.jsp">Back to Product List</a>

</body>
</html>
