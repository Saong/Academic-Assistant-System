<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教学秘书辅助系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">系统设置</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
  	<li><a href="#tab1" class="selected">毕业设计项目</a></li> 

  	</ul>
    </div> 
    
    
  	<div id="tab1" class="tabson">
    
    

    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>ID<i class="sort"><img src="images/px.gif" /></i></th>
        <th>毕业设计选题名称</th>
        <th>学生姓名</th>
        <th>指导教师</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
        
        
        
        String semester1 = session.getAttribute("semester1").toString();
        //查看所有待立项的项目并输出
        String sql = "SELECT g.id,g.pro,s.name,g.teacher FROM ggg AS g INNER JOIN student AS s WHERE g.stuid = s.id AND g.semester = "+"\'"+semester1+"\'";
        ResultSet rs = MyBean.executeQuery(sql);
        log(sql);
        while(rs.next()){
        	out.println("<tr>");
        	out.println("<td>"+rs.getString(1)+"</td>");//编号
        	String srtpid = rs.getString(1);
        	//log("srtpid为："+srtpid);
        	out.println("<td>"+rs.getString(2)+"</td>");//课题名称
        	out.println("<td>"+rs.getString(3)+"</td>");//学生姓名
        	out.println("<td>"+rs.getString(4)+"</td>");//指导教师姓名
        	StringBuffer sss = new StringBuffer("<td>"+"<a href=\"GInformation.jsp?id=");
        	sss.append(srtpid);
        	sss.append("\" class=\"tablelink\" > 查看详细信息</a></td>");
        	out.println(sss);
        	out.println("</tr>");
        }
       // rs.close();
        %>
        </tbody>
    </table>
    
   
  
    
    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>

</body>
</html>