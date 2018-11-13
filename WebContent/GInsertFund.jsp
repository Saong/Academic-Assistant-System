<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
  <%    request.setCharacterEncoding("utf-8");
    
    //String srtp_name = new String(srtp_name1.getBytes("ios-8859-1"),"utf-8");
    String outlay = request.getParameter("outlay");
    String time = request.getParameter("time");
    String money = request.getParameter("money");
    String invoice = request.getParameter("invoice");
    String srtpid = session.getAttribute("srtpid").toString();
    String sql = "INSERT INTO funds (outlay,time,money,invoice,srtpid) "
    		+"VALUES (\'"+outlay+"\', \'"+time+"\', \'"+money+"\', \'"+ invoice+"\', \'"+ srtpid+"')";
    MyBean.executeUpdate(sql);
  %>
  <p style="font-size:20px;margin-left:20px;margin-top:20px">填写经费信息成功！<p>
  