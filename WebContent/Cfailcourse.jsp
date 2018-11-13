<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>


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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">排课管理</a></li>
    <li><a href="#">调整课程</a></li>
    </ul>
    </div>
 <div class="formbody">
    <div class="formtitle"><span>调整课程</span></div>
    <ul class="seachform">
    <li>
    
	  <table border=1>
	  <caption class="table_title">排课失败的课程列表</caption>
	  <%
	  
	  //取出项目详细信息
	  String sql = "SELECT * From fail_course";
	  ResultSet rs = MyBean.executeQuery(sql);
	  while(rs.next()){
		  out.println("<tr>");
		  out.println("<td colspan='5' style=\"width:250px;\">"+rs.getString(1)+"</td>");
		  String course = rs.getString(1);
		  StringBuffer sss = new StringBuffer("<td>"+"<a href=\"Cadjust.jsp?course=");
      	  sss.append(course);
      	  sss.append("\" class=\"tablelink\" >调整课程时间</a></td>");
      	  out.println(sss);
		  out.println("</tr>");
		  
	  }
	  rs.close();
	  %>
	    
	  </table>
	</li>
	  
    </ul>


</body>
</html>