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
    <li><a href="#">自动排课</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div class="formtitle"><span>开始排课</span></div>
    <ul class="seachform">
    <li>
    <div class="vocation">
    <form action="Ccreating.jsp" method="post" >
    
    </div>
    </li>
     <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="开始排课"/></li>
    </ul>
    </form>
    </div>

</body>
</html>