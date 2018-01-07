<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<body>
<%
   request.setCharacterEncoding("gbk");
 String no=request.getParameter("no");
 String name=request.getParameter("name");
 String sex=request.getParameter("sex");
 String sclass=request.getParameter("sclass");
 String type=request.getParameter("type");
 String birth=request.getParameter("birth");
 String add=request.getParameter("add");
 String phone=request.getParameter("phone");
   
%>
<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/dzh";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>
<% 
   Connection conn=null;
   PreparedStatement pstmt=null;
   ResultSet rs=null;

   Class.forName(DBDRIVER);
   conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   String sql="insert into sss values(?,?,?,?,?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,no);
   pstmt.setString(2,name);
   pstmt.setString(3,sex);
   pstmt.setString(4,sclass);
   pstmt.setString(5,type);
   pstmt.setString(6,birth);
   pstmt.setString(7,add);
   pstmt.setString(8,phone);
   pstmt.executeUpdate();
%> 
<%
   pstmt.close();
   conn.close();
   response.sendRedirect("index.jsp");
%>   
  </body>