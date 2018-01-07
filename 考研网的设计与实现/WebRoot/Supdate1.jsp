<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>

<html>
  <head>    
  </head>
  <body>
<%
   request.setCharacterEncoding("gbk"); 
   String sname=request.getParameter("sname");
   String scity=request.getParameter("scity");
   String stype=request.getParameter("stype");
   String snumber=request.getParameter("snumber");
 
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
   String sql="update school set scity=?,stype=?,snumber=? where sname=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(4,sname);
   pstmt.setString(1,scity);
   pstmt.setString(2,stype);
   pstmt.setString(3,snumber);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("admin_two.jsp");
%>   <br>
  </body>
</html>
