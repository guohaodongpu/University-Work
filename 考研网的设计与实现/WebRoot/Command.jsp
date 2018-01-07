<%@ page language="java" import="java.util.*,cn.qm.db.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    <title>数据库备份测试</title>  
      
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
<%  
Command com = new Command();  
String ip = "localhost";//ip地址  
String username = "root";//MySQL数据库的用户名  
String password = "123";//MySQL数据库的密码  
String database = "ghd";//数据库名字  
String url = "D:/ghd.sql";//备份的目的地址  
boolean check = com.backupDatebase(ip,username,password,database,url);  
if(check){  
 %>  
 数据库备份成功  
 <%} %>  
  </body>  
</html> 