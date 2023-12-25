<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.cj.Session" %>

<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>食材订购系统 - 导航</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
            text-align: center;
        }

        .nav-container {
            width: 30%;
            margin: 10% auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
        }

        .nav-button {
            display: block;
            width: 80%;
            margin: 20px auto;
            padding: 15px;
            font-size: 18px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .nav-button:hover {
            background-color: #45a049;
        }

        .welcome-message {
            margin-top: 20px;
            font-size: 20px;
            color: #666;
        }
    </style>
</head>
<body>

<%-- 在进入导航时将个人信息保存入 session 中 --%>
<%
    if((String) session.getAttribute("phone") == null && session.getAttribute("balance") == null)
        response.sendRedirect("user_info");
    String name = (String) session.getAttribute("name");
%>

<div class="nav-container">
    <h1>食材订购系统</h1>
    <p class="welcome-message">欢迎访问，<%=name%></p>
    <a href="user_center.jsp" class="nav-button">个人中心</a>
    <a href="food_market.html.jsp" class="nav-button">食材市场</a>
    <a href="books.jsp" class="nav-button">我的订单</a>
</div>

</body>
</html>
