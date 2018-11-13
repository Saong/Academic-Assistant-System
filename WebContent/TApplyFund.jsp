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
    
    <div class="formtitle"><span>经费信息</span></div>
    <form action="TInsertFund1.jsp" method="post" >
    <ul class="forminfo">
    <li><label>办公用品费</label><input name="office_supply" type="text" class="dfinput" /><i></i></li>
    <li><label>资料费</label><input name="data_fee" type="text" class="dfinput" /><i></i></li>
    <li><label>差旅费</label><input name="travel_expenses" type="text" class="dfinput" /><i></i></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认提交"/></li>
    </ul>
    </form>
    
    </div>
    </div> 
    
    
  	<div id="tab2" class="tabson">
    
   <div class="formbody">
    
    <div class="formtitle"><span>经费信息</span></div>
    <form action="TInsertFund2.jsp" method="post" >
    <ul class="forminfo">
    <li><label>办公用品费</label><input name="office_supply" type="text" class="dfinput" /><i></i></li>
    <li><label>资料费</label><input name="data_fee" type="text" class="dfinput" /><i></i></li>
    <li><label>差旅费</label><input name="travel_expenses" type="text" class="dfinput" /><i></i></li>
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
