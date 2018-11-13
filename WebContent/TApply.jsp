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
    <li><a href="#">系统设置</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">教材</a></li> 
    <li><a href="#tab2">教研/教改</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
   <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="TInsert.jsp" method="post" >
    <ul class="forminfo">
    <li><label>教材名称</label><input name="textbook_name" type="text" class="dfinput" /><i></i></li>
    <li><label>申请日期</label><input name="apply_time" type="date" class="dfinput" /><i></i></li>
    <li><label>作者编号</label><input name="first_author_id" type="text" class="dfinput" /><i></i></li>
    <li><label>类型</label><input name="type" type="text" class="dfinput" /><i></i></li>
    <li><label>大纲</label><input name="outline" type="text" class="dfinput" /><i></i></li>
    <li><label>字数</label><input name="word" type="text" class="dfinput" /><i></i></li>
    <li><label>应用课程</label><input name="course_name" type="text" class="dfinput" /><i></i></li>
    <li><label>预计经费</label><input name="fund" type="text" class="dfinput" /><i></i></li>
    <li><label>参编一编号</label><input name="partner_one" type="text" class="dfinput" /><i></i></li>
    <li><label>参编二编号</label><input name="partner_two" type="text" class="dfinput" /><i></i></li>  
    <li><label>编写目的</label><textarea name="purpose" cols="" rows="" class="textinput"></textarea></li>
    <li><label>编写成果</label><textarea name="goal" cols="" rows="" class="textinput"></textarea></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认提交"/></li>
    </ul>
    </form>
    
    </div>
    </div> 
    
    
  	<div id="tab2" class="tabson">
    
   <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="TInsert2.jsp" method="post" >
    <ul class="forminfo">
    <li><label>项目名称</label><input name="teachReserch_name" type="text" class="dfinput" /><i></i></li>
    <li><label>负责人工号</label><input name="first_id" type="text" class="dfinput" /><i></i></li>
    <li><label>申请时间</label><input name="apply_time" type="date" class="dfinput" /><i></i></li>
    <li><label>指南编号</label><input name="guide_id" type="text" class="dfinput" /><i></i></li>
    <li><label>项目类别</label><input name="type" type="text" class="dfinput" /><i></i></li>
    <li><label>旧项目完成情况</label><cite><input name="ifNfinish" type="radio" value="是" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="ifNfinish" type="radio" value="否" />否</cite></li>
    <li><label>预计经费</label><input name="fund" type="text" class="dfinput" /><i></i></li>
    <li><label>期待发表的论文</label><input name="paper" type="text" class="dfinput" /><i></i></li>
    <li><label>参编一编号</label><input name="partner_one" type="text" class="dfinput" /><i></i></li>
    <li><label>参编二编号</label><input name="partner_two" type="text" class="dfinput" /><i></i></li>
    <li><label>参编三编号</label><input name="partner_three" type="text" class="dfinput" /><i></i></li>  
    <li><label>研究背景</label><textarea name="background" cols="" rows="" class="textinput"></textarea></li>
    <li><label>研究基础</label><textarea name="bascis" cols="" rows="" class="textinput"></textarea></li>
    <li><label>研究目标</label><textarea name="goal" cols="" rows="" class="textinput"></textarea></li>
    <li><label>研究内容</label><textarea name="content" cols="" rows="" class="textinput"></textarea></li>
    <li><label>采用方法</label><textarea name="method" cols="" rows="" class="textinput"></textarea></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认提交"/></li>
    </ul>
    </form>
    
    </div>
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
