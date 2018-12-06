<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javabean.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%request.setCharacterEncoding("UTF-8"); %>
  <!--   一定要加这个，不然传入的请求参数会乱码 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>学生信息查询结果</title>
<link type="text/css" rel="stylesheet" href="tablecss.css"/>
</head>
<body>
<%
	String xuehao=request.getParameter("xuehao");
	ConnDB connDB=new ConnDB();
	Connection connection=connDB.getConnction();
	String sql="select * from studentdata where sno='"+xuehao+"'";
	ResultSet rs=null;
	try{
	rs=connDB.select(sql);
	}catch(Exception e){
		e.printStackTrace();
		out.print("<script>alert(\"查询失败\")</script>");
		out.print("window.location='query.jsp'");
	}
 %>
 
 
 
 <div align="center">
 <font size="4"><strong> 学生信息：</strong><br>  
        下面的表格就是查询结果：
         </font><br> 
         </div>
          
 <div class="table_div">
		<!-- 导航栏部分 -->
		<div class="div_clear">
  			<div class="left_top"></div>
  			<div class="center_top">
  				<div style="float:left">
  				<img src="./tab/images/tb.gif" width="16px" height="16px" style="vertical-align:middle"/>
  				<span style="font-weight:bold">你当前的位置</span>：<a href='studentInfo.jsp'>[学生信息管理系统]</a>-<a href='query.jsp'>[学生查询]</a>-[按学号查询]
 		 		</div>
 		 		<div style="float:right;padding-right:50px">
 		 		<img width='16' height='16' src="./tab/images/query.png" style="vertical-align:middle"/>
					<a href="query.jsp"><strong>查找学生记录</strong></a>&nbsp;
 		 		</div>
 		 		
		 		<div style="float:right;padding-right:50px">
		  			<img width='16' height='16' src="./tab/images/add.gif" style="vertical-align:middle"/>
					<a href="Insert.jsp"><strong>新增学生记录</strong></a>&nbsp;
		  		</div>
  			</div>
  			<div class="right_top"></div>
  		</div>
  		<!-- 导航栏部分结束 -->
  		<!-- 表格部分 -->
  		
  		<div class="div_clear">
  			<div class="left_center"></div>
  			
  				<!-- 表格内容块 -->
  			 	<div class="center_center">
  			 		  <div class="table_content">
  			 		  	<table cellspacing="0px" cellpadding="0px">
  			 		  		<!-- 表头 -->
  			 		  		<thead>
  			 		  			  <tr>
  									<th width="16%">学院名称</th>
  									<th width="16%">专	业</th>
  									<th width="16%">班	级</th>
  									<th width="16%">学	号</th>
  									<th width="16%">姓	名</th>
  									<th width="20%" style="border-right:none">操作</th>
  								  </tr>
  			 		  		</thead>
  			 		  		<!-- 表体 -->
  			 		  		<tbody>
  			 		  			
					  			<%
					  				int count=0;
					  				if(!rs.next()){
					  					out.print("<tr>");  
					  					out.print("<td colspan=6>");  
					  					out.print(" <div center='align' width='100%'><font size='5' color='red'><strong> 查询失败：未查询到该学生记录"+  
					  						    "<br><a href='query.jsp'> <span id='jumpTo'>8</span>秒后系统会自动跳转，也可点击本处直接跳转重新查询</a> "+ 
					  						    "</strong><br> </font></div>");  
					  					String jsscript="<script type='text/javascript'> countDown(8,'query.jsp'); </script> ";
					  					out.print(jsscript);
					  					out.print("</td>");
					  					out.print("</tr>");
					  				}
					  				else{
					  					rs.beforeFirst();
					        	  		while(rs.next()){
					        	  			out.print("<tr>");  
					                        out.print("<td>" + rs.getString(1).toString()+ "</td>");  
					                        out.print("<td>" + rs.getString(2).toString() + "</td>");  
					                        out.print("<td>" + rs.getString(3).toString() + "</td>");  
					                        out.print("<td>" + rs.getString(4).toString() + "</td>");
					                        out.print("<td>" + rs.getString(5).toString() + "</td>");
					                        out.print("<td width='20%' style='border-right:none'><img width='16' height='16' src=\"./tab/images/delete.gif\" ><a href=Delete.jsp?id="+rs.getString(6) + " onclick=\"return window.confirm('是否确定删除？')\" >删除</a>"); 
					                        out.print("<img width='16' height='16' src=\"./tab/images/edit.gif\" > <a href=Update.jsp?id="+rs.getString(6) + " onclick=\"return window.confirm('是否确定编辑？')\" >编辑</a></td>"); 
					                        out.print("</tr>");
					                        count++;
					        	  		}
					  				}
					        	%>
  			 		  		<!-- 表尾 -->
  			 		  		<tfoot>
  			 		  			
  			 		  		</tfoot>
  			 		  	</table>
  			 		  		
  			 		  </div>
  			 	</div>
  			 	
  			 	<div class="right_center"></div>
  		</div>
  		<!-- 底部框 -->
  		<div class="div_clear">
  			<div class="left_bottom"></div>
  			<div class="center_bottom">
  				<span>&nbsp;&nbsp;共有<%=count %>条记录，当前第 1/1 页</span>
  				<div style="float:right;padding-right:30px">
  					 <input type="button" value="首页"/>
  				 	 <input type="button" value="上页"/>
   					 <input type="button" value="下页"/>
				     <input type="button" value="尾页"/>
   					 <span>跳转到</span>
   					 <input type="text" size="1"/>
   					 <input type="button" value="跳转"/>
  				</div>
  			</div>
  			<div class="right_bottom"></div>	
  		</div>
  	</div>
 
 <%
	if (rs != null) {  
  	  rs.close();  
	}  	
 %>
 
 
</body>
</html>