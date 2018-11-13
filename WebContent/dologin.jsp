<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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

    <%
      request.setCharacterEncoding("utf-8");
      String account = request.getParameter("account");
      String password = request.getParameter("password");
      String role = request.getParameter("role").toString();
      String sql = "SELECT password FROM password WHERE id= \'"+account+"\'";
      ResultSet rs = MyBean.executeQuery(sql);
      rs.next();
      String realpass = rs.getString(1);
      log("账号为："+account);
      log("密码为："+password);
      log("登陆角色为："+role);
      if(role.equals("教学秘书")) log("是教学秘书啦！");
      else log("我才不是教学秘书！");
      if(account!=null){
    	  if(password.equals(realpass))
    	  {
    		  if(role.equals("教学秘书")){
    		  session.setAttribute("account", account);
    		  log("登陆成功");
    		  response.sendRedirect("main.html");}
    		  else if(role.equals("教师")){
    			  session.setAttribute("account", account);
    			  response.sendRedirect("mainteacher.jsp");
    		  }
    		  else if(role.equals("学生")){
    			  session.setAttribute("account", account);
    			  response.sendRedirect("mainstu.jsp");
    		  }
    	  }
    	  else{
    		  out.println("登录不成功");
    	  }
      }
    %>
<script type="text/javascript" language="javascript">
alert("密码错误！");
window.document.location.href="login.jsp";
</script>