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
 String no=request.getParameter("no");
 String name=request.getParameter("name");
 String sex=request.getParameter("sex");
 String sclass=request.getParameter("sclass");
 String type=request.getParameter("type");
 String birth=request.getParameter("birth");
 String add=request.getParameter("add");
 String phone=request.getParameter("phone");
 
%>
<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/dzh";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>
<% 
   Connection conn=null;
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   Class.forName(DBDRIVER);
   conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   String sql="update sss set name=?,sex=?,sclass=?,type=?,birth=?,add=? phone=? where no=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(8,no);
   pstmt.setString(1,name);
   pstmt.setString(2,sex);
   pstmt.setString(3,sclass);
   pstmt.setString(4,type);
   pstmt.setString(5,birth);
   pstmt.setString(6,add);
   pstmt.setString(7,phone);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("index.jsp");
%>   <br>
  </body>
</html>
    
	