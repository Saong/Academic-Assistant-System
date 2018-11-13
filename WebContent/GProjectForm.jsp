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
    <li><a href="#">表单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="GInsert.jsp" method="post">
    <ul class="forminfo">
    <li><label>论文题目</label><input name="pro" type="text" class="dfinput" /><i></i></li>
    <li><label>学生姓名</label><input name="name" type="text" class="dfinput" /><i></i></li>
    <li><label>学生学号</label><input name="stuid" type="text" class="dfinput" /><i></i></li>
    <li><label>指导教师姓名</label><input name="teacher" type="text" class="dfinput" /><i></i></li>
    <li><label>当前学期</label>  
    <div class="vocation">
    <select name="semester" class="select2">
    <option value="2017-2018-01">2017-2018-01</option>
    <option value="2017-2018-02">2017-2018-02</option>
    <option value="2018-2019-01">2018-2019-01</option>
    <option value="2018-2019-02">2018-2019-02</option>
    </select>
    </div>
    </li>
    <li><label>选题概述</label><textarea name="summary" cols="" rows="" class="textinput"></textarea></li>
    
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认提交"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
