<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>

<html>
  <head>    
  </head>
  <body>
<%
   request.setCharacterEncoding("gbk"); 
   String ename=request.getParameter("ename");
   String etele=request.getParameter("etele");
   String etype=request.getParameter("etype");
   String eadd=request.getParameter("eadd");
 
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
   String sql="update enter set etype=?,etele=?,eadd=? where ename=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(4,ename);
   pstmt.setString(1,etype);
   pstmt.setString(2,etele);
   pstmt.setString(3,eadd);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("Enter.jsp");
%>   <br>
  </body>
</html>