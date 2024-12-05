<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<HEAD><%@ include file="assets/static/head.txt" %></HEAD>
<title>查询页面</title>
<style>
   #tom{
      font-family:宋体;font-size:26;color:black; 
   }
</style>
<HTML><body bgcolor =pink id=tom>
<div align="center">
<p id=tom>查询时可以输入手机的版本号或手机名称及价格。<br>
手机名称支持模糊查询。
<br>输入价格是在2个值之间的价格，格式是：价格1-价格2<br>
例如：897.98-10000。
</p>
<form action="searchByConditionServlet" id =tom method="post" >
   <br>输入查询信息:<input type=text id=tom name="searchMess"><br>
   <input type =radio name="radio" id =tom value="mobile_version"/ >
    手机版本号
   <input type =radio name="radio" id =tom value="mobile_name" >
    手机名称
   <input type =radio name="radio" value="mobile_price" checked="ok">
    手机价格
   <br><input type=submit id =tom value="提交">
</form>
</div></body></HTML>
