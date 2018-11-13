<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
<jsp:useBean id="Table" scope="page" class="timeTable.table"/>
<jsp:useBean id="Time" scope="page" class="timeTable.time_table_do"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>正在排课！</title>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
    ResultSet rSet;
	rSet=Time.getAll();
	Table.makeTable(rSet);
  %>
<script type="text/javascript" language="javascript">
alert("排课成功！");
window.document.location.href="Ctable.jsp";
</script>
</body>
</html>