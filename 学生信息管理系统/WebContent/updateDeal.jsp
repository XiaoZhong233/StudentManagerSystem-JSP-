<%@page import="javabean.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
  <!--   一定要加这个，不然传入的请求参数会乱码 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新学生信息</title>
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
		
		String academy=request.getParameter("academy");
		String major=request.getParameter("major");
		String classs=request.getParameter("classs");
		String sno=request.getParameter("sno");
		String name=request.getParameter("name");
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		System.out.println(academy);
		System.out.println(major);
		System.out.println(classs);
		System.out.println(sno);
		System.out.println(name);
		ConnDB db=new ConnDB();
		db.getConnction();
		String sql="update studentdata set academy='"+academy+"', major='"+major+"',class='"+classs+"',sno='"+sno+"',name='"+name+"' where id="+id;
		try{
		db.update(sql);
		out.print(" <div center='align' width='100%'><font size='5'><strong> 成功更新学生信息"+  
			    "<br><a href='studentInfo.jsp'> <span id='jumpTo'>3</span>秒后系统会自动跳转，也可点击本处直接跳查看当前数据库数据</a> "+ 
			    "</strong><br> </font></div>");   
		String jsscript="<script type='text/javascript'> countDown(3,'studentInfo.jsp'); </script> ";
		out.print(jsscript);  
		}
		catch(Exception e){
			e.printStackTrace();
			out.print("<script>alert(更新失败！)</script>");
			out.print(" <div center='align' width='100%'><font size='5' color='red'><strong> 更新失败"+  
				    "<br><a href='studentInfo.jsp'> <span id='jumpTo'>3</span>秒后系统会自动跳转，也可点击本处直接跳转</a> "+ 
				    "</strong><br> </font></div>");  
			String jsscript="<script type='text/javascript'> countDown(3,'studentInfo.jsp'); </script> ";
			out.print(jsscript); 
		}
	%>
	    <font size="2"><strong> 成功修改数据！  
    <a href="studentInfo.jsp">查看当前数据库数据</a>  
    </strong><br> </font>  
</body>
</html>