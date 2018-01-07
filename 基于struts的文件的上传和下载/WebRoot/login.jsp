<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		</head>
	<body style="text-align: center">
		<form action="login.action" method="post" id="loginForm">
		    <s:actionmessage/>
		    <p>
			<label for="username">用户名:</label>
			<input type="text" name="user.username" id="username"/>
			<span id="usernamespan"></span>
			</p>
			<p>
			<label for="password">密      码:</label>
			<input type="password" name="user.password" id="password"/>
			<span id="passwordspan"></span>
			</p>
			<input type="submit" value="提交" /><input type="reset" value="重置" />
		</form>
	</body>
</html>
