<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册管理员</title>
</head>
<body>
<h1 align ="center"> 管理员注册页面</h1>
<form action="registerDone.jsp">
<table align="center">
	<tr>
	<td>用户名：</td>
	<td colspan='2'><input id="username" name="username" type="text" style="width: 90%; "></td>
	</tr>
	<tr>
	<td>密码：</td>
	<td colspan='2'><input id="password" name="password" type="password" style="width: 90%; "></td>
	</tr>
	<tr>
		<td align='center' style="height: 1; "><input type="reset" value="重置"></td>
		<td align='center' style="height: 1; "><input type="submit" value="注册"></td>
	</tr>
</table>
</form>
</body>
</html>