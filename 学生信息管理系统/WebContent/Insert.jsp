<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function check(form){
		if (form.academy.value == "") {
			alert("学院名称不能为空");
			return false;
		}
		if (form.major.value == "") {
			alert("专业不能为空");
			return false;
		}
		if (form.classs.value == "") {
			alert("班级不能为空");
			return false;
		}
		
		if (form.name.value == "") {
			alert("姓名不能为空");
			return false;
		}
		
		//验证数字的正则表达式 
		if (form.sno.value == "") {
			alert("学号不能为空");
			return false;
		}
		else
			{
				var reg=/^\d+$/;
				var number=form.sno.value;
				if(number.match(reg)){
					
				}
				else
					{
					
						alert("学号必须为纯数字");
						return false;
					}
			}
		
		
	
		return true;
	}
</script>
<title>添加学生信息记录</title>
</head>
<body>
<h1 align="center">添加学生信息记录</h1>
<br>
<br>
<form action="insertDeal.jsp" method="post" onsubmit="return check(this)">
<table align="center" border="" cellpadding="10" bordercolor="#89cff0" >
		
			
			<tr>
				<td>学院名称：</td>
				<td><input type="text" name="academy" /></td>
			</tr>
			<tr>
				<td>专　　业：</td>
				<td><input type="text" name="major" /></td>
			</tr>
			<tr>
				<td>班　　级：</td>
				<td><input type="text" name="classs" /></td>
			</tr>
			<tr>
				<td>学　　号：</td>
				<td><input type="text" name="sno"/></td>
			</tr>
			<tr>
				<td>姓　　名：</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
			<td align='center' style="height: 1; "><input type="reset" value="重置"></td>
			<td colspan="2" align="right"><input type="submit" value="增		加"></td>
			</tr>
	</table>
</form>
</body>
</html>