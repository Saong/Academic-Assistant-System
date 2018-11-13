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
	  <caption class="table_title">教材详细信息</caption>
	  <%
	  String id=request.getParameter("id");
	  
	  //取出项目详细信息
	  String sql = "select textbook_name,first_author_id,apply_time,type,word,course,fund,outline,purpose,goal from textbook where textbook_id = "+id;
	  ResultSet rs = MyBean.executeQuery(sql);
	  
	  //取出队员信息
	  String stusql = "SELECT teacher.teacher_id,teacher.teacher_name,teacher.department,teacher.job AS teacherpartner FROM textbook JOIN teacher ON teacher.teacher_id = textbook.first_author_id OR teacher.teacher_id = textbook.partner_one OR teacher.teacher_id = textbook.partner_two WHERE textbook.textbook_id ="+id;
	  ResultSet sturs = MyBean.executeQuery(stusql);
	  rs.next();
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目ID</td>");
	  out.println("<td>"+id+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>项目名称</td>");
	  out.println("<td>"+rs.getString(1)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>第一作者工号</td>");
	  out.println("<td>"+rs.getString(2)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>申请时间</td>");
	  out.println("<td>"+rs.getString(3)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>类型</td>");
	  out.println("<td>"+rs.getString(4)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>字数</td>");
	  out.println("<td>"+rs.getString(5)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>适用课程</td>");
	  out.println("<td>"+rs.getString(6)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>预计经费</td>");
	  out.println("<td>"+rs.getString(7)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>项目大纲</td>");
	  out.println("<td>"+rs.getString(8)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目目的</td>");
	  out.println("<td colspan = '5' align='left'>"+rs.getString(9)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目成果</td>");
	  out.println("<td colspan = '6' align='left'>"+rs.getString(10)+"</td>");
	  out.println("</tr>");
	  
	  sturs.next();
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>负责人</td>");
	  out.println("<td>"+sturs.getString(2)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>院系</td>");
	  out.println("<td>"+sturs.getString(3)+"</td>");
      out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>职称</td>");
	  out.println("<td>"+sturs.getString(4)+"</td>");
	  while(sturs.next())
	  {
		  out.println("<tr>");
		  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>参与人</td>");
		  out.println("<td>"+sturs.getString(2)+"</td>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>院系</td>");
		  out.println("<td>"+sturs.getString(3)+"</td>");
	      out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>职称</td>");
		  out.println("<td>"+sturs.getString(4)+"</td>");
	  }
	  rs.close();
	  sturs.close();
	  String funsql = "SELECT office_supply, data_fee, travel_expenses FROM textbook_fund WHERE fund_id = "+id;
	  ResultSet funrs = MyBean.executeQuery(funsql);
	  out.println("<tr>");
	  out.println("<td colspan = '6' align='center' bgcolor=#f0f0f0> 经费信息 </td>");
	  while(funrs.next())
	  {
		  out.println("<tr>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>办公用品费</td>");
		  out.println("<td  nowrap='nowrap'>"+funrs.getString(1)+"</td>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>资料费</td>");
		  out.println("<td >"+funrs.getString(2)+"</td>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>差旅费</td>");
		  out.println("<td >"+funrs.getString(3)+"</td>");
	  }
	  funrs.close();
	  
	  %>
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 中期审查文件 </td>   
        </tr>
     <tr>
     <% 
     String filesql = "SELECT mid_file FROM textbook WHERE textbook_id ="+id;
     ResultSet filers = MyBean.executeQuery(filesql);
     if(filers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+filers.getString(1)+">"+filers.getString(1)+"</a></td>");}
     filers.close();
     %>
	  </tr>
     
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 最终审核文件 </td>   
        </tr>

     <tr>
     <% 
     String finalfilesql = "SELECT final_file FROM textbook WHERE textbook_id ="+id;
     ResultSet finalfilers = MyBean.executeQuery(finalfilesql);
     if(finalfilers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+finalfilers.getString(1)+">"+finalfilers.getString(1)+"</a></td>");}
     finalfilers.close();
     %>
     </tr>   
	  
	    
	  </table>
	</li>
	  
    </ul>



</body>
</html>