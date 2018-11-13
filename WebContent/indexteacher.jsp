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
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    <%String teaid = session.getAttribute("account").toString(); %>
    
    <div class="welinfo">
    <span><img src="images/sun.png" alt="天气" /></span>
    <b>老师您好，您的工号为<%=teaid %>，欢迎使用教学秘书辅助系统！</b>
    </div>
   

    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="images/dp.png" alt="提醒" /></span>
    <b>教学秘书辅助系统使用指南</b>
    </div>
    <%
    
    String sql1 = "SELECT textbook_id FROM textbook WHERE first_author_id = \'"+ teaid+"\'";
    ResultSet rs1 = MyBean.executeQuery(sql1);
    String id1 =null;
    String id2 = null;
    while(rs1.next()){
    id1 = rs1.getString(1);}
    String sql2 = "SELECT teachReserch_id FROM teachreserch WHERE first_id = \'"+ teaid+"\'";
    ResultSet rs2 = MyBean.executeQuery(sql2);
    while(rs2.next()){
    id2 = rs2.getString(1);}
    %>
    <ul class="infolist">
    <li><span>您可以进对教研/教材/教改项目进行申请</span><a href="TApply.jsp" class="ibtn">填写申请</a></li>
    <li><span>您查看您的教研/教改项目进度</span><a href="T2Detailedteacher.jsp?id=<%=id2%>" class="ibtn">查看进度</a></li>
    <li><span>您查看您的教材项目进度</span><a href="T1Detailedteacher.jsp?id=<%=id1%>" class="ibtn">查看进度</a></li>
    <% 
    String teacher = null;
    String id4 = null;
    String sql3 = "SELECT teacher_name FROM teacher WHERE teacher_id = \'"+ teaid+"\'";
    ResultSet rs3 = MyBean.executeQuery(sql3);
    while(rs3.next()){
    teacher = rs3.getString(1);}
    String sql4 = "SELECT id FROM ggg WHERE teacher = \'"+teacher+"\'";
    ResultSet rs4 = MyBean.executeQuery(sql4);
    while(rs4.next()){
    id4 = rs4.getString(1);}
    rs1.close();
    rs2.close();
    rs3.close();
    rs4.close();%>
    <li><span>您可以发布您的SRTP项目</span><a href="SApplytea.jsp" class="ibtn">填写申请</a></li>
    <li><span>您查看您指导学生的毕业设计</span><a href="GInformationtea.jsp?id=<%=id4%>" class="ibtn">查看进度</a></li>
    </ul>

</body>
</html>
