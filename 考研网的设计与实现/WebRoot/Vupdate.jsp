<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>


<body>
<% 
   
   String vname=request.getParameter("vname");
   vname=new String(vname.getBytes("ISO-8859-1"),"gb2312");
%>  
    <form action="Vupdate1.jsp" method="post">
    
    	<h1>VIP信息修改</h1>
     	名字:<input type="text" name="vname" value="<%=vname%>"><br>
     	
		电话:<input type="text" name="vtele" value="<%=request.getParameter("vtele")%>"><br>
		
    	微信:<input type="text" name="vchat" value="<%=request.getParameter("vchat")%>"><br>
    	
    	地址:<input type="text" name="vadd" value="<%=request.getParameter("vadd")%>"><br>

     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交 ">
   </form>  
  </body>
