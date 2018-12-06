<%@page import="java.sql.*"%>
<%@page import="javabean.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="tablecss.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新学生信息</title>
<script type="text/javascript">
	function check(form) {
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
</head>
<body>
<%
	ConnDB db=new ConnDB();
	db.getConnction();
	String id=request.getParameter("id");
	String sql="select * from studentdata where id='"+id+ "'";
	ResultSet rs=db.select(sql);
	rs.next();
	
%>
<h1 align="center">修改学生信息页</h1>








	<form action="updateDeal.jsp" method="post" onsubmit=" return check(this)" >
	<div>
	<table align="center" border="" cellpadding="10" bordercolor="#89cff0" >
		
			
			<tr><td>学院名称：</td>
				<td><input type="text" name="academy" value=<%="'"+rs.getString(1)+"'"%>/></td>
			</tr>
			<tr><td>专　　业：</td>
				<td><input type="text" name="major" value=<%="'"+rs.getString(2)+"'"%>/></td>
			</tr>
			<tr><td>班　　级：</td>
			<td><input type="text" name="classs" value=<%="'"+rs.getString(3)+"'"%>/></td>
			</tr>
			<tr><td>学　　号：</td>
				<td><input type="text" name="sno" value=<%="'"+rs.getString(4)+"'"%>/></td>
			</tr>
			<tr><td>姓　　名：</td>
				<td><input type="text" name="name" value=<%="'"+rs.getString(5)+"'"%>/></td>
				</tr>
			<tr><td colspan="2" align="right"><input type="submit" value="修  改"></td></tr>
	</table>
		<input type="hidden" name="id" value=<%="'"+rs.getString(6)+"'"%>/>
		<%
			if(rs!=null){
				rs.close();
			}
		%>
	
	</div>
	</form>
</body>
</html>