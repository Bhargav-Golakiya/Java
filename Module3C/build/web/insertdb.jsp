<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Product Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f4f6f8;
            color: #333;
            text-align: center;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #1a5276;
        }
    </style>
</head>
<body>

<%
    String product_id = request.getParameter("product_id");
    String product_name = request.getParameter("product_name");
    String product_quantity = request.getParameter("product_quantity");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

        String sql = "INSERT INTO product (product_id, product_name, product_quantity) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, product_id);
        pstmt.setString(2, product_name);
        pstmt.setInt(3, Integer.parseInt(product_quantity));

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            out.println("<h2>Product added successfully!</h2>");
        } else {
            out.println("<h2>Failed to add product. Please try again.</h2>");
        }

    } catch(Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
        e.printStackTrace();
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch(Exception e) {}
        try { if (conn != null) conn.close(); } catch(Exception e) {}
    }
%>

<a href="display.jsp">Back to Product List</a>

</body>
</html>
