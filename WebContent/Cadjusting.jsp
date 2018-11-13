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
    String teachername = (String)session.getAttribute("realname");
    String course = (String)session.getAttribute("realcourse");
    String type = (String)session.getAttribute("realtype");
    String time = request.getParameter("time");
    String building = request.getParameter("building");
    String day = request.getParameter("day");
    String realcourse = teachername+" "+course+" "+building+" "+type;
    String failcourse = "教师："+teachername+"  课程："+course+"  类别："+type;
    String sql = "update course_table set "+day+"_"+time+"=\'"+realcourse+"\' where name = 'admin'";
    log(sql);
    MyBean.executeUpdate(sql);
    String deletesql = "delete from fail_course where course = \'"+failcourse+"\'";
    MyBean.executeUpdate(deletesql);
    log(deletesql);
  %>
<script type="text/javascript" language="javascript">
alert("调整课程成功！");
window.document.location.href="Cfailcourse.jsp";
</script>
</body>
</html>