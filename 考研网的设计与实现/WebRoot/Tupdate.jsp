<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>


<body>
<% 
   
   String tname=request.getParameter("tname");
   tname=new String(tname.getBytes("ISO-8859-1"),"gb2312");
%>  
    <form action="Tupdate1.jsp" method="post">
    
    	<h1>高考真题修改</h1>
    	科目:<input type="text" name="tname" value="<%=tname%>">	<br>
    	
    	年限:<input type="text" name="tyear" value="<%=request.getParameter("tyear")%>"><br>
    	
    	上传:<input type="text" name="tdown" value="<%=request.getParameter("tdown")%>"><br>
    	
    	大纲:<input type="text" name="tbig" value="<%=request.getParameter("tbig")%>"><br>

     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交 ">
   </form>  
  </body>
