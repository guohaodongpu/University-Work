<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<body>
 
    <form action="Supdatee.jsp" method="post">
     学号<input type="text" name="sno"  readonly="true"value="<%=request.getParameter("sno")%>"><br>
   姓名<input type="text" name="sname" value="<%=request.getParameter("sname")%>"><br>
    性别<input type="text" name="ssex" value="<%=request.getParameter("ssex")%>"><br>
   班级<input type="text" name="sclass" value="<%=request.getParameter("sclass")%>"><br>
   生日<input type="text" name="sbirth" value="<%=request.getParameter("sbirth")%>"><br>
   地址<input type="text" name="sadd" value="<%=request.getParameter("sadd")%>"><br>
   电话<input type="text" name="sphone" value="<%=request.getParameter("sphone")%>"><br>
   备注<input type="text" name="snote" value="<%=request.getParameter("snote")%>"><br>
     
     
     
    <input type="submit" value="提交 ">
   </form>  <br>
  </body>
</html>
