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
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
<body>

<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";

%>

  
  
  <%  
  	String user=request.getParameter("user");
    String usename=request.getParameter("usename");
   	String password=request.getParameter("password");	
  	if("stu".equals(user)){
  	Connection conn=null;
  	PreparedStatement pstmt=null;
   	ResultSet sc=null;
   	Class.forName(DBDRIVER);
   	conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);	
  	String susename=usename;
   	String spassword=password;	
   	
   	String sql="insert into stu values(?,?)";
   	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,susename);
   	pstmt.setString(2,spassword);
  	pstmt.executeUpdate();
   	pstmt.close();
   	conn.close();
	response.sendRedirect("landing.html");

   }
   
   	else if("admin".equals(user)){
  
  
  	Connection conn=null;
  	PreparedStatement pstmt=null;
   	ResultSet sc=null;
   	Class.forName(DBDRIVER);
   	conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);	
  	String ausename=usename;;
   	String apassword=password;	
   	
   	String sql="insert into admin values(?,?)";
   	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,ausename);
   	pstmt.setString(2,apassword);
  	pstmt.executeUpdate();
   	pstmt.close();
   	conn.close();
	response.sendRedirect("landing.html");

  }

%>




  </body>
</html>
