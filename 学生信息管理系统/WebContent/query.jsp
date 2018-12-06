<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择查询方式</title>
<script language='javascript'>
	function byxuehao(){
		window.location='queryByXueHao.jsp';
	}
</script>
<script language='javascript'>
	function byxingming(){
		window.location='queryByXingMing.jsp';
	}
</script>
<script language='javascript'>
	function bysql(){
		window.location='queryBySQL.jsp';
	}
</script>
</head>
<body>
<table align="center" cellpadding="5" cellspacing="5" >
	<tr>
	<td>
		<input type="button" value="按照学号查找" onClick="byxuehao()" style="width: 165px; ">
	</td>
	</tr>
	<tr>
	<td>
		<input type="button" value="按照姓名查找" onClick="byxingming()" style="width: 165px; ">
	</td>
	</tr>
	<tr>
	<td>
		<input type="button" value="按SQL语句查找" onClick="bysql()" style="width: 165px; ">
	</td>
	</tr>
</table>
</body>
</html>