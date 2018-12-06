<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息查询</title>
<style type='text/css'>
	.main{
    text-align: center; /*让div内部文字居中*/
    background-color: #fff;
    opacity:1;
    border-radius: 20px;
    width: 50%;
    height: 500px;
    margin: auto;
    position: relative;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border: 2px solid black; 
}
</style>
<style type='text/css'>
	.leftDiv{
	text-align: left; /*让div内部文字居中*/
	width: 100%;
    height: 100%;
    left:0;
  	opacity:1;
    top:27%;
    position: absolute;
    float:left;
	}
</style>
<script language='javascript'>
	function check(form){
		var text = document.getElementById('sql').value.length;
		if(text==0){
			alert("SQL语句不可为空");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<h1 align='center'>使用SQL查询语句进行查找</h1>

<div class='main'  >

	<br>
	<div>
	<form action="queryBySQLDone.jsp" onsubmit=" return check(this)" >
	<table align="left" cellpadding="5" cellspacing="5">
	<tr>
	<td colspan='2'>SQL语句：&nbsp;</td>
	<td colspan='6'><textarea  name="sql" id='sql' cols="28" rows="5" wrap="virtual"></textarea></td>
		<td align='center' style="height: 1; "></td>
		<td align='center' style="height: 1; width: 182px"><input type="submit" value="查询">&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></td>
	</tr>
	</table>
	</form>
	</div>
	<br>
	<div class='leftDiv' >
	
	<h5 align=center>以下是注意事项</h5>
	<p>只支持简单查询，例如select [属性] from [表] where [约束]。不支持连接查询</p>
	<font size='5'  >
	<ul>
		<li >学生信息表名称---><Strong>studentdata</Strong></li>
		<li>属性列:academy--->学院名</li>
		<li>属性列:major--->专业名</li>
		<li>属性列:class--->班级</li>
		<li>属性列:sno--->学号</li>
		<li>属性列:name--->姓名</li>
	</ul>
	</font>
	</div>
</div>
<br>
<br>
</body>
</html>