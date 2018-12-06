<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息查询</title>
</head>
<body>
<h1 align="center">
请输入姓名，进行查询
</h1>
<form action="queryByXingMingDone.jsp" >
<table align="center" cellpadding="5" cellspacing="5">
	<tr>
	<td>姓名：</td>
	<td colspan='2'><input id="name" name="name" type="text" style="width: 90%; "></td>
	</tr>
	<tr style="width: 312px; ">
		<td align='center' style="height: 1; "></td>
		<td align='center' style="height: 1; width: 182px"><input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="查询"></td>
	</tr>
</table>
</form>
</body>
</html>