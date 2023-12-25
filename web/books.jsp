<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.cj.Session" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>食材订购系统 - 我的订单</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
            text-align: center;
        }

        .order-container {
            width: 80%;
            margin: 5% auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow-y: auto; /* Add scrollbar if needed */
            max-height: 550px; /* Set max height to enable scrollbar */
        }

        .order-header,
        .order {
            display: flex;
            justify-content: space-around;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }

        .order-info {
            flex: 1;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .order-number,
        .food-name,
        .quantity,
        .amount,
        .timestamp {
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("bookList") == null) {
        response.sendRedirect("book_list");
    }
    List<Book> bookList = (List<Book>) session.getAttribute("bookList");
%>

<div class="order-container">
<%--    <h1>我的订单</h1>--%>

    <div class="order-header">
        <div class="order-info order-number">订单号</div>
        <div class="order-info food-name">食材名</div>
        <div class="order-info quantity">订购数量</div>
        <div class="order-info amount">交易金额</div>
        <div class="order-info timestamp">订单生成时间</div>
    </div>

    <%
        if(bookList != null && !bookList.isEmpty()) {
            for(Book book : bookList) {
                out.print("<div class=\"order-header\">\n" +
                        "        <div class=\"order-info order-number\">" + book.getId() + "</div>" +
                        "        <div class=\"order-info food-name\">" + book.getFood() + "</div>"  +
                        "        <div class=\"order-info quantity\">" + book.getNum() + "</div>"  +
                        "        <div class=\"order-info amount\">" + book.getAmount() + "</div>"  +
                        "        <div class=\"order-info timestamp\">" + book.getTime() + "</div>"  +
                        "    </div>");
            }
        }
    %>
    <!-- Add more orders as needed -->
</div>

</body>
</html>
