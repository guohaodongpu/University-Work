<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>

<html>
  <head>    
  </head>
  <body>
<%
   request.setCharacterEncoding("gbk"); 
   String tname=request.getParameter("tname");
   String tyear=request.getParameter("tyear");
   String tdown=request.getParameter("tdown");
   String tbig=request.getParameter("tbig");
 
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
   String sql="update text set tyear=?,tdown=?,tbig=? where tname=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(4,tname);
   pstmt.setString(1,tyear);
   pstmt.setString(2,tdown);
   pstmt.setString(3,tbig);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("admin_two.jsp");
%>   <br>
  </body>
</html>
