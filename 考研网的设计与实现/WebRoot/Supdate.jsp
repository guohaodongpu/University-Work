<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>


<body>
<% 
   
   String sname=request.getParameter("sname");
   sname=new String(sname.getBytes("ISO-8859-1"),"gb2312");
%>  
    <form action="Supdate1.jsp" method="post">
    
    	<h1>学院信息修改</h1>
     	名称:<input type="text" name="sname" value="<%=sname%>"><br>
     	
		省市:<input type="text" name="scity" value="<%=request.getParameter("scity")%>"><br>
		
    	类型:<input type="text" name="stype" value="<%=request.getParameter("stype")%>"><br>
    	
    	排名:<input type="text" name="snumber" value="<%=request.getParameter("snumber")%>"><br>

     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交 ">
   </form>  
  </body>

