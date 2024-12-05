<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<jsp:useBean id="loginBean" class="beans.Login" scope="session"/>
<HEAD><%@ include file="assets/static/head.txt" %></HEAD>
<title>登录页面</title>
<style>
   #tom{
      font-family:宋体;font-size:30;color:black 
   }
</style>
<HTML><body id=tom background =assets/image/back.jpg>
<div align="center">
<table id=tom border=1>
<tr><th>登录</th></tr>
<form action="loginServlet" method="post">
<tr><td>登录名称:<input type=text id=tom name="logname"></td></tr>
<tr><td>输入密码:<input type=password id=tom name="password"></td></tr>
</table>
<input type=submit id=tom value="提交">
</form></div >
<div align="center" >
登录反馈信息:<br>
<jsp:getProperty name="loginBean" property="backNews"/>
<br>登录名称:<br><jsp:getProperty name="loginBean" property="logname"/>
<div ></body></HTML>
