<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<jsp:useBean id="loginBean" class="beans.Login" scope="session"/>
<HEAD><%@ include file="assets/static/head.txt" %></HEAD>
<title>查看购物车</title>
<style>
   #tom{
      font-family:宋体;font-size:26;color:blue 
   }
</style>
<HTML><body background =assets/image/back.jpg id=tom>
<div align="center">
<%  if(loginBean==null){
        response.sendRedirect("login.jsp");//重定向到登录页面。
        return;
    }
    else {
       boolean b =loginBean.getLogname()==null||
                  loginBean.getLogname().length()==0;
       if(b){
         response.sendRedirect("login.jsp");//重定向到登录页面。
         return;
       }
    }
    Context  context = new InitialContext();
    Context  contextNeeded = (Context)context.lookup("java:comp/env");
    DataSource  ds = (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
    Connection con =null;
    Statement sql; 
    ResultSet rs;
    out.print("<table border=1>");
    out.print("<tr>");
    out.print("<th id=tom width=120>"+"手机标识(id)");
    out.print("<th id=tom width=120>"+"手机名称");
    out.print("<th id=tom width=120>"+"手机价格");
    out.print("<th id=tom width=120>"+"购买数量");
    out.print("<th id=tom width=50>"+"修改数量");
    out.print("<th id=tom width=50>"+"删除商品");
    out.print("</tr>"); 
    try{
       con = ds.getConnection();//使用连接池中的连接。
       sql=con.createStatement(); 
       String SQL = 
      "SELECT goodsId,goodsName,goodsPrice,goodsAmount FROM shoppingForm"+
      " where logname ='"+loginBean.getLogname()+"'";
       rs=sql.executeQuery(SQL);//查shoppingForm表。
       String goodsId="";
       String name="";
       float price=0;
       int amount=0;
       String orderForm =null; //订单。
       while(rs.next()) {
          goodsId = rs.getString(1);
          name = rs.getString(2);
          price =rs.getFloat(3);
          amount =rs.getInt(4);
          out.print("<tr>");
          out.print("<td id=tom>"+goodsId+"</td>"); 
          out.print("<td id=tom>"+name+"</td>");
          out.print("<td id=tom>"+price+"</td>");
          out.print("<td id=tom>"+amount+"</td>");
          String update="<form  action='updateServlet' method = 'post'>"+
                     "<input type ='text'id=tom name='update' size =3 value= "+amount+" />"+
                      "<input type ='hidden' name='goodsId' value= "+goodsId+" />"+
                     "<input type ='submit' id=tom value='更新数量'  ></form>";
          String del="<form  action='deleteServlet' method = 'post'>"+
                     "<input type ='hidden' name='goodsId' value= "+goodsId+" />"+
                     "<input type ='submit' id=tom value='删除该商品' /></form>";
          out.print("<td id=tom>"+update+"</td>");
          out.print("<td id=tom>"+del+"</td>");
          out.print("</tr>") ;
       }
       out.print("</table>");
       orderForm = "<form action='buyServlet' method='post'>"+
       "<input type ='hidden' name='logname' value= '"+loginBean.getLogname()+"'/>"+
       "<input type ='submit' id=tom value='生成订单(同时清空购物车)'></form>";
       out.print(orderForm);
       con.close() ;//把连接返回连接池。
    }
    catch(SQLException e) { 
       out.print("<h1>"+e+"</h1>");
    }
    finally{
       try{
          con.close();
       }
       catch(Exception ee){}
    }
%>
</div></body></HTML>
