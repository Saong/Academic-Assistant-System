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
    <li><a href="#">待立项审批项目</a></li>
    <li><a href="#">查看详细信息</a></li>
    </ul>
    </div>
 <div class="formbody">
    <div class="formtitle"><span>查看详细信息</span></div>
    <ul class="seachform">
    <li>
    
	  <table border=1>
	  <caption class="table_title">SRTP项目详细信息</caption>
	  <%
	  String id=request.getParameter("id");
	  
	  //取出项目详细信息
	  String sql = "SELECT srtp_name,teacher_name,introduction,major,teacher_telnum,teacher_email FROM srtp_tea WHERE id ="+id;
	  ResultSet rs = MyBean.executeQuery(sql);
	  log("idddddddwei"+id);
	  rs.next();
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目名称</td>");
	  out.println("<td colspan = '5'>"+rs.getString(1)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>指导教师</td>");
	  out.println("<td>"+rs.getString(2)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>联系方式</td>");
	  out.println("<td>"+rs.getString(5)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>邮箱</td>");
	  out.println("<td>"+rs.getString(6)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td colspan = '2' bgcolor=#f0f0f0 nowrap='nowrap'>期望参与项目学生的专业</td>");
	  out.println("<td colspan = '4' >"+rs.getString(4)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td colspan = '6' bgcolor=#f0f0f0 nowrap='nowrap'>项目概述</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td colspan = '6' align='left'>"+rs.getString(3)+"</td>");
	  out.println("</tr>");
	  rs.close();
	  %>
	    
	  </table>
	</li>
	  
    </ul>



</body>
</html>