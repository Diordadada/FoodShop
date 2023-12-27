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
            cursor: pointer; /* 添加这一行以改变鼠标样式为指针 */
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
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .popup {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("foodList") == null) {
        response.sendRedirect("food_list");
        return;
    }
    List<Food> foodList = (List<Food>) session.getAttribute("foodList");
%>

<div class="market-container">

    <%
        if(foodList != null && !foodList.isEmpty()) {
            for(Food food : foodList) {
                out.println("<div class=\"ingredient-card\" food-name=\"" + food.getName() + "\">" +
                        "        <img class=\"ingredient-image\" src=\"" + food.getPath() + "\" alt=\"" + food.getPath() + "\">\n" +
                        "        <div class=\"ingredient-name\">" + food.getName() + "</div>\n" +
                        "        <div class=\"ingredient-type\">" + food.getStyle() + "</div>\n" +
                        "        <div class=\"ingredient-price\">价格：¥" + food.getPrice() + "/斤</div>\n" +
                        "        <div class=\"ingredient-stock\">库存量：" + food.getStock() + "斤</div>\n" +
                        "    </div>");
            }
        }
    %>

<%--  弹出框  --%>
    <div class="overlay" id="overlay">
        <div class="popup" id="popup">
            <img id="popup-image" src="" alt="Food Image" style="max-width: 100%; max-height: 300px; border-radius: 8px;">
            <h2 id="popup-name">食材名</h2>
            <p id="popup-type">食材类型</p>
            <p id="popup-price">价格：¥</p>
            <p id="popup-stock">库存量：</p>
            <form id="book-food" action="book_food" method="post">
                <label for="quantity">订购数量：</label>
                <input type="number" id="quantity" name="num" required>
                <input type="hidden" id="food" name="food" value="">
                <br><br>
                <button type="button" onclick="closePopup()">取消</button>
                <button type="submit">订购</button>
            </form>
        </div>
    </div>

</div>

</body>

<script>
    // 获取所有 ingredient-card 元素
    var ingredientCards = document.querySelectorAll(".ingredient-card");

    // 为每个 ingredient-card 添加点击事件监听器
    ingredientCards.forEach(function(card) {
        card.addEventListener("click", function() {
            // 获取食材的相关信息
            var name = card.querySelector(".ingredient-name").innerText;
            var type = card.querySelector(".ingredient-type").innerText;
            var price = card.querySelector(".ingredient-price").innerText;
            var stock = card.querySelector(".ingredient-stock").innerText;
            var imageSrc = card.querySelector(".ingredient-image").src;

            // 设置弹出框中的内容
            document.getElementById("popup-name").innerText = name;
            document.getElementById("popup-type").innerText = type;
            document.getElementById("popup-price").innerText = price;
            document.getElementById("popup-stock").innerText = stock;
            document.getElementById("popup-image").src = imageSrc;
            // 设置表单默认值（食材名）
            document.getElementById("food").value = name;

            // 显示弹出框
            document.getElementById("overlay").style.display = "flex";
        });
    });

    // 关闭弹出框的函数
    function closePopup() {
        document.getElementById("overlay").style.display = "none";
    }
</script>

<%
    session.removeAttribute("foodList");
%>

</html>
