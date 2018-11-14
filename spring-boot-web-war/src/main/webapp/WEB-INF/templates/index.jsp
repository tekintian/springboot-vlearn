<%--
  @User: Tekin   @Date: 2018/11/6  @Time: 19:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html xmlns="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <title>index jsp templates ${msg}</title>
</head>

<body>
<h1>index jsp templates demo</h1>
<h2>${msg}</h2>
<br>
<a href="<%=basePath %>index">index Controller</a>
</body>
</html>