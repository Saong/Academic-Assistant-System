<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>软件工程课程设计</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录本科教学秘书辅助系统</span>      
    </div>
    
    <div class="loginbody">
   
       
    <div class="loginbox" style="margin-top:230px">
    <form action = "dologin.jsp" Method="post">
    <table frame=void rules=none style="margin-top:80px;margin-left:280px;boder:0;">
    <tr>
    <td style="border-style:none;"><input type="text" name="account" class="loginuser" /></td>
    </tr>
    <tr>
    <td style="border-style:none;">&nbsp</td>
    </tr>
    <tr>
    <td style="border-style:none;"><input type="password" name="password" class="loginpwd" /></td>
    </tr>
    <td style="border-style:none;">&nbsp</td>
    <tr>
    <td style="border-style:none;"><b>请选择您的身份：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b><input type="radio" name="role" value="教学秘书" checked="checked" />教学秘书&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="radio" name="role" value="教师"/>教师&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="radio" name="role" value="学生"/>学生
    <tr>
    <td style="border-style:none;" align='left'><input type="submit" class="loginbtn" value="登录"    /> </td>
    </tr>
    </table>
    </form>
    </div>
    </div>
    
    
    
    <div class="loginbm">版权所有  计1502班软件工程-教学秘书辅助系统课程设计</div>
</body>
</html>
