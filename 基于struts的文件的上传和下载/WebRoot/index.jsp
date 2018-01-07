<%@ page language="java" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base target="_self" />
		<title>首页</title>
		<style type="text/css">
<!--
body {
	font-size: 10pt;
	text-align: center;
}

dl {
	margin: 0;
}

dt {
	background-color: #666;
	color: #fff;
	margin: 1px;
	padding: 0 3px;
}

dd {
	margin: 3px;
}

div {
	margin: auto;
	line-height: 150%;
	text-align: left;
	width: 600px;
	border: 1px solid #049ed0;
}

#postBox {
	margin-top: 10px;
}

dd.button {
	text-align: center;
}

dd.button input {
	margin: 0 20px;
}

.messageHistabs {
	width: 60%;
}

.messageHistabs li {
	margin: 0 2px 0 0;
	background: #dcecf8 url(../images/steps_right.gif) no-repeat right top;
	float: left;
	cursor: pointer;
	text-align: left;
}

ul,ol {
	list-style: none outside none;
}

th {
	color: #049ed0;
	text-align: center;
}

td {
	text-align: left;
}

a {
	color: #049ed0;
}
//
-->
</style>
		<script language="javascript" src="<%=path%>/js/zxc.js"></script>
	</head>
	<body bgcolor="#F4F4F4">
		<h1>
			<font color="#049ed0" face="Arial">简易文件<a
				style="color: #049ed0;" href="<%=path%>/uploadfile.jsp">上传</a>与下载系统</font>
		</h1>
		<span style="float: left"> 当前用户： <s:property
								value="#session.user.username" /> &nbsp;&nbsp;&nbsp;&nbsp;登录时间:
							<script type="text/javascript">
document.write(new Date().toLocaleString())
</script> </span>
		<span
			style="color: #049ed0; float: right; text-decoration: underline; cursor: pointer;"><a
			onclick="javascript:window.location.href='<%=path%>/logout.jsp'" style="color: #049ed0;">退出系统</a>
		</span>
		<br>
		<input type="hidden" id="path" value="<%=path%>" />
		<form name="FileListForm" id="FileListForm"
			action="<%=path%>/query.action" method="post">
			<font color="#141F78" size="5">文件列表</font>
			<table id="me" border="1" align="center" width="80%">
				<thead>
					<tr>
						<th width="5%">
							<span>序号</span>
						</th>
						<th width="25%">
							<span>文件名称</span>
						</th >
						<th width="15%">
							<span>文件大小</span>
						</th>
						<th width="5%">
							<span>下载次数</span>
						</th>
						<th width="15%">
							<span>上传者IP</span>
						</th>
						<th width="15%">
							<span>上传时间</span>
						</th>
						<th width="10%">
							<span>操作</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:if
						test="(pageListData.dataList!=null)&&(!pageListData.dataList.isEmpty())">
						<s:iterator value="#request.pageListData.dataList" id="u"
							status="st">
							<tr id="changecolor" bgcolor="#FFFFFF" align="center">
								<td>
									<s:property value="#st.index+1+(currentPage-1)*pageSize" />
								</td>
								<td>
									<s:property value="#u.fileName" />
								</td>
								<td>
									<s:property value="#u.fileSize" />
								</td>
								<td>
									<s:property value="#u.fileTimes" />
								</td>
								<td>
									<s:property value="#u.fileIp" />
								</td>
								<td>
									<s:property value="#u.fileUptime" />
								</td>
								<td>
								    <a href="javascript:window.location.href='<%=path%>/download.action?fileId=${u.fileId}&&fileName=${u.fileName}&&fileSavename=${u.fileSavename}'">下载</a>
									<a href="javascript:window.location.href='<%=path%>/delete.action?fileId=${u.fileId}'"
										onclick="return confirm('删除后无法恢复,确定要删除吗')">删除</a>
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<s:property value="#request.pageListData.footer" escape="false" />
		</form>
	</body>
</html>
