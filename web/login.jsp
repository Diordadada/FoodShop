<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>食材订购系统 - 登录</title>
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

        .login-container {
            width: 30%;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .input-group {
            margin: 20px 0;
            text-align: left;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-button {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 10px;
        }

        .login-button:hover {
            background-color: #45a049;
        }

        .register-link {
            font-size: 14px;
            color: #3498db;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h1>食材订购系统</h1>
    <form action="login" method="post">
        <div class="input-group">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="name" placeholder="请输入店铺名" required>
        </div>
        <div class="input-group">
            <label for="password">密码：</label>
            <input type="password" id="password" name="pwd" placeholder="请输入密码" required>
        </div>
        <button type="submit" class="login-button">登录</button>
    </form>
    <a href="register.jsp" class="register-link">没有账号？点击这里注册</a>
</div>

</body>
</html>
