<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.vo.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
  <title>$Title$</title>
</head>
<body>
<form action="UserList" method="post">
  <input type="submit" value="提交">
</form>

<%
  List<User> list = (List<User>) session.getAttribute("userList");
  if (list != null) {
    for (User user : list) {
      out.print("<p>" + user.getMid() + "</p>");
      out.print("<p>" + user.getPwd() + "</p>");
    }
  } else {
    out.print("<p>No user data available</p>");
  }
%>

<button id="myButton" data-myattribute="example">
  <div>
    <p>nihao</p>
    <p>nihao</p>
    <p>nihao</p>
  </div>
</button>

<script>
  // 使用JavaScript监听按钮点击事件
  document.getElementById("myButton").addEventListener("click", function() {
    // 获取按钮的特定属性值
    var myAttributeValue = this.getAttribute("data-myattribute");

    // 发送Ajax请求到Servlet页面
    var xhr = new XMLHttpRequest();
    var url = "Button"; // 替换成你的Servlet的URL
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
      if (xhr.readyState == 4 && xhr.status == 200) {
        // 处理Servlet响应
        console.log(xhr.responseText);
        // 刷新页面
        location.reload();
      }
    };
    // 发送属性值作为参数
    xhr.send("myAttribute=" + myAttributeValue);
  });
</script>

<%
  String myAttribute = (String) session.getAttribute("myAttribute");
  if(myAttribute != null) {
    out.print("<p>" + myAttribute + "</p>");
    session.setAttribute("myAttribute", null);
  }
  else out.print("no Attribute");
%>

</body>
</html>

<%
  session.setAttribute("userList", null);
  //session.setAttribute("myAttribute", null);
%>
