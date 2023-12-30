<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.vo.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>食材订购系统 - 个人中心</title>
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

        .profile-container {
            width: 30%;
            padding: 20px;
            background-color: rgba(240, 248, 255, 0.7);
            backdrop-filter: blur(5px);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #3498db;
            margin-bottom: 20px;
        }

        .info-group {
            margin: 20px 0;
            text-align: left;
            display: flex; /* 使用 Flex 布局 */
            align-items: center; /* 垂直居中对齐 */
            justify-content: space-between; /* 两者之间的空间平均分配 */
        }

        label {
            display: inline-block;
            font-size: 18px;
            color: #333;
        }

        .info-value {
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("user_info");
        return;
    }
    User user = (User) session.getAttribute("user");
%>

<div class="profile-container">
    <h1>个人中心</h1>
    <div class="info-group">
        <label>商铺名：</label>
        <span class="info-value"><%=user.getName()%></span>
    </div>
    <div class="info-group">
        <label>联系电话：</label>
        <span class="info-value"><%=user.getPhone()%></span>
    </div>
    <div class="info-group">
        <label>密码：</label>
        <span class="info-value">********</span>
    </div>
    <div class="info-group">
        <label>账户余额：</label>
        <span class="info-value">$<%=user.getBalance()%></span>
    </div>
</div>

<%
    session.removeAttribute("user");
%>

</body>
</html>
