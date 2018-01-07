<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>


<body>
<% 
   
   String cname=request.getParameter("cname");
   cname=new String(cname.getBytes("ISO-8859-1"),"gb2312");
%>  
    <form action="Cupdate1.jsp" method="post">
    
    	<h1>辅导班信息修改</h1>
   		名称<input type="text" name="cname" value="<%=cname%>"><br>
    	学费<input type="text" name="cmoney" value="<%=request.getParameter("cmoney")%>"><br>	
    	课时<input type="text" name="ctime"  value="<%=request.getParameter("ctime")%>"><br>
    	地址<input type="text" name="cadd"  value="<%=request.getParameter("cadd")%>"><br>

     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交 ">
   </form>  <br>
  </body>

