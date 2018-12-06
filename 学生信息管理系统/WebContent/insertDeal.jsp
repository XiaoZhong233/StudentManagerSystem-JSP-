<%@page import="javabean.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
  <!--   一定要加这个，不然传入的请求参数会乱码 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">       
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
<title>学生信息添加页</title>
</head>
<body>
<%
	String academy=request.getParameter("academy");
	String major=request.getParameter("major");
	String classs=request.getParameter("classs");
	String sno=request.getParameter("sno");
	String name=request.getParameter("name");
	try{
	ConnDB db=new ConnDB();
	db.getConnction();
	//String sql="insert into studentdata values('"+academy+"','"+major+"','"+classs+"','"+sno+"','"+name+"')";
	String sql=String.format("insert into studentdata (academy,major,class,sno,name)"+
			"values('%s','%s','%s','%s','%s')",academy,major,classs,sno,name);
	System.out.println(sql);
	db.insert(sql);
	out.print(" <div center='align' width='100%'><font size='5'><strong> 成功添加学生信息"+  
		    "<br><a href='studentInfo.jsp'> <span id='jumpTo'>3</span>秒后系统会自动跳转，也可点击本处直接跳查看当前数据库数据</a> "+ 
		    "</strong><br> </font></div>");   
	String jsscript="<script type='text/javascript'> countDown(3,'studentInfo.jsp'); </script> ";
	out.print(jsscript);  
	}
	catch(Exception e){
		e.printStackTrace();
		out.print(" <div center='align' width='100%'><font size='5' color='red'><strong> 添加失败"+  
			    "<br><a href='Insert.jsp'> <span id='jumpTo'>3</span>秒后系统会自动跳转，也可点击本处直接跳转重新添加</a> "+ 
			    "</strong><br> </font></div>");  
		String jsscript="<script type='text/javascript'> countDown(3,'Insert.jsp'); </script> ";
		out.print(jsscript); 
	}
%>
</body>
</html>