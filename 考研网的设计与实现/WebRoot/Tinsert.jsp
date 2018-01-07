<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
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
   String sql="insert into text values(?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,tname);
   pstmt.setString(2,tyear);
   pstmt.setString(3,tdown);
   pstmt.setString(4,tbig);
    
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
	response.sendRedirect("admin_one.html");
%>   
