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

<body style="background:#f0f9fd;">
	
    
    <dl class="leftmenu">
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>教学课程
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="Ccourse.jsp" target="rightFrame">认领课程</a><i></i></li>       
        </ul>     
    </dd>     

    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>教材/教改/教研管理
    </div>
    <%
    String teaid = session.getAttribute("account").toString();
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
    <ul class="menuson">
        <li><cite></cite><a href="TApply.jsp" target="rightFrame">填写申请</a><i></i></li>
        <li><cite></cite><a href="TApplyFund.jsp" target="rightFrame">填写经费信息</a><i></i></li>
        <li><cite></cite><a href="T1Detailedteacher.jsp?id=<%=id1%>" target="rightFrame">查看教材项目信息</a><i></i></li>
        <li><cite></cite><a href="T2Detailedteacher.jsp?id=<%=id2%>" target="rightFrame">查看教研/教改项目信息</a><i></i></li>
        
        </ul>     
    </dd> 
    
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>毕业设计管理
    </div>
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
    rs4.close();
    %>
    <ul class="menuson">
        <li><cite></cite><a href="GInformationtea.jsp?id=<%=id4%>" target="rightFrame">查看指导学生毕业设计</a><i></i></li>

        
        </ul>     
    </dd>   
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>SRTP项目
    </div>
    <%
    %>
    <ul class="menuson">
        <li><cite></cite><a href="SApplytea.jsp" target="rightFrame">发布项目</a><i></i></li>

        
        </ul>     
    </dd> 
    
    </dl>
</body>
</html>
