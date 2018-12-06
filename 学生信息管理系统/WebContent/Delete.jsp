<%@page import="javabean.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
  <!--   一定要加这个，不然传入的请求参数会乱码 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息删除页面</title>
<script>
function countDown(secs,surl){           
	 var jumpTo = document.getElementById('jumpTo');  
	 jumpTo.innerHTML="<strong>"+secs+"</strong>";    
	 if(--secs>0){       
	     setTimeout("countDown("+secs+",'"+surl+"')",1000);       
	     }       
	 else{         
	     location.href=surl;       
	     -ma  
	     }       
	 }  
</script>
</head>
<body>
	<%
	try
	{
		ConnDB db=new ConnDB();
		db.getConnction();
		String id=request.getParameter("id");
		System.out.println(id);
		String sql_delete="delete from studentdata where id= '" +id+"'";
		db.delete(sql_delete);
		out.print(" <div center='align' width='100%'><font size='5'><strong> 成功删除学生信息"+  
			    "<br><a href='studentInfo.jsp'> <span id='jumpTo'>3</span>秒后系统会自动跳转，也可点击本处直接跳查看当前数据库数据</a> "+ 
			    "</strong><br> </font></div>");   
		String jsscript="<script type='text/javascript'> countDown(3,'studentInfo.jsp'); </script> ";
		out.print(jsscript);  
	}
	catch(Exception e){
		e.printStackTrace();
		out.print("<script>alert(删除失败！)</script>");
		out.print(" <div center='align' width='100%'><font size='5' color='red'><strong> 添加失败"+  
			    "<br><a href='studentInfo.jsp'> <span id='jumpTo'>3</span>秒后系统会自动跳转，也可点击本处直接跳转重新删除</a> "+ 
			    "</strong><br> </font></div>");  
		String jsscript="<script type='text/javascript'> countDown(3,'studentInfo.jsp'); </script> ";
		out.print(jsscript); 
	}
	%>
</body>
</html>