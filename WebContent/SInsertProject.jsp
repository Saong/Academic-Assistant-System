<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建SRTP项目成功</title>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
    
    String srtp_name = request.getParameter("srtp_name");
   // String srtp_name = new String(s.getBytes("ISO-8859-1"),"utf-8");
    out.println(srtp_name);
    //String srtp_name = new String(srtp_name1.getBytes("ios-8859-1"),"utf-8");
    String leader_id = request.getParameter("leader_id");
    String teacher_name = request.getParameter("teacher_name");
    String publish_time = request.getParameter("publish_time");
    String background = request.getParameter("background");
    String result = request.getParameter("result");
    String level = request.getParameter("level");
    String budget = request.getParameter("budget");
    String member_id1 = request.getParameter("member_id1");
    String member_id2 = request.getParameter("member_id2");    
    String newsql = "INSERT INTO `information` (srtp_name, leader_id, teacher_name, publish_time, level, background, result, budget, member_id1, member_id2) VALUES (\'"+srtp_name+"\', \'"+leader_id+"\', \'"+teacher_name+"\', \'"+ publish_time+"\', \'"+ level+"\', \'"+ background+"\', \'"+ result+"\', \'"+ budget+"\', \'"+ member_id1+"\', \'"+ member_id2+"')";
    out.println("申请成功！");
    MyBean.executeUpdate(newsql);
  %>
</body>
</html>