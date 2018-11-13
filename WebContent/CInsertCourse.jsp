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
<title>认领课程成功！</title>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
    
    String course_name = request.getParameter("course_name");
    String teacher_name = request.getParameter("teacher_name");
    String frequency = request.getParameter("freq");
    String Monday = request.getParameter("day1");
    String Tuesday = request.getParameter("day2");
    String Wednesday = request.getParameter("day3");
    String Thurday = request.getParameter("day4");
    String Friday = request.getParameter("day5");
    String sec1 = request.getParameter("c1");
    String sec2 = request.getParameter("c2");
    String sec3 = request.getParameter("c3");
    String sec4 = request.getParameter("c4");
    String sec5 = request.getParameter("c5");
    String building = request.getParameter("building");
    String classes = request.getParameter("classes");
     
    String newsql = "INSERT INTO `time_table` ( course_name, teacher_name, frequency, building, classes, section1, section2, section3, section4, section5, Monday, Tuesday, Wednesday, Thurday, Friday) VALUES (\'"
    	+course_name+ "\', \'" +teacher_name+ "\', \'"+ frequency+ "\', \'" +building+ "\', \'" + classes+ "\', \'" + sec1+"\', \'"+ sec2+"\', \'"+ sec3+"\', \'"+ sec4+"\', \'"+sec5+"\', \'"+Monday+ "\', \'"+ Tuesday+"\', \'"+Wednesday+"\', \'"+Thurday+"\', \'"+Friday+"')";
    MyBean.executeUpdate(newsql);
  %>
<script type="text/javascript" language="javascript">
alert("认领课程成功！");
window.document.location.href="Ccourse.jsp";
</script>
</body>
</html>