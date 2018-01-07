<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<body>
 
    <form action="updatee.jsp" method="post">
     学号<input type="text" name="no"  readonly="true"value="<%=request.getParameter("no")%>"><br>
     姓名<input type="text" name="name" value="<%=request.getParameter("name")%>"><br>
     性别<input type="text" name="sex" value="<%=request.getParameter("sex")%>"><br>
   班级<input type="text" name="class" value="<%=request.getParameter("class")%>"><br>
   专业<input type="text" name="type" value="<%=request.getParameter("type")%>"><br>
   生日<input type="text" name="birth" value="<%=request.getParameter("birth")%>"><br>
   地址<input type="text" name="add" value="<%=request.getParameter("add")%>"><br>
   电话<input type="text" name="phone" value="<%=request.getParameter("phone")%>"><br>
     
     
     
    <input type="submit" value="提交 ">
   </form>  <br>
  </body>
</html>