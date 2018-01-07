<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Addw.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 <form action="insert.jsp" method="post" >
   <h2>同学信息添加<br><br><br>
   学号<input type="text" name="no">
   姓名<input type="text" name="name">
   性别<input type="text" name="sex">
   班级<input type="text" name="sclass"><br>
  专业<input type="text" name="type">
   生日<input type="text" name="birth">
   地址<input type="text" name="add">
   电话<input type="text" name="phone"></h2>
   <input type="submit" value="添加">
   </form>
  </body>
</html>
