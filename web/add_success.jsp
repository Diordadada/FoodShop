<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加成功</title>
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

        .center-container {
            text-align: center;
            color: #333;
        }

        .success-message {
            font-size: 24px;
            color: #28a745; /* Green color for success */
            margin-bottom: 20px;
        }

        .countdown {
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>

<div class="center-container">
    <%
        String bookingSuccessMessage = (String) request.getAttribute("bookingSuccessMessage");
        if (bookingSuccessMessage != null) {
    %>
    <div class="success-message">
        <%= bookingSuccessMessage %>
    </div>
    <%
        }
    %>

    <h1>添加成功</h1>
    <br>
    <div class="countdown" id="countdown">返回添加食材页面：5</div>
</div>

<script>
    // 页面加载后开始倒计时
    var countdownElement = document.getElementById('countdown');
    var countdown = 5;

    function updateCountdown() {
        countdown--;
        countdownElement.textContent = '返回添加食材页面：' + countdown;

        if (countdown <= 0) {
            // 在倒计时结束后跳转
            window.location.href = 'add_foods.jsp';
        } else {
            // 继续倒计时
            setTimeout(updateCountdown, 1000);
        }
    }

    // 初始调用
    updateCountdown();
</script>

</body>
</html>
