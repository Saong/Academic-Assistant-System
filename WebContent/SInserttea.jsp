<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
    
    String srtp_name = request.getParameter("srtp_name");
    String teacher_name = request.getParameter("teacher_name");
    String teacher_telnum = request.getParameter("teacher_telnum");
    String teacher_email = request.getParameter("teacher_email");
    String major = request.getParameter("major");
    String introduction = request.getParameter("introduction");    
    String newsql = "INSERT INTO `srtp_tea` (srtp_name, teacher_name, teacher_telnum, teacher_email,major,introduction) VALUES (\'"+srtp_name+"\', \'"+teacher_name+"\', \'"+teacher_telnum+"\', \'"+ teacher_email+"\', \'"+ major+"\', \'"+ introduction+"')";
    log(newsql);
    MyBean.executeUpdate(newsql);
  %>
    <script type="text/javascript" language="javascript">
    alert("您的项目发布成功！");
    window.document.location.href="indexteacher.jsp";
    </script>
</body>
</html>