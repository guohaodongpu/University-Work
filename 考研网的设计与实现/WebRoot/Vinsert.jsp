<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<body>
<%
   request.setCharacterEncoding("gbk");
   String vname=request.getParameter("vname");
   String vtele=request.getParameter("vtele");
   String vchat=request.getParameter("vchat");
   String vadd=request.getParameter("vadd");
   
   
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
   String sql="insert into vip values(?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,vname);
   pstmt.setString(2,vtele);
   pstmt.setString(3,vchat);
   pstmt.setString(4,vadd);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
	response.sendRedirect("vip.html");
%>   
