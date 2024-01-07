<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.cj.Session" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>查看订单</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/紫天海边.png'); /* 设置背景图片的URL */
            background-size: cover;
            background-position: center;
            display: flex;
            text-align: center;
            height: 100vh;
        }

        .order-container {
            width: 80%;
            margin: 5% auto;
            padding: 20px;
            background-color: rgba(240, 248, 255, 0.7);
            backdrop-filter: blur(5px);
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
        .user,
        .food-name,
        .quantity,
        .amount,
        .timestamp {
            font-size: 16px;
            color: #555;
        }

        #page_control {
            position: fixed;
            bottom: 10px; /* 根据需要调整距离底部的距离 */
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            justify-content: space-between;
            width: 200px; /* 根据需要调整宽度 */
        }

        #page_control a {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 5px;
            cursor: pointer;
        }

        #page_control a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("bookList") == null) {
        response.sendRedirect("book_list2");
        return;
    }
    List<Book> bookList = (List<Book>) session.getAttribute("bookList");
%>

<div class="order-container">

    <div class="order-header">
        <div class="order-info order-number">订单号</div>
        <div class="order-info user">订购者</div>
        <div class="order-info food-name">食材名</div>
        <div class="order-info quantity">订购数量</div>
        <div class="order-info amount">交易金额</div>
        <div class="order-info timestamp">订单生成时间</div>
    </div>

    <%
        int page2 = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int num = 0;
        int row = 6;

        if(bookList != null && !bookList.isEmpty()) {
            for(Book book : bookList) {
                num++;
                if ( num > (page2-1) * row && num <= page2 * row) {
                    out.print("<div class=\"order-header\">\n" +
                            "        <div class=\"order-info order-number\">" + book.getId() + "</div>" +
                            "        <div class=\"order-info food-name\">" + book.getUser() + "</div>" +
                            "        <div class=\"order-info food-name\">" + book.getFood() + "</div>" +
                            "        <div class=\"order-info quantity\">" + book.getNum() + "</div>" +
                            "        <div class=\"order-info amount\">" + book.getAmount() + "</div>" +
                            "        <div class=\"order-info timestamp\">" + book.getTime() + "</div>" +
                            "    </div>");
                }
            }
        }
    %>
    <div id="page_control">

    </div>
</div>

<script>
    function getURLParams(url) {
        // 获取 URL 中的查询字符串部分
        const queryString = url.split('?')[1];

        // 如果没有查询字符串，则返回空对象
        if (!queryString) {
            return {};
        }

        // 将查询字符串解析为键值对，并存储到一个对象中
        const params = {};
        queryString.split('&').forEach(param => {
            const [key, value] = param.split('=');
            params[key] = decodeURIComponent(value);
        });

        return params;
    }

    // 上一页
    var page_control = document.getElementById("page_control");
    let currentUrl = window.location.href;
    var page = getURLParams(currentUrl).page

    let newUrl = currentUrl;
    if(page!=null){
        page = parseInt(page)
        if (page > 1){
            newUrl = "view_books.jsp" + "?page="+(page-1);
        }else{
            newUrl = "view_books.jsp";
        }

    }else {
        newUrl = "view_books.jsp" + "?page=1";
    }
    const previous = document.createElement("a");
    previous.href = newUrl;
    previous.innerText="上一页";
    page_control.appendChild(previous);

    //下一页
    currentUrl = window.location.href;
    page = getURLParams(currentUrl).page
    newUrl = currentUrl;
    if(page!=null){
        page = parseInt(page)
        newUrl = "view_books.jsp" + "?page="+(page+1);
    }else {
        newUrl = "view_books.jsp" + "?page=2";
    }
    const next = document.createElement("a");
    next.href = newUrl;
    next.innerText="下一页";
    page_control.appendChild(next);

</script>


<%
    //session.removeAttribute("bookList");
%>

</body>
</html>
