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
            background-image: url('images/紫天海边.png'); /* 设置背景图片的URL */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .nav-container {
            width: 30%;
            margin: 10% auto;
            padding: 20px;
            background-color: rgba(240, 248, 255, 0.7);
            backdrop-filter: blur(5px);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center; /* 水平居中 */
            justify-content: center; /* 垂直居中 */
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
            margin-top: auto; /* 将 margin-top 设置为 auto */
            font-size: 20px;
            color: #666;
        }
    </style>
</head>
<body>

<%
    String name = (String) session.getAttribute("name");
%>

<div class="nav-container">
    <h1>食材订购系统</h1>
    <p class="welcome-message">欢迎访问，<%=name%></p>
    <a href="user_center.jsp" class="nav-button">个人中心</a>
    <a href="foods.jsp" class="nav-button">食材市场</a>
    <a href="books.jsp" class="nav-button">我的订单</a>
</div>

</body>
</html>
