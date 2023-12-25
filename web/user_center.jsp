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
            background-color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .profile-container {
            width: 40%;
            padding: 20px;
            background-color: #fff;
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
        }

        label {
            display: block;
            font-size: 18px;
            margin-bottom: 8px;
            color: #333;
        }

        .info-value {
            font-size: 16px;
            color: #555;
        }

        .edit-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            font-size: 16px;
            color: #fff;
            background-color: #3498db;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .edit-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<%
    String name = (String) session.getAttribute("name");
    String phone = (String) session.getAttribute("phone");
    String pwd = (String) session.getAttribute("pwd");
    Double balance = (Double) session.getAttribute("balance");
%>

<div class="profile-container">
    <h1>个人中心</h1>
    <div class="info-group">
        <label>商铺名：</label>
        <span class="info-value"><%=name%></span>
    </div>
    <div class="info-group">
        <label>联系电话：</label>
        <span class="info-value"><%=phone%></span>
    </div>
    <div class="info-group">
        <label>密码：</label>
        <span class="info-value">********</span>
        <a href="#" class="edit-link">修改密码</a>
    </div>
    <div class="info-group">
        <label>账户余额：</label>
        <span class="info-value">$<%=balance%></span>
        <a href="#" class="edit-link">充值</a>
    </div>
</div>

</body>
</html>
