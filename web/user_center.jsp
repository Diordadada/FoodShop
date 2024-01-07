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
            display: flex; /* 使用 Flex 布局 */
            align-items: center; /* 垂直居中对齐 */
        }

        /* 新增样式 */
        .recharge-button {
            margin-left: 10px;
            padding: 10px;
            background-color: #27ae60;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* 新增样式 */
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

        /* 新增样式 */
        .popup {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        /* 新增样式 */
        .recharge-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* 新增样式 */
        .recharge-input {
            margin-bottom: 10px;
            padding: 8px;
        }

        /* 新增样式 */
        .recharge-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        /* 新增样式 */
        .recharge-buttons button {
            flex: 1;
            margin: 0 5px;
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
        <span class="info-value">
            $<%=user.getBalance()%>
            <!-- 新增按钮 -->
            <button class="recharge-button" onclick="showRechargePopup()">充值</button>
        </span>
    </div>
</div>

<!-- 新增弹出框 -->
<div class="overlay" id="overlay">
    <div class="popup" id="popup">
        <h2>充值</h2>
        <form class="recharge-form" action="recharge" method="post">
            <label for="rechargeAmount">充值金额：</label>
            <input type="number" id="rechargeAmount" name="rechargeAmount" class="recharge-input" required>

            <div class="recharge-buttons">
                <button type="button" onclick="closeRechargePopup()">取消</button>
                <input type="submit" value="确定">
            </div>
        </form>
    </div>
</div>

<script>
    // 新增弹出框的显示函数
    function showRechargePopup() {
        document.getElementById("overlay").style.display = "flex";
    }

    // 新增弹出框的关闭函数
    function closeRechargePopup() {
        document.getElementById("overlay").style.display = "none";
    }

</script>

<%
    session.removeAttribute("user");
%>

</body>
</html>
