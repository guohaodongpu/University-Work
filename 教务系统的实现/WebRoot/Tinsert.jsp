<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
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
   String sql="insert into teacher values(?,?,?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,tno);
   pstmt.setString(2,tname);
   pstmt.setString(3,tsex);
   pstmt.setString(4,tjob);
   pstmt.setString(5,tdept);
   pstmt.setString(6,tphone);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("Teacher.jsp");
%>   
  </body>