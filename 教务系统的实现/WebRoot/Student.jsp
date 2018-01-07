<%@ page language="java" import="java.util.*,java.sql.*,com.ghd.bean.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


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
   String sql="select * from student";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
%>
	<h1>学生界面</h1>
	<form action="Sinsert.jsp" method="post" >
   	学生信息添加<br><br><br>
   	学号<input type="text" name="sno">
   	姓名<input type="text" name="sname">
   	性别<input type="text" name="ssex">
   	班级<input type="text" name="sclass">&nbsp;&nbsp;&nbsp;<input type="submit" value="添加"><br><br>
   	生日<input type="text" name="sbirth">
   	地址<input type="text" name="sadd">
   	电话<input type="text" name="sphone">
   	备注<input type="text" name="snote">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">  
   	</form>
  	 <br><br>
  	 
  	 

	   <table >
  <tr>
  <td> 学号</td>
  <td> 姓名</td>
  <td> 性别</td>
  <td> 班级</td>
  <td> 生日</td>
  <td> 地址</td>
  <td> 电话</td>
  <td> 备注</td>
   </tr>
 
	<%
   while(rs.next()){
%>
     <tr>
        <td>
          <%=rs.getString("sno") %>
        </td>
        <td>
          <%=rs.getString("sname") %>
        </td>
               
        <td>
          <%=rs.getString("ssex") %>
        </td>
        <td>
          <%=rs.getString("sclass") %>
        </td>
        <td>
          <%=rs.getString("sbirth") %>
        </td>
        <td>
          <%=rs.getString("sadd") %>
        </td>
        <td>
          <%=rs.getString("sphone") %>
        </td>
                <td>
          <%=rs.getString("snote") %>
        </td>
     </tr>
<% 
      }
%>   
   
   
   
   
 
  </table>
  </body>
</html>
