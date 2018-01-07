<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<body>
<%
 request.setCharacterEncoding("gbk");
 String sno=request.getParameter("sno");
 String sname=request.getParameter("sname");
 String ssex=request.getParameter("ssex");
 String sclass=request.getParameter("sclass");
 String sbirth=request.getParameter("sbirth");
 String sadd=request.getParameter("sadd");
 String sphone=request.getParameter("sphone");
 String snote=request.getParameter("snote");
   
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
   String sql="insert into student values(?,?,?,?,?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,sno);
   pstmt.setString(2,sname);
   pstmt.setString(3,ssex);
   pstmt.setString(4,sclass);
   pstmt.setString(5,sbirth);
   pstmt.setString(6,sadd);
   pstmt.setString(7,sphone);
   pstmt.setString(8,snote);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("Student.jsp");
%>   
  </body>
