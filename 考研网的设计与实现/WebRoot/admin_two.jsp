<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>修改界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body background="2.jpg">
<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>

<% 
   Connection sconn=null;
   Connection tconn=null; 
   Connection cconn=null;
   Connection vconn=null;
   
   PreparedStatement spstmt=null; 
   PreparedStatement tpstmt=null;
   PreparedStatement cpstmt=null;
   PreparedStatement vpstmt=null;
   
   
   ResultSet ss=null;
   ResultSet tt=null;
   ResultSet cc=null;
   ResultSet vv=null;

   Class.forName(DBDRIVER);
   sconn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   tconn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   cconn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   vconn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   
   String ssql="select * from school";
   String tsql="select * from text";
   String csql="select * from class";
   String vsql="select * from vip";
   
   
   spstmt=sconn.prepareStatement(ssql);
   tpstmt=tconn.prepareStatement(tsql);
   cpstmt=cconn.prepareStatement(csql);
   vpstmt=vconn.prepareStatement(vsql);
   
   
   ss=spstmt.executeQuery();
   tt=tpstmt.executeQuery();
   cc=cpstmt.executeQuery();
   vv=vpstmt.executeQuery();
   
	
%>
  <h1>修改界面</h1>
  
    <table align="center" width="800" height=""border="1">

    	<tr><td align="center"><font color="red">各个院校信息</font></td></tr>
    	<tr>
    	<td>&nbsp;</td>
    	<td align="center">名称</td>
    	<td align="center">省市</td>
    	<td align="center">类型</td>
    	<td align="center">排名</td>
    	<td align="center">功&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能</td>
    	</tr>
  <%
   while(ss.next()){
%>
     <tr>
     <td>&nbsp;</td>
        <td align="center">
          <%=ss.getString("sname") %>
        </td>
        <td align="center">
          <%=ss.getString("scity") %>
        </td>
       <td align="center">
          <%=ss.getString("stype") %>
        </td>
        <td align="center">
          <%=ss.getString("snumber") %>
        </td>
        <td align="center">
           <a href="Supdate.jsp?sname=<%=ss.getString("sname")%>&&scity=<%=ss.getString("scity")%>&&stype=<%=ss.getString("stype")%>&&snumber=<%=ss.getString("snumber")%>">修改</a>&nbsp;&nbsp;<a href="Sdelete.jsp?sname=<%=ss.getString("sname")%>">删除</a>
        </td>
     </tr>
<% 
      }
%>   

	</table>
	
	<br/><br/>
	<table align="center" width="800" border="1" >
    	<tr><td align="center"><font color="red">历年高考真题</font></td></tr>
    	<tr>
    	<td>&nbsp;</td>
    	<td align="center">科目</td>
    	<td align="center">年限</td>
    	<td align="center">下载链接</td>
    	<td align="center">考试大纲</td>
    	<td align="center">功&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能</td>
    	
    	</tr>
    	<%
   while(tt.next()){
%>
     <tr>
     <td>&nbsp;</td>

        <td align="center">
          <%=tt.getString("tname") %>
        </td>
        <td align="center">
          <%=tt.getString("tyear") %>
        </td>
       <td align="center">
          <%=tt.getString("tdown") %>
        </td>
       <td align="center">
          <%=tt.getString("tbig") %>
        </td>
         <td align="center">
           <a href="Tupdate.jsp?tname=<%=tt.getString("tname")%>&&tyear=<%=tt.getString("tyear")%>&&tdown=<%=tt.getString("tdown")%>&&tbig=<%=tt.getString("tbig")%>">修改</a>&nbsp;&nbsp;<a href="Tdelete.jsp?tname=<%=tt.getString("tname")%>">删除</a>
        </td>
     </tr>
<% 
      }
%>   
	</table>
	<br/><br/>
	<table align="center" width="800" border="1">
    	<tr><td align="center"><font color="red">各类考研辅班</font></td></tr>
    	<tr>
    	<td>&nbsp;</td>
    	<td align="center">名称</td>
    	<td align="center">学费</td>
    	<td align="center">课时</td>
    	<td align="center">地址</td>
    	<td align="center">功&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能</td>

    	
    	</tr>
<%
   while(cc.next()){
%>
     <tr>
     <td>&nbsp;</td>
        <td align="center">
          <%=cc.getString("cname") %>
        </td>
        <td align="center">
          <%=cc.getString("cmoney") %>
        </td>
       <td align="center">
          <%=cc.getString("ctime") %>
        </td>
        <td align="center">
          <%=cc.getString("cadd") %>
        </td>
         <td align="center">
           <a href="Cupdate.jsp?cname=<%=cc.getString("cname")%>&&cmoney=<%=cc.getString("cmoney")%>&&ctime=<%=cc.getString("ctime")%>&&cadd=<%=cc.getString("cadd")%>">修改</a>&nbsp;&nbsp;<a href="Cdelete.jsp?cname=<%=cc.getString("cname")%>">删除</a>
        </td>
     </tr>
<% 
      }
%>   
    </table>
    <br/><br/>
        <table align="center" width="800" border="1">

    	<tr><td align="center"><font color="red">所有会员信息</font></td></tr>
    	<tr>
    	<td align="center">&nbsp;</td>
    	<td align="center">名字</td>
    	<td align="center">电话</td>
    	<td align="center">微信</td>
    	<td align="center">地址</td>
    	<td align="center">功&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能</td>
    	</tr>
  <%
   while(vv.next()){
%>
     <tr>
     <td>&nbsp;</td>
        <td align="center">
          <%=vv.getString("vname") %>
        </td>
        <td align="center">
          <%=vv.getString("vtele") %>
        </td>
       <td align="center">
          <%=vv.getString("vchat") %>
        </td>
        <td align="center">
          <%=vv.getString("vadd") %>
        </td>
        <td align="center">
           <a href="Vupdate.jsp?vname=<%=vv.getString("vname")%>&&vtele=<%=vv.getString("vtele")%>&&vchat=<%=vv.getString("vchat")%>&&vadd=<%=vv.getString("vadd")%>">修改</a>&nbsp;&nbsp;<a href="Vdelete.jsp?vname=<%=vv.getString("vname")%>">删除</a>
        </td>
     </tr>
<% 
      }
%>   

	</table>
 
 <br> <br> <br>
 <center>
 <a href="admin_one.html">回到管理员界面</a> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="Enter.jsp">查看辅导班情况</a> <br> <br> <br> <br> <br> <br>
  <a href="Command.jsp">备份数据库</a>  <a href="Recover.jsp">恢复数据库</a> 
 </center>
</div></body>
</html>
