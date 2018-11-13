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
    <li><a href="#">已结束审批项目</a></li>
    <li><a href="#">查看详细信息</a></li>
    </ul>
    </div>
 <div class="formbody">
    <div class="formtitle"><span>查看详细信息</span></div>
    <ul class="seachform">
    <%
      String id=request.getParameter("id");
	  log(id);
	  if(id.equals("null")) {
		  out.println("暂无SRTP项目！");
		  return;
	  }
      %>
    <li>
    <%
	  
	  //取出项目详细信息
	  String sqlsta = "select status from information where id = "+id;
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
	  <caption class="table_title">SRTP项目详细信息(<%=sta %>)</caption>
	  <%
	  
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
	  String funsql = "SELECT outlay, time, money, invoice FROM funds WHERE srtpid = "+id;
	  ResultSet funrs = MyBean.executeQuery(funsql);
	  out.println("<tr>");
	  out.println("<td colspan = '6' align='center' bgcolor=#f0f0f0> 经费信息 </td>");
	  while(funrs.next())
	  {
		  out.println("<tr>");
		  out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>"+funrs.getString(1)+"</td>");
		  out.println("<td  align='center'>花费金额</td>");
		  out.println("<td bgcolor=#f0f0f0>"+funrs.getString(3)+"</td>");
		  out.println("<td align='center'>花费时间</td>");
		  out.println("<td bgcolor=#f0f0f0>"+funrs.getString(2)+"</td>");
		  String funbool = funrs.getString(4);
		  if(funbool.equals("1")) funbool="有发票";
		  else funbool="无发票";
		  out.println("<td>"+funbool+"</td>");
	  }
	  funrs.close();
	  %>
	 
	 <form action="upload" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 中期审查文件 </td>   
        </tr>
     </form>
     <tr>
     <form action="upload" method="post" enctype="multipart/form-data">
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
     <% 
     String filesql = "SELECT mid_file FROM information WHERE id ="+id;
     ResultSet filers = MyBean.executeQuery(filesql);
     if(filers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+filers.getString(1)+">"+filers.getString(1)+"</a></td>");}
     filers.close();
     %>
     
     
     

     </tr>
     	 <form action="upload2" method="post" enctype="multipart/form-data">
        <tr>
           <td colspan = '6' align='center' bgcolor=#f0f0f0> 最终审核文件 </td>   
        </tr>
        </form>
     <tr>
     <form action="upload2" method="post" enctype="multipart/form-data">
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
     <% 
     String finalfilesql = "SELECT final_file FROM information WHERE id ="+id;
     ResultSet finalfilers = MyBean.executeQuery(finalfilesql);
     if(finalfilers.next()){
     out.println("<td colspan = '6'><a href=DownloadServlet?filename="+finalfilers.getString(1)+">"+finalfilers.getString(1)+"</a></td>");}
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