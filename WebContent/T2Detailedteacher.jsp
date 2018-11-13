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
    <%
      String id=request.getParameter("id");
	  log(id);
	  if(id.equals("null")) {
		  out.println("暂无项目！");
		  return;
	  }
      %>
 	  <%

	  String sqlsta = "select status from teachreserch where teachReserch_id = "+id;
	  ResultSet rssta = MyBean.executeQuery(sqlsta);
	  rssta.next();
	  String status = rssta.getString(1);
	  String sta=null;
	  if(status.equals("0")) sta = "待立项";
	  else if(status.equals("1")) sta = "待中期审批";
	  else if(status.equals("2")) sta = "待最终审批";
	  else if(status.equals("3")) sta = "已结项";
	  %>
	  <table border=1>
	  <caption class="table_title">教研/教改详细信息(<%=sta %>)</caption>

	  <%
	  
	  
	  //取出项目详细信息
	  String sql = "select teachReserch_name,first_id,apply_time,guide_id,type,ifNfinish,fund,background,bascis,goal,content,method,paper  from teachReserch where teachReserch_id =  "+id;
	  ResultSet rs = MyBean.executeQuery(sql);
	  
	  //取出队员信息
	  String stusql = "SELECT teacher.teacher_id,teacher.teacher_name,teacher.department,teacher.job AS teacherpartner FROM teachreserch JOIN teacher ON teacher.teacher_id = teachreserch.first_id OR teacher.teacher_id = teachreserch.partner_one OR teacher.teacher_id = teachreserch.partner_two OR teacher.teacher_id = teachreserch.partner_three WHERE teachreserch.teachReserch_id ="+id;
	  ResultSet sturs = MyBean.executeQuery(stusql);
	  rs.next();
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目名称</td>");
	  out.println("<td colspan = '5' align='left'>"+rs.getString(1)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目ID</td>");
	  out.println("<td>"+id+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>项目类型</td>");
	  out.println("<td>"+rs.getString(5)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>负责人工号</td>");
	  out.println("<td>"+rs.getString(2)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>申请时间</td>");
	  out.println("<td>"+rs.getString(3)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>指南编号</td>");
	  out.println("<td>"+rs.getString(4)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center' nowrap='nowrap'>是否完成原来项目</td>");
	  out.println("<td>"+rs.getString(6)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>预计经费</td>");
	  out.println("<td>"+rs.getString(7)+"</td>");
	  out.println("<td bgcolor=#f0f0f0 align='center'>期待发表的论文</td>");
	  out.println("<td colspan = '3'>"+rs.getString(13)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目背景</td>");
	  out.println("<td colspan = '5' align='left'>"+rs.getString(8)+"</td>");
	  out.println("</tr>");
	  out.println("<tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目基础</td>");
	  out.println("<td colspan = '6' align='left'>"+rs.getString(9)+"</td>");
	  out.println("</tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目目标</td>");
	  out.println("<td colspan = '6' align='left'>"+rs.getString(10)+"</td>");
	  out.println("</tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>项目内容</td>");
	  out.println("<td colspan = '6' align='left'>"+rs.getString(11)+"</td>");
	  out.println("</tr>");
	  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>采用方法</td>");
	  out.println("<td colspan = '6' align='left'>"+rs.getString(12)+"</td>");
	  out.println("</tr>");
	  out.println("</tr>");
	  out.println("<td colspan = '6' align='center' bgcolor=#f0f0f0 nowrap='nowrap'>参与人员</td>");
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
	  String funsql = "select * from teachReserch_fund where fund_id = "+id;
	  ResultSet funrs = MyBean.executeQuery(funsql);
	  out.println("<tr>");
	  out.println("<td colspan = '6' align='center' bgcolor=#f0f0f0> 经费信息 </td>");
	  while(funrs.next())
	  {
		  out.println("<tr>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>办公用品费</td>");
		  out.println("<td  >"+funrs.getString(2)+"</td>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>资料费</td>");
		  out.println("<td >"+funrs.getString(3)+"</td>");
		  out.println("<td bgcolor=#f0f0f0 align='center'>差旅费</td>");
		  out.println("<td >"+funrs.getString(4)+"</td>");
	  }
	  funrs.close();
	  %>
	      <form action="upload5" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 中期审查文件 </td>   
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
     String filesql = "SELECT mid_file FROM teachreserch WHERE teachreserch_id ="+id;
     ResultSet filers = MyBean.executeQuery(filesql);
     if(filers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+filers.getString(1)+">"+filers.getString(1)+"</a></td>");}
     filers.close();
     %>  
     <tr>
	  </tr>
         <form action="upload6" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 最终审核文件 </td>   
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
     String finalfilesql = "SELECT final_file FROM teachreserch WHERE teachreserch_id ="+id;
     ResultSet finalfilers = MyBean.executeQuery(finalfilesql);
     if(finalfilers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+finalfilers.getString(1)+">"+finalfilers.getString(1)+"</a></td>");}
     finalfilers.close();
     %>
     </tr>   
	    
	  </table>
	</li>
	  
    </ul>
        
  </div>


</body>
</html>