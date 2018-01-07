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
    
    <title>My JSP 'index.jsp' starting page</title>
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
   String sql="select * from sss";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
%>
<h1>
<a href="Addw.jsp">添加同学</a>
<br><br><br><br>
     <table >
  <tr>
  <td> 学号</td>
  <td> 姓名</td>
  <td> 性别</td>
  <td> 班级</td>
  <td> 专业</td>
  <td> 生日</td>
  <td> 地址</td>
  <td> 电话</td>
   </tr>
<%
   while(rs.next()){
%>
     <tr>
        <td>
          <%=rs.getString("no") %>
        </td>
        <td>
          <%=rs.getString("name") %>
        </td>
               
        <td>
          <%=rs.getString("sex") %>
        </td>
        <td>
          <%=rs.getString("sclass") %>
        </td>
        <td>
          <%=rs.getString("type") %>
        </td>
        <td>
          <%=rs.getString("birth") %>
        </td>
        <td>
          <%=rs.getString("add") %>
        </td>
        <td>
          <%=rs.getString("phone") %>
        </td>
        <td>
           <a href="update.jsp?no=<%=rs.getString("no")%>&&name=<%=rs.getString("name")%>&&sex=<%=rs.getString("sex")%>&&sclass=<%=rs.getString("sclass")%>&&type=<%=rs.getString("type")%>&&birth=<%=rs.getString("birth")%>&&add=<%=rs.getString("add")%>&phone=<%=rs.getString("phone")%>">修改</a>&nbsp;&nbsp;<a href="delete.jsp?no=<%=rs.getString("no")%>">删除</a>
        </td>
     </tr>
<% 
      }
%>   
</table>
</center>
<%
     rs.close();
     pstmt.close();
     conn.close();
 %>
	

    </body>
  </body>
</html>
