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
    
    <% String stuid = session.getAttribute("account").toString();%>
    <div class="welinfo">
    <span><img src="images/sun.png" alt="天气" /></span>
    <b>您的学号为<%=stuid %>，欢迎使用教学秘书辅助系统！</b>
    </div>
   

    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="images/dp.png" alt="提醒" /></span>
    <b>教学秘书辅助系统使用指南</b>
    </div>
 
    <%
    String sql1 = "SELECT id FROM ggg WHERE stuid = \'"+ stuid+"\'";
    ResultSet rs1 = MyBean.executeQuery(sql1);
    String id1 = null;
    while(rs1.next()){
    id1 = rs1.getString(1);}
    %>
    <ul class="infolist">
    <li><span>您可以申请您的SRTP项目</span><a href="SNewProject.jsp" class="ibtn">填写申请</a></li>
    <li><span>您可以申请您的毕业设计</span><a href="GProjectForm.jsp" class="ibtn">填写申请</a></li>
    <li><span>您查看您的毕业设计</span><a href="GInformationstu.jsp?id=<%=id1%>" class="ibtn">查看我的毕业设计</a></li>

    </ul>
    
    <div class="xline"></div>
    

</body>
</html>
