<%@ page language="java" import="java.util.*,cn.qm.db.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    <title>数据恢复测试</title>  
      
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  

  </head>  
    
  <body>  
  
<%
    	cn.qm.db.Recover com = new cn.qm.db.Recover();  
    String url = "D:/ghd.sql";  
    boolean check = com.load();  
    if(check){
    %>  
 数据库恢复成功  
 <%} %>  
  </body>  
</html> 