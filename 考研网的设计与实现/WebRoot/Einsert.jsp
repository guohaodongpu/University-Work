<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<body>
<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>
<%

   request.setCharacterEncoding("gbk");
   String ename=request.getParameter("ename");
   String etype=request.getParameter("etype");
   String etele=request.getParameter("etele");
   String eadd=request.getParameter("eadd");
   

	if("0".equals(etype)){
	  out.println("请选择辅导班科目");
	}
  	 else {


   Connection conn=null;
   PreparedStatement pstmt=null;
   ResultSet rs=null;

   Class.forName(DBDRIVER);
   conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   String sql="insert into enter values(?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,ename);
   pstmt.setString(2,etype);
   pstmt.setString(3,etele);
   pstmt.setString(4,eadd);
   pstmt.executeUpdate();

   pstmt.close();
   conn.close();
	response.sendRedirect("student.jsp");
	}
%>   
