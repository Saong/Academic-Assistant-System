<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
    <li><a href="#">课程信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>待调整课程列表</span></div>
    <form action="Cadjusting.jsp" method="post" >
    <ul class="forminfo">
    <%
    request.setCharacterEncoding("utf-8");
    
    String course = request.getParameter("course");
    out.println("<li>您正在调整的课程为：<b style=\"font-size:20px;\">"+course+"</b></li><br>");
    String[] CourseArray = course.split("\\s+");
    String[] name = CourseArray[0].split("：");
    String realname = name[1];
    session.setAttribute("realname",realname);
    String[] course2 = CourseArray[1].split("：");
    String realcourse = course2[1];
    session.setAttribute("realcourse",realcourse);
    String[] type = CourseArray[2].split("：");
    String realtype = type[1];
    session.setAttribute("realtype",realtype);
    %>
     <li><label>上课地点</label>
     <div class="vocation">
    <select name="building" class="select2">
    	<option value="逸夫楼">逸夫楼</option>
    	<option value="教学楼">教学楼</option>
    	<option value="机电楼">机电楼</option> 
    </select>
   </div>
   </li>
   
    <li><label>上课日期</label> 
    <div class="vocation">
    <select name="day" class="select2">
      <option value="1">星期一</option>
      <option value="2">星期二</option>
      <option value="3">星期三</option>
      <option value="4">星期四</option>
      <option value="5">星期五</option>
    </select>
    </div>
    </li>
    
    <li><label>上课时间</label> 
    <div class="vocation">
    <select name="time" class="select2">
      <option value="1">第一节</option>
      <option value="2">第二节</option>
      <option value="3">第三节</option>
      <option value="4">第四节</option>
      <option value="5">第五节</option>
    </select>
    </div>
    </li>
    
    
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="调整课程"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>