<%@ page language="java"pageEncoding="gbk" isELIgnored="false"%>
<%
String path = request.getContextPath();
%>
<html>
  <head>
    <title>查看文件的信息</title>
  </head>
  <body bgcolor="#F4F4F4">
  <script type="text/javascript">
	history.go(1);
</script>
  <h1>文件的描述信息</h1>
    <div style="color:#049ed0;">${info}</div>
  </body>
</html>
