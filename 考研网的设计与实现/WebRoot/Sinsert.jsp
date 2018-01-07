<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
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
   String sql="insert into school values(?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,sname);
   pstmt.setString(2,scity);
   pstmt.setString(3,stype);
   pstmt.setString(4,snumber);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
	response.sendRedirect("admin_one.html");
%>   
  </body>
