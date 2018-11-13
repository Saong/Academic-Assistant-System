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
	  String sql = "SELECT i.id,i.srtp_name,s.name,i.teacher_name,i.level,i.budget,i.background, i.result FROM information AS i INNER JOIN student AS s WHERE i.leader_id = s.id AND i.id ="+id;
	  ResultSet rs = MyBean.executeQuery(sql);
	  
	  //取出队员信息
	  String stusql = "SELECT student.id,student.name,student.institute,student.class, information.id as srtpid FROM student JOIN information "
			  +"ON (student.id=information.leader_id OR student.id=information.member_id1 OR student.id=information.member_id2)"
			  +"WHERE information.id="+id;
	  ResultSet sturs = MyBean.executeQuery(stusql);
	  rs.next();
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>id</td>");
	  out.println("<td>"+rs.getString(1)+"</td>");
	  String srtpid = rs.getString(1);
	  out.println("<td bgcolor=#f0f0f0 align='center'>项目名称</td>");
	  out.println("<td>"+rs.getString(2)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>负责学生姓名</td>");
	  out.println("<td>"+rs.getString(3)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>指导教师姓名</td>");
	  out.println("<td>"+rs.getString(4)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>项目级别</td>");
	  out.println("<td>"+rs.getString(5)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>项目经费</td>");
	  out.println("<td>"+rs.getString(6)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目背景</td>");
	  out.println("<td colspan = '5' align='left'>"+rs.getString(7)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目成果</td>");
	  out.println("<td colspan = '6' align='left'>"+rs.getString(8)+"</td>");
	  out.println("</tr>");
	  sturs.next();
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>队长</td>");
	  out.println("<td>"+sturs.getString(2)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>学号</td>");
	  out.println("<td>"+sturs.getString(1)+"</td>");
      out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>班级</td>");
	  out.println("<td>"+sturs.getString(4)+"</td>");
	  while(sturs.next())
	  {
		  out.println("<tr>");
		  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>队员</td>");
		  out.println("<td>"+sturs.getString(2)+"</td>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>学号</td>");
		  out.println("<td>"+sturs.getString(1)+"</td>");
	      out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>班级</td>");
		  out.println("<td>"+sturs.getString(4)+"</td>");
	  }
	  rs.close();
	  sturs.close();
	  %>
	    
	  </table>
	</li>
	  
    </ul>
        <div class="btn_bg" style="margin-top:20px">
    <a class="newbtn" style="margin-top:500px;margin-left:0" href="SSetProgress.jsp?id=<%=srtpid%>">通过审批</a>
  </div>


</body>
</html>