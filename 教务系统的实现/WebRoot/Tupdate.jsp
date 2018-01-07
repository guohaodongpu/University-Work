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
    
    <title>My JSP 'Tupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> <br>
   <form action="Tupdatee.jsp" method="post">
   工号<input type="text" name="tno" value="<%=request.getParameter("tno")%>"><br>
   姓名<input type="text" name="tname" value="<%=request.getParameter("tname")%>"><br>
   性别<input type="text" name="tsex" value="<%=request.getParameter("tsex")%>"><br>
   科目<input type="text" name="tjob" value="<%=request.getParameter("tjob")%>"><br>
   院系<input type="text" name="tdept" value="<%=request.getParameter("tdept")%>"><br>
   电话<input type="text" name="tphone" value="<%=request.getParameter("tphone")%>"><br>
     <input type="submit" value="提交 ">
  </body>
</html>
