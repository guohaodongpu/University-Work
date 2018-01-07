<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>学生界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body background="3.jpg">
<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";
%>

<% 
   Connection sconn=null; //定义一个创建连接的变量，初始值设为空
   Connection tconn=null; 
   Connection cconn=null;
   Connection econn=null;
   
   
   PreparedStatement spstmt=null; //申明一个类型为PreparedStatement 的变量。
   PreparedStatement tpstmt=null;
   PreparedStatement cpstmt=null;
   PreparedStatement epstmt=null;
   
   
   ResultSet ss=null;
   ResultSet tt=null;	//表示定义出这个ResultSet的对象rs
   ResultSet cc=null;
   ResultSet ee=null;

   Class.forName(DBDRIVER);
   sconn=DriverManager.getConnection(DBURL,DBUSER,DBPASS); //创建链接
   tconn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   cconn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   econn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   
   String ssql="select * from school";
   String tsql="select * from text";
   String csql="select * from class";
   String esql="select * from class";
   
   spstmt=sconn.prepareStatement(ssql);
   tpstmt=tconn.prepareStatement(tsql);
   cpstmt=cconn.prepareStatement(csql);
   epstmt=econn.prepareStatement(csql);
   
   ss=spstmt.executeQuery();
   tt=tpstmt.executeQuery();
   cc=cpstmt.executeQuery();
   ee=epstmt.executeQuery();
   
   
%>
  <h1>学生界面</h1>
    <table align="center" width="700" border="1">

    	<tr><td>各个院校信息</td></tr>
    	<tr>
    	<td>&nbsp;</td>
    	<td>名称</td>
    	<td>省市</td>
    	<td>类型</td>
    	<td>排名</td>
    	</tr>
  <%
   while(ss.next()){
%>
     <tr>
     <td>&nbsp;</td>
        <td>
          <%=ss.getString("sname") %>
        </td>
        <td>
          <%=ss.getString("scity") %>
        </td>
       <td>
          <%=ss.getString("stype") %>
        </td>
        <td>
          <%=ss.getString("snumber") %>
        </td>
     </tr>
<% 
      }
%>   

	</table>
	
	<br/><br/>
	<table align="center" width="700" border="1" >
    	<tr><td>历年高考真题</td></tr>
    	<tr>
    	<td>&nbsp;</td>

    	<td>科目</td>
    	<td>年限</td>
    	<td>下载链接</td>
    	<td>考试大纲</td>
    	
    	</tr>
    	<%
   while(tt.next()){
%>
     <tr>
     <td>&nbsp;</td>
        
        <td>
          <%=tt.getString("tname") %>
        </td>
        <td>
          <%=tt.getString("tyear") %>
        </td>
       <td>
          <%=tt.getString("tdown") %>
        </td>
               <td>
          <%=tt.getString("tbig") %>
        </td>
     </tr>
<% 
      }
%>   
	</table>
	<br/><br/>
	<table align="center" width="700" border="1">
    	<tr><td>各类考研辅班</td></tr>
    	<tr>
    	<td>&nbsp;</td>
    	<td>名称</td>
    	<td>学费</td>
    	<td>课时</td>
    	<td>地址</td>
    	
    	</tr>
<%
   while(cc.next()){
%>
     <tr>
     <td>&nbsp;</td>
        <td>
          <%=cc.getString("cname") %>
        </td>
        <td>
          <%=cc.getString("cmoney") %>
        </td>
       <td>
          <%=cc.getString("ctime") %>
        </td>
        <td>
          <%=cc.getString("cadd") %>
        </td>
     </tr>
<% 
      }
%>   
    </table>
    <br><br>
    <table align="center" width="700">
    <% String dagang=request.getParameter("dagang");%>
		<tr><td>考研大纲</td><td><textarea name="dagang" style="width:400px;background:none"><%=dagang %>></textarea></td></tr>
    	<tr><td>&nbsp;</td></tr>   
  	</table>
    <br><br>
 <form action="Einsert.jsp" method="post">
 <center><font color="green">修改报名信息.联系管理员</font></center>
 <br>
 <table align="center" width="700" border="1" >
 <tr align="center"><td >报名辅导班表单</td><td>学生姓名</td><td>选报科目</td><td>学生电话</td><td>居住地址</td></tr>
 <tr align="center"><td><input type="submit" value="报名">&nbsp;&nbsp;<input type="reset" value="重置"></td><td><input type="text" name="ename" size="15"></td><td > <select name="etype" id="etype" >
<option  value="0" selected="selected">请选择科选报科目</option>
 <%
 while(ee.next()){
 %>
 <option value="<%=ee.getString("cname") %>"><%=ee.getString("cname") %></option>
 
 <% 
      }
%>
</select></td><td><input type="text" name="etele" size="15"></td><td><input type="text" name="eadd"  size="15"></td></tr>
 </table>
 
 
 </form>
 <br> <br> <br> <br> <br> <br> <br> <br> <br><br> <br><br> <br><br> <br>
 <center><a href="landing.html">回到登陆界面</a>
  </body>
</html>