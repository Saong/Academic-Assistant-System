<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
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
    <form action="SInsertProject.jsp" method="post" >
    <ul class="forminfo">
    <li><label>项目名称</label><input name="srtp_name" type="text" class="dfinput" /><i>题目不能超过30个字符</i></li>
    <li><label>负责学生学号</label><input name="leader_id" type="text" class="dfinput" /><i></i></li>
    <li><label>指导教师</label><input name="teacher_name" type="text" class="dfinput" /><i></i></li>
    <li><label>发布时间</label><input name="publish_time" type="text" class="dfinput" /><i></i></li>
    <li><label>项目级别</label><input name="level" type="text" class="dfinput" /><i></i></li>
    <li><label>项目预算</label><input name="budget" type="text" class="dfinput" /><i></i></li>
    <li><label>队员1学号</label><input name="member_id1" type="text" class="dfinput" /><i></i></li>
    <li><label>队员2学号</label><input name="member_id2" type="text" class="dfinput" /><i></i></li>
    <li><label>项目背景</label><textarea name="background" cols="" rows="" class="textinput"></textarea></li>
    <li><label>项目成果</label><textarea name="result" cols="" rows="" class="textinput"></textarea></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认提交"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>