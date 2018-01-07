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
    
    <title>My JSP 'Enter.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="3.jpg">
  <%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>
<% 
   Connection econn=null;
   PreparedStatement epstmt=null;
   ResultSet ee=null;

   Class.forName(DBDRIVER);
   econn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   String sql="select * from enter";
   epstmt=econn.prepareStatement(sql);
   ee=epstmt.executeQuery();
%>
  
  <h1>辅导班报名学生信息</h1>
          <table align="center" width="800" height=""border="1">

    	<tr><td><font color="red">报名学生信息</font></td></tr>
    	<tr align="center">
    	<td>&nbsp;</td>
    	<td>名字</td>
    	<td>科目</td>
    	<td>电话</td>
    	<td>地址</td>
    	<td>功&nbsp;&nbsp;&nbsp;能</td>
    	</tr>
  <%
   while(ee.next()){
%>
     <tr>
     <td>&nbsp;</td>
        <td>
          <%=ee.getString("ename") %>
        </td>
        <td>
          <%=ee.getString("etype") %>
        </td>
       <td>
          <%=ee.getString("etele") %>
        </td>
        <td>
          <%=ee.getString("eadd") %>
        </td>
        <td>
           <a href="Eupdate.jsp?ename=<%=ee.getString("ename")%>&&etype=<%=ee.getString("etype")%>&&etele=<%=ee.getString("etele")%>&&eadd=<%=ee.getString("eadd")%>">修改</a>&nbsp;&nbsp;<a href="Edelete.jsp?ename=<%=ee.getString("ename")%>">删除</a>
        </td>
     </tr>
<% 
      }
%>   

	</table>
 
 <br> <br> <br>
 <a href="admin_one.html">回到管理员界面</a>

  </body>
</html>
