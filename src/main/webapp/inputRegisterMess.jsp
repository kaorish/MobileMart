<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<jsp:useBean id="userBean" class="beans.Register" scope="request"/>
<HEAD><%@ include file="assets/static/head.txt" %></HEAD>
<title>注册页面</title>
<style>
   #ok{
      font-family:宋体;font-size:26;color:black; 
   }
   #yes{
      font-family:黑体;font-size:18;color:black; 
   }
</style>

<HTML><body id=ok background =assets/image/back.jpg>
<div align="center">
<form action="registerServlet" method="post">
<table id=ok>
    用户名由字母、数字、下划线构成，*注释的项必须填写。
   <tr><td>*用户名称:</td>
       <td><input type=text id=ok name="logname" /></td>
       <td>*用户密码:</td><td><input type=password id=ok name="password">
       </td></tr>
   <tr><td>*重复密码:</td><td>
       <input type=password id=ok name="again_password"></td>
       <td>联系电话:</td><td><input type=text id=ok name="phone"/></td></tr>
   <tr><td>邮寄地址:</td><td><input type=text id=ok name="address"/></td>
       <td>真实姓名:</td><td><input type=text id=ok name="realname"/></td>
       <td><input type=submit  id=ok value="提交"></td> </tr>
</table>
</form>
</div >
<div align="center">
注册反馈：
<jsp:getProperty name="userBean"  property="backNews" /> 
<table id=yes border=3>
     <tr><td>会员名称:</td>
     <td><jsp:getProperty name="userBean" property="logname"/></td>
     </tr>
     <tr><td>姓名:</td>
     <td><jsp:getProperty name="userBean" property="realname"/></td>
     </tr>
     <tr><td>地址:</td>
     <td><jsp:getProperty name="userBean" property="address"/></td>
     </tr>
     <tr><td>电话:</td>
     <td><jsp:getProperty name="userBean" property="phone"/></td>
     </tr>
</table></div >
</body></HTML>

