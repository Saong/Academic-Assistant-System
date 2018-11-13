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
    <span><img src="images/leftico02.png" /></span>SRTP项目
    </div>
    <%
    //下边是SRTP项目ID
    String stuid = session.getAttribute("account").toString();
    String sql2 = "SELECT id FROM information WHERE leader_id = \'"+ stuid+"\'";
    ResultSet rs2 = MyBean.executeQuery(sql2);
    String id2 = null;
    while(rs2.next()){
    id2 = rs2.getString(1);
    }
    session.setAttribute("srtpid", id2);
    %>
    <ul class="menuson">
        <li><cite></cite><a href="SNewProject.jsp" target="rightFrame">填写申请</a><i></i></li>
        <li><cite></cite><a href="SApplyFund.jsp" target="rightFrame">经费信息</a><i></i></li>
        <li><cite></cite><a href="SList.jsp" target="rightFrame">项目列表</a><i></i></li>
        <li><cite></cite><a href="SDetailedstu.jsp?id=<%=id2%>" target="rightFrame">查看项目信息</a><i></i></li>
        
        </ul>     
    </dd>         

    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>毕业设计
    </div>
    <%
    //下边是毕业设计项目ID
    String sql1 = "SELECT id FROM ggg WHERE stuid = \'"+ stuid+"\'";
    ResultSet rs1 = MyBean.executeQuery(sql1);
    
    String id1 = null;
    while(rs1.next()){
    id1 = rs1.getString(1);}
    %>
    <ul class="menuson">
        <li><cite></cite><a href="GProjectForm.jsp" target="rightFrame">填写申请</a><i></i></li>
        <li><cite></cite><a href="GInformationstu.jsp?id=<%=id1%>" target="rightFrame">查看毕业设计</a><i></i></li>
        
        </ul>     
    </dd> 
    
      
    
    </dl>
</body>
</html>
