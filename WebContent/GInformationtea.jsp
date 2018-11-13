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
<title>待最终审批项目</title>
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
    <li><a href="#">毕业设计</a></li>
    <li><a href="#">查看详细信息</a></li>
    </ul>
    </div>
 <div class="formbody">
    <div class="formtitle"><span>查看详细信息</span></div>
    <ul class="seachform">
    <li>
      <%
      String id=request.getParameter("id");
	  log(id);
	  if(id.equals("null")) {
		  out.println("暂无指导的毕设项目！");
		  return;
	  }
      %>
	  <table border=1>
	  <caption class="table_title">毕业设计详细信息</caption>
	  <%
	  
	  //取出项目详细信息
	  String sql = "SELECT g.id,g.pro,s.name,g.teacher, g.summary FROM ggg AS g INNER JOIN student AS s WHERE g.stuid = s.id AND g.id ="+id ;
	  ResultSet rs = MyBean.executeQuery(sql);
	  
	  //取出队员信息
	  rs.next();
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>ID</td>");
	  out.println("<td>"+rs.getString(1)+"</td>");
	  String srtpid = rs.getString(1);
	  out.println("<td bgcolor=#f0f0f0 align='center'>指导教师姓名</td>");
	  out.println("<td>"+rs.getString(4)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>学生姓名</td>");
	  out.println("<td>"+rs.getString(3)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>毕设项目名称</td>");
	  out.println("<td colspan = '5' align='center'>"+rs.getString(2)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0  nowrap='nowrap'>毕设项目概述</td>");
	  out.println("<td colspan = '5' align='center'>"+rs.getString(5)+"</td>");
	  out.println("</tr>");
	  rs.close();
	  
	  %>
<form action="upload10" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 任务书 </td>   
        </tr>
        <tr>
            <td colspan = '1'>文件描述:</td>
            <td colspan = '3'><input type="text" name="desc"/></td>
            <td colspan = '1'>项目ID:</td>
            <td colspan = '1'><input type="text" name="id"/></td>
        </tr>
        <tr>
            <td>上传文件:</td>
            <td colspan = '4'><input type="file" name="file"/></td>
            <td colspan = '1'><input  type="submit" value="上传文件"/></td>
        </tr>
     </form>
     <tr>
     <% 
     String taskfilesql = "SELECT task_file FROM ggg WHERE id ="+id;
     ResultSet taskfilers = MyBean.executeQuery(taskfilesql);
     if(taskfilers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+taskfilers.getString(1)+">"+taskfilers.getString(1)+"</a></td>");}
     taskfilers.close();
     %>
     </tr>
     <form action="upload11" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 开题报告反馈 </td> 
            
        </tr>
        <tr>
            <td colspan = '1'>文件描述:</td>
            <td colspan = '3'><input type="text" name="desc"/></td>
            <td colspan = '1'>项目ID:</td>
            <td colspan = '1'><input type="text" name="id"/></td>
        </tr>
        <tr>
            <td>上传文件:</td>
            <td colspan = '4'><input type="file" name="file"/></td>
            <td colspan = '1'><input  type="submit" value="上传文件"/></td>
        </tr>
     </form>
     <tr>
     <% 
     String startteafilesql = "SELECT start_tea FROM ggg WHERE id ="+id;
     ResultSet startteafilers = MyBean.executeQuery(startteafilesql);
     if(startteafilers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+startteafilers.getString(1)+">"+startteafilers.getString(1)+"</a></td>");}
     startteafilers.close();
     %>
     </tr>
     <tr>
     <td colspan = '2' align='center' bgcolor=#f0f0f0> 学生开题报告 </td> 
     <% 
     
     String startsql = "SELECT start_file FROM ggg WHERE id ="+id;
     ResultSet startfilers = MyBean.executeQuery(startsql);
     if(startfilers.next()){
     out.println("<td colspan = '4'><a href=DownloadServlet?filename="+startfilers.getString(1)+">"+startfilers.getString(1)+"</a></td>");}
     startfilers.close();
     %>
     </tr>    
     <form action="upload12" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 中期审查反馈 </td> 
            
        </tr>
        <tr>
            <td colspan = '1'>文件描述:</td>
            <td colspan = '3'><input type="text" name="desc"/></td>
            <td colspan = '1'>项目ID:</td>
            <td colspan = '1'><input type="text" name="id"/></td>
        </tr>
        <tr>
            <td>上传文件:</td>
            <td colspan = '4'><input type="file" name="file"/></td>
            <td colspan = '1'><input  type="submit" value="上传文件"/></td>
        </tr>
     </form>
     <tr>
     <% 
     String midteafilesql = "SELECT mid_tea FROM ggg WHERE id ="+id;
     ResultSet midteafilers = MyBean.executeQuery(midteafilesql);
     if(midteafilers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+midteafilers.getString(1)+">"+midteafilers.getString(1)+"</a></td>");}
     midteafilers.close();
     %>
     </tr>
     <tr>
     <td colspan = '2' align='center' bgcolor=#f0f0f0> 学生中期报告 </td> 
     <% 
     
     String midsql = "SELECT mid_file FROM ggg WHERE id ="+id;
     ResultSet midfilers = MyBean.executeQuery(midsql);
     if(midfilers.next()){
     out.println("<td colspan = '4'><a href=DownloadServlet?filename="+midfilers.getString(1)+">"+midfilers.getString(1)+"</a></td>");}
     midfilers.close();
     %>
     </tr>    
     <form action="upload13" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center'  bgcolor=#f0f0f0>最终论文反馈 </td> 
            
        </tr>
        <tr>
            <td colspan = '1'>文件描述:</td>
            <td colspan = '3'><input type="text" name="desc"/></td>
            <td colspan = '1'>项目ID:</td>
            <td colspan = '1'><input type="text" name="id"/></td>
        </tr>
        <tr>
            <td>上传文件:</td>
            <td colspan = '4'><input type="file" name="file"/></td>
            <td colspan = '1'><input  type="submit" value="上传文件"/></td>
        </tr>
     </form>
     <tr>
     <% 
     String finalteafilesql = "SELECT final_tea FROM ggg WHERE id ="+id;
     ResultSet finalteafilers = MyBean.executeQuery(finalteafilesql);
     if(finalteafilers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+finalteafilers.getString(1)+">"+finalteafilers.getString(1)+"</a></td>");}
     finalteafilers.close();
     %>
     </tr>
     <tr>
     <td colspan = '2' align='center' bgcolor=#f0f0f0> 学生最终论文 </td> 
     <% 
     
     String finalsql = "SELECT final_file FROM ggg WHERE id ="+id;
     ResultSet finalfilers = MyBean.executeQuery(finalsql);
     if(finalfilers.next()){
     out.println("<td colspan = '4'><a href=DownloadServlet?filename="+finalfilers.getString(1)+">"+finalfilers.getString(1)+"</a></td>");}
     finalfilers.close();
     %>
     </tr>
	  </table>
	</li>
	  
    </ul>
    <br>

  </div>


</body>
</html>