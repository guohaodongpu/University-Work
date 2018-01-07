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
    
    <title>My JSP 'updatee.jsp' starting page</title>
 
  </head>
  <body>
<%
 request.setCharacterEncoding("gbk");
 String tno=request.getParameter("tno");
 String tname=request.getParameter("tname");
 String tsex=request.getParameter("tsex");
 String tjob=request.getParameter("tjob");
 String tdept=request.getParameter("tdept");
 String tphone=request.getParameter("tphone");
   
 
%>
<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>
<% 
    Connection conn=null;
   PreparedStatement pstmt=null;
   ResultSet rs=null;

   Class.forName(DBDRIVER);

   conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   String sql="update teacher set tname=?,tsex=?,tjob=?,tdept=?,tphone=? where tno=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(6,tno);
   pstmt.setString(1,tname);
   pstmt.setString(2,tsex);
   pstmt.setString(3,tjob);
   pstmt.setString(4,tdept);
   pstmt.setString(5,tphone);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("Admin.jsp");
%>   <br>
  </body>
</html>
    
