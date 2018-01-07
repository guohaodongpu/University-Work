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
   String sql="update student set sname=?,ssex=?,sclass=?,sbirth=?,sadd=?,sphone=?,snote=? where sno=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(8,sno);
   pstmt.setString(1,sname);
   pstmt.setString(2,ssex);
   pstmt.setString(3,sclass);
   pstmt.setString(4,sbirth);
   pstmt.setString(5,sadd);
   pstmt.setString(6,sphone); 
   pstmt.setString(7,snote);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("Admin.jsp");
%>   <br>
  </body>
</html>
    
	