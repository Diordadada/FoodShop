<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.cj.Session" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加食材</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        input[type="text"], input[type="file"], input[type="submit"] {
            display: block;
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h2>添加食材</h2>
<form action="upload" method="post" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="食材名"/>
    <input type="text" name="style" placeholder="食材类型"/>
    <input type="text" name="price" placeholder="食材价格"/>
    <input type="text" name="stock" placeholder="食材库存量"/>
    食材图片：<input type="file" name="image"/>

    <input type="submit" value="添加"/>
</form>
</body>
</html>