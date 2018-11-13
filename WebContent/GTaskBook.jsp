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
  	<li><a href="#tab1" class="selected">任务书</a></li> 

  	</ul>
    </div> 
    
    
  	<div id="tab1" class="tabson">
    
    
    <ul class="seachform">
    
    
    <li><label>学院</label>  
    <div class="vocation">
    <select class="select3">
    <option>文法学院</option>
    <option>计通学院</option>
    </select>
    </div>
    </li>
    
    <li><label>专业</label>  
    <div class="vocation">
    <select class="select3">
    <option>计算机</option>
    <option>法学</option>
    </select>
    </div>
    </li>
    
    <li><label>学号</label><input name="" type="text" class="scinput" /></li>
    
    
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
    
    </ul>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>标题</th>
        <th>学生姓名</th>
        <th>指导教师</th>
        <th>发布时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20180908</td>
        <td>流行歌曲的审美价值研究</td>
        <td>宋建成</td>
        <td>殷绪成</td>
        <td>2018-09-09 15:05</td>
        <td><a href="#" class="tablelink">上传</a>     <a href="#" class="tablelink"> 下载</a></td>
        </tr> 
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20180907</td>
        <td>论浪漫主义的理想性与艺术性</td>
        <td>李哲</td>
        <td>殷绪成</td>
        <td>2018-09-08 14:02</td>
        <td><a href="#" class="tablelink">上传</a>     <a href="#" class="tablelink">下载</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20180906</td>
        <td>文学的泛化与泛化的文学</td>
        <td>赵宇</td>
        <td>殷绪成</td>
        <td>2018-09-07 13:16</td>
        <td><a href="#" class="tablelink">上传</a>     <a href="#" class="tablelink">下载</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20180905</td>
        <td>自然主义与现实主义关系研究</td>
        <td>白泽琛</td>
        <td>殷绪成</td>
        <td>2018-09-06 10:36</td>
        <td><a href="#" class="tablelink">上传</a>     <a href="#" class="tablelink">下载</a></td>
        </tr>
    
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
