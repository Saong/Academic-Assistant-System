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
    
    <div class="formtitle"><span>北京科技大学本科课程认领表</span></div>
    <form action="CInsertCourse.jsp" method="post" >
    <ul class="forminfo">
    <li><label>课程名称</label><input name="course_name" type="text" class="dfinput" /><i></i></li>
    <li><label>教师姓名</label><input name="teacher_name" type="text" class="dfinput" /><i></i></li>
    <li><label>学分数</label><input name="freq" type="text" class="dfinput" /><i></i></li>
    <li><label>期望上课日期</label>
       <input TYPE="checkbox" name="day1" VALUE="1" class="dfinput1"/> 周一
       <input TYPE="checkbox" name="day2" VALUE="1" class="dfinput1"/> 周二
       <input TYPE="checkbox" name="day3" VALUE="1" class="dfinput1"/> 周三
       <input TYPE="checkbox" name="day4" VALUE="1" class="dfinput1"/> 周四
       <input TYPE="checkbox" name="day5" VALUE="1" class="dfinput1"/> 周五</li>
    <li><label>期望上课时间</label>
       <div style="margin:auto;">
       <input TYPE="checkbox" name="c1" VALUE="1" class="dfinput1"/> 第一节 8:00-9:35
       <input TYPE="checkbox" name="c2" VALUE="1" class="dfinput1"/> 第二节 9:50-11:30
       <input TYPE="checkbox" name="c3" VALUE="1" class="dfinput1"/> 第三节 13:30-15:05
       <input TYPE="checkbox" name="c4" VALUE="1" class="dfinput1"/> 第四节 15:20-16:55
       <input TYPE="checkbox" name="c5" VALUE="1" class="dfinput1"/> 第五节 17:10-18:45</div></li>
     <li><label>上课地点</label>
     <div class="vocation">
    <select name="building" class="select2">
    	<option value="逸夫楼">逸夫楼</option>
    	<option value="教学楼">教学楼</option>
    	<option value="机电楼">机电楼</option> 
    </select>
   </div>
   </li>
   
    <li><label>课程类型</label> 
    <div class="vocation">
    <select name="classes" class="select2">
      <option value="必修">必修</option>
      <option value="公选">公选</option>
      <option value="专选">专选</option>
      <option value="实验">实验</option>
    </select>
    </div>
    </li>
    
    
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认认领"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>