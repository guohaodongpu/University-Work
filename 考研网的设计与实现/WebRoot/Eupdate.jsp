<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>


<body>
<% 
   
   String ename=request.getParameter("ename");
   ename=new String(ename.getBytes("ISO-8859-1"),"gb2312");
%>  
    <form action="Eupdate1.jsp" method="post">
    
    	<h1>辅导班报名学生信息修改</h1>
     	名字:<input type="text" name="ename" value="<%=ename%>"><br>
     	
     	科目:<input type="text" name="etype" value="<%=request.getParameter("etype")%>"><br>
     	
		电话:<input type="text" name="etele" value="<%=request.getParameter("etele")%>"><br>
		
    	
    	地址:<input type="text" name="eadd" value="<%=request.getParameter("eadd")%>"><br>

     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交 ">
   </form>  
  </body>