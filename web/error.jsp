<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>食材订购系统 - 出错啦！</title>
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

        .error-container {
            width: 30%;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        p {
            font-size: 16px;
            color: #333;
        }

        .login-link {
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

        .login-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="error-container">
    <p>密码错误或验证码错误</p>
    <a href="login.jsp" class="login-link">返回登录页面</a>
</div>

</body>
</html>

