<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>

<html>
  <head>    
  </head>
  <body>
<%
   request.setCharacterEncoding("gbk"); 
   String cname=request.getParameter("cname");
   String cmoney=request.getParameter("cmoney");
   String ctime=request.getParameter("ctime");
   String cadd=request.getParameter("cadd");
   
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
   String sql="update class set cmoney=?,ctime=?,cadd=? where cname=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(4,cname);
   pstmt.setString(1,cmoney);
   pstmt.setString(2,ctime);
   pstmt.setString(3,cadd);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("admin_two.jsp");
%>   <br>
  </body>
</html>
