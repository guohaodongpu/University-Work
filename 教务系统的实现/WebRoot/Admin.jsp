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
    
    <title>管理员管理员</title>
    


  </head>
  
  <body>
      <%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>
<% 
   Connection conn1=null;Connection conn2=null;
   PreparedStatement pstmt1=null;PreparedStatement pstmt2=null;
   ResultSet rs1=null;ResultSet rs2=null;

   Class.forName(DBDRIVER);
   conn1=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   conn2=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   String sql1="select * from student";
   String sql2="select * from teacher";
   pstmt1=conn1.prepareStatement(sql1);
   pstmt2=conn2.prepareStatement(sql2);
   rs1=pstmt1.executeQuery();
   rs2=pstmt2.executeQuery();
%>
  <h1>管理员界面</h1>
	

	   <table width="900">
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
   while(rs1.next()){
%>
     <tr>
        <td>
          <%=rs1.getString("sno") %>
        </td>
        <td>
          <%=rs1.getString("sname") %>
        </td>
               
        <td>
          <%=rs1.getString("ssex") %>
        </td>
        <td>
          <%=rs1.getString("sclass") %>
        </td>
        <td>
          <%=rs1.getString("sbirth") %>
        </td>
        <td>
          <%=rs1.getString("sadd") %>
        </td>
        <td>
          <%=rs1.getString("sphone") %>
        </td>
                <td>
          <%=rs1.getString("snote") %>
        </td>
        <td>
           <a href="Supdate.jsp?sno=<%=rs1.getString("sno")%>&&sname=<%=rs1.getString("sname")%>&&ssex=<%=rs1.getString("ssex")%>&&sclass=<%=rs1.getString("sclass")%>&&sbirth=<%=rs1.getString("sbirth")%>&&sadd=<%=rs1.getString("sadd")%>&&sphone=<%=rs1.getString("sphone")%>&&snote=<%=rs1.getString("snote") %>"><input type="button" value="修改"></a>&nbsp;&nbsp;<a href="Sdelete.jsp?sno=<%=rs1.getString("sno")%>"><input type="button" value="删除"></a>
        </td>
     </tr>
<% 
      }
%>   
   
   
   
   
   
 
  </table>
   <br> <br> <br> <br> 
   

    <table width="900">
  <tr>
  <td> 工号</td>
  <td> 姓名</td>
  <td> 性别</td>
  <td> 科目</td>
  <td> 院系</td>
  <td> 电话</td>
   </tr>

 
	<%
   while(rs2.next()){
%>
     <tr>
        <td>
          <%=rs2.getString("tno") %>
        </td>
        <td>
          <%=rs2.getString("tname") %>
        </td>
               
        <td>
          <%=rs2.getString("tsex") %>
        </td>
        <td>
          <%=rs2.getString("tjob") %>
        </td>
        <td>
          <%=rs2.getString("tdept") %>
        </td>
        <td>
          <%=rs2.getString("tphone") %>

        <td>
           <a href="Tupdate.jsp?tno=<%=rs2.getString("tno")%>&&tname=<%=rs2.getString("tname")%>&&tsex=<%=rs2.getString("tsex")%>&&tjob=<%=rs2.getString("tjob")%>&&tdept=<%=rs2.getString("tdept")%>&&tphone=<%=rs2.getString("tphone")%>"><input type="button" value="修改"></a>&nbsp;&nbsp;<a href="Tdelete.jsp?tno=<%=rs2.getString("tno")%>"><input type="button" value="删除"></a>
        </td>
     </tr>
<% 
      }
%>
  </table>
  </body>
</html>
