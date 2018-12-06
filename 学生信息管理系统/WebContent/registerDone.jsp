<%@page import="javabean.ConnDB"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%request.setCharacterEncoding("UTF-8"); %>
  <!--   一定要加这个，不然传入的请求参数会乱码 -->
<jsp:useBean id="user" class="javabean.User"/>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册结果</title>
</head>
<body>
<%
	try
	{
		ConnDB db=new ConnDB();
		Connection connection=db.getConnction();
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());
		String sql="insert into user(username,password) values('"+user.getUsername()+"','"+user.getPassword()+"')";
		db.insert(sql);
		out.print("<script>alert('注册成功'); window.location='login.jsp' </script>");  
	}
	catch(Exception e){
		e.printStackTrace();
		 out.print("<script>alert('注册失败！请重新注册'); window.location='register.jsp' </script>");  
	}
%>
		
</body>
</html>