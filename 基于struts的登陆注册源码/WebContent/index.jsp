<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录或注册</title>
<script type="text/javascript">
	function login_()
	{
	document.getElementById("login").action="<%=request.getContextPath()%>/login.action";
	<%--
	" <%=request.getContextPath()%>"表示返回根目录路径;此时namespace为"/",若namespace为/root1，
	则此时应该为document.getElementById("login").action="<%=request.getContextPath()%>/root1/login.action";
	login.action中的login为struts中名为login的action ;注意：login.action的action不能少。
	 --%>
	document.getElementById("login").submit();
	}
	function registor_()
	{
	document.getElementById("login").action="<%=request.getContextPath()%>/regist.action";
	document.getElementById("login").submit();
	} 
</script>
</head>
<body>
<!-- 使用HTML -->
<form name="login" method="post" id="login">
	<table>
		<tr><td>用户名：</td><td><input type="text" name="user.username" /></td></tr>
		<tr><td>密码：</td><td><input type="password" name="user.password" /></td></tr>
		<tr><td><input type="submit" value="登陆" onclick="login_()"/></td>
			<td><input type="submit" value="注册" onclick="registor_()"/></td>
		<!-- 注意：onclick的方法千万不能和form表单中定义的name和id重名，否则会报网页上有错   -->
		</tr>
	</table>
</form>
<%-- 使用struts标签 --%>
<%-- <s:form action="ind">
		<s:textfield name="user.username" label="用户名"/>
		<s:password name="user.password" label="密码"/>
		<s:submit value="登陆" method="login"></s:submit>
		<s:submit value="注册" method="regist"/>
</s:form> --%>
<s:debug />
</body>
</html>