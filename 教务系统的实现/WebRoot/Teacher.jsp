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
    
    <title>教师界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
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
   String sql="select * from teacher";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
%>
  <h1>教师界面</h1>
  <form action="Tinsert.jsp" method="post">
   教师信息添加<br><br><br>
   工号<input type="text" name="tno">
   姓名<input type="text" name="tname">
   性别<input type="text" name="tsex">
   科目<input type="text" name="tjob"><br><br>
   院系<input type="text" name="tdept">
   电话<input type="text" name="tphone">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="添加"> <input type="reset" value="重置">  

   </form>
     <br><br>
 
   
  <table width="780">
  <tr>
  <td> 工号</td>
  <td> 姓名</td>
  <td> 性别</td>
  <td> 科目</td>
  <td> 院系</td>
  <td> 电话</td>
   </tr>
	<%
   while(rs.next()){
%>
     <tr>
        <td>
          <%=rs.getString("tno") %>
        </td>
        <td>
          <%=rs.getString("tname") %>
        </td>
               
        <td>
          <%=rs.getString("tsex") %>
        </td>
        <td>
          <%=rs.getString("tjob") %>
        </td>
        <td>
          <%=rs.getString("tdept") %>
        </td>
        <td>
          <%=rs.getString("tphone") %>
        </td>
     </tr>
	
	<%

  }
   %>
  </table>
  </body>
</html>
