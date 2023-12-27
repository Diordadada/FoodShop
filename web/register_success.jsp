<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa; /* Light gray background */
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
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

<div class="countdown" id="countdown">返回首页：5</div>

<script>
    // 页面加载后开始倒计时
    var countdownElement = document.getElementById('countdown');
    var countdown = 5;

    function updateCountdown() {
        countdown--;
        countdownElement.textContent = '返回登录页面：' + countdown;

        if (countdown <= 0) {
            // 在倒计时结束后跳转
            window.location.href = 'login.jsp';
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
