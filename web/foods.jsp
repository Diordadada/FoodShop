<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.cj.Session" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>食材市场</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa; /* Light gray background */
            text-align: center;
        }

        .market-container {
            width: 80%;
            margin: 5% auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .ingredient-card {
            width: 200px;
            margin: 20px;
            padding: 15px;
            background-color: #ffffff; /* White background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .ingredient-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .ingredient-image {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 8px;
        }

        .ingredient-name {
            font-size: 18px;
            margin-top: 10px;
            color: #333;
        }

        .ingredient-type {
            font-size: 16px;
            color: #555;
        }

        .ingredient-price {
            font-size: 16px;
            color: #555;
            margin-top: 5px;
        }

        .ingredient-stock {
            font-size: 16px;
            color: #555;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("foodList") == null) {
        response.sendRedirect("food_list");
    }
    List<Food> foodList = (List<Food>) session.getAttribute("foodList");
%>

<div class="market-container">

    <!-- Sample Ingredient Card 1 -->
    <div class="ingredient-card">
        <img class="ingredient-image" src="images/白菜.webp" alt="Ingredient 1">
        <div class="ingredient-name">新鲜蔬菜</div>
        <div class="ingredient-type">蔬菜类</div>
        <div class="ingredient-price">价格：¥15.00/斤</div>
        <div class="ingredient-stock">库存量：100斤</div>
    </div>

    <!-- Sample Ingredient Card 2 -->
    <div class="ingredient-card">
        <img class="ingredient-image" src="images/牛肉.jpg" alt="Ingredient 2">
        <div class="ingredient-name">优质肉类</div>
        <div class="ingredient-type">肉类</div>
        <div class="ingredient-price">价格：¥50.00/斤</div>
        <div class="ingredient-stock">库存量：50斤</div>
    </div>

    <%
        if(foodList != null && !foodList.isEmpty()) {
            for(Food food : foodList) {
                out.println("<div class=\"ingredient-card\">\n" +
                        "        <img class=\"ingredient-image\" src=\"" + food.getPath() + "\" alt=\"" + food.getPath() + "\">\n" +
                        "        <div class=\"ingredient-name\">" + food.getName() + "</div>\n" +
                        "        <div class=\"ingredient-type\">" + food.getStyle() + "</div>\n" +
                        "        <div class=\"ingredient-price\">价格：¥" + food.getPrice() + "/斤</div>\n" +
                        "        <div class=\"ingredient-stock\">库存量：" + food.getStock() + "斤</div>\n" +
                        "    </div>");
            }
        }
    %>

    <!-- Add more ingredient cards as needed -->

</div>

</body>
</html>
