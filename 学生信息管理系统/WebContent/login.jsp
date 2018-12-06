<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理系统登录页</title>
<script language="javascript">
	function check(){
		var username=document.getElementById("username");
		var password=document.getElementById("password");
		if(username.value==""||password.value==""){
			alert("用户名或密码不可为空！");
			return false;
		}
		return true;
	}
</script>
<script language="javascript">
	function regist(){
		//跳转至注册页
		window.location='register.jsp';
	}
</script>
</head>
<body>
<h1 align='center'>学生信息管理系统</h1>
<form action="login_deal.jsp">
<div>
<table align='center'>
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
		<td align='center' style="height: 1; "><input type="button" value="注册" onClick="regist()"></td>
		<td align='center' style="width: 1; height: 61px"><input type="submit" value="提交" onClick="return check()"></td>
	</tr>
		
	</table>
	</div>
</form>


</body>
</html>