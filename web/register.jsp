<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>食材订购系统 - 注册</title>
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

        .register-container {
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

        .register-button {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            color: #fff;
            background-color: #3498db;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 10px;
        }

        .register-button:hover {
            background-color: #2980b9;
        }

        .login-link {
            font-size: 14px;
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h1>食材订购系统 - 注册</h1>
    <form action="register" method="post">
        <div class="input-group">
            <label for="name">店铺名：</label>
            <input type="text" id="name" name="name" placeholder="请输入店铺名" required>
        </div>
        <div class="input-group">
            <label for="phone">联系电话：</label>
            <input type="text" id="phone" name="phone" placeholder="请输入联系电话" required>
        </div>
        <div class="input-group">
            <label for="pwd">密码：</label>
            <input type="password" id="pwd" name="pwd" placeholder="请输入密码" required>
        </div>
        <button type="submit" class="register-button">注册</button>
    </form>
    <a href="login.jsp" class="login-link">已有账号？点击这里登录</a>
</div>

</body>
</html>