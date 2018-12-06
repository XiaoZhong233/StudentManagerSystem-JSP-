<%@page import="java.sql.*"%>
<%@page import="javabean.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	

<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	Object company=request.getAttribute("company");
%>
<%
	ConnDB connDB=new ConnDB();
	Connection connection=connDB.getConnction();
	String sql="select * from user where username='"+username+
				"' and password='"+password+"'";
	System.out.println(username);
	System.out.println(password);
	ResultSet rs=connDB.select(sql);
	
	if(rs.next()){
		out.print("<script>alert('登录成功'); window.location='studentInfo.jsp' </script>"); 
	}
	else
	{
		out.print("<script>alert('登录失败,用户或密码错误，请重新登录,如未注册，请先注册再登录'); window.location='login.jsp' </script>");  
	}
%>


</body>
</html>