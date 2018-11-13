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
    <li><a href="#">查看当前课表</a></li>
    </ul>
    </div>
 <div class="formbody">
    <div class="formtitle"><span>查看当前课表</span></div>
    <div class="mid" style="margin:auto;">
    <ul class="seachform">
    <li>
    
	  <table border=1>
	  <caption class="table_title">课程表</caption>
	  <%
	  
	  //取出项目详细信息
	  String sql = "SELECT * From course_table Where name = 'admin'";
	  ResultSet rs = MyBean.executeQuery(sql);
	  
	  rs.next();
	 
	 // out.println("<tr><td colspan='6' nowrap='nowrap' align='center' style=\"font-size = 18px;\">课程表</td></tr>");
	  out.println("<tr>");
	  out.println("<td nowrap='nowrap'></td>");
	  for(int i=0; i<5;i++) 
	  {
		  int x=i+1;
		  out.println("<td style=\"font-size:15px;\" bgcolor=#f0f0f0 nowrap='nowrap'>星期"+x+"</td>");
		  
	  }
	  out.println("</tr>");
	  int m=0;
	  for(int j=0; j<5;j++) {
			out.println("<tr>");
			int y=j+1;
			out.println("<td style=\"font-size:15px;\" bgcolor=#f0f0f0 nowrap='nowrap'>第"+y+"节</td>");
			m = j+2;
			for(int i=0;i<5;i++) {
				String realcourse = rs.getString(m);
				if(realcourse.equals("null")) realcourse = " ";
				out.println("<td style=\"height:60px;\">"+realcourse+"</td>");
				m = m+5;
			}
			out.println("</tr>");
		}
	  
	  rs.close();
	  %>
	    
	  </table>
	</li>
	  
    </ul>
    </div>

</body>
</html>