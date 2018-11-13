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
    
    String pro = request.getParameter("pro");
   // String srtp_name = new String(s.getBytes("ISO-8859-1"),"utf-8");
    //String srtp_name = new String(srtp_name1.getBytes("ios-8859-1"),"utf-8");
    String stuid = request.getParameter("stuid");
    String teacher = request.getParameter("teacher");
    String semester = request.getParameter("semester");
    String summary = request.getParameter("summary");
    String newsql = "INSERT INTO `ggg` ( stuid, teacher, pro, summary,semester) VALUES (\'"+stuid+"\', \'"+teacher+"\', \'"+pro+"\', \'"+ summary+"\', \'"+ semester+"')";
    out.println("您已成功提交申请！");
    MyBean.executeUpdate(newsql);
  %>
</body>
</html>