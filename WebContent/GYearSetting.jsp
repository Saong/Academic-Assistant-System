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
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 120			  
	});
});
</script>
<style type="text/css">
.year{ font-size:10px;}
.seachform{ 
margin-top:20px;
margin-left:20px;
}
</style>

</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">设置学年</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div class="formtitle"><span>设置学年</span></div>
    <ul class="seachform">
    <li>
    <label style="font-size: 20px;">请设置当前学年：</label>  
    <div class="vocation">
    <form action="GYear.jsp" method="post" >
    <select name="semester" class="select1">
      <option value="2016-2017-01">2016-2017-01</option>
      <option value="2016-2017-02">2016-2017-02</option>
      <option value="2017-2018-01">2017-2018-01</option>
      <option value="2017-2018-02">2017-2018-02</option>
      <option value="2018-2019-01">2018-2019-01</option>
      <option value="2018-2019-02">2018-2019-02</option>
    </select>
    
    </div>
    </li>
     <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确定"/></li>
    </ul>
    </form>
    </div>

</body>
</html>