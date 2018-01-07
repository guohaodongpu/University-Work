<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎界面</title>
</head>
<body>
<%
	/*判断application对象中有没有保存名为count的参数

　　如果没有，在application对象中新增一个名为count的参数
	*/
	if(application.getAttribute("count")==null){

	application.setAttribute("count", new Integer(0));

	}

	Integer count =(Integer)application.getAttribute("count");

	//使用application对象读取count参数的值，再在原值基础上累加1

	application.setAttribute("count",new Integer(count.intValue()+1));

	%>

　　<h2>

　　<!-- 输出累加后的count参数对应的值 -->

　　欢迎您：${user.username}，您已经访问过本页面 <font color="#ff0000"><%=application.getAttribute("count")%></font>次。。。。

　　</h2>
</body>
</html>