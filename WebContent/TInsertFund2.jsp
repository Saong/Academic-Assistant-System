<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
  <%    request.setCharacterEncoding("utf-8");
    
    //String srtp_name = new String(srtp_name1.getBytes("ios-8859-1"),"utf-8");
    String teaid = session.getAttribute("account").toString();
    String sql1 = "SELECT textbook_id FROM textbook WHERE first_author_id = \'"+ teaid+"\'";
    ResultSet rs1 = MyBean.executeQuery(sql1);
    rs1.next();
    String id1 = rs1.getString(1);
    String sql2 = "SELECT teachReserch_id FROM teachreserch WHERE first_id = \'"+ teaid+"\'";
    ResultSet rs2 = MyBean.executeQuery(sql2);
    rs2.next();
    String id2 = rs2.getString(1);
    String office_supply = request.getParameter("office_supply");
    String data_fee = request.getParameter("data_fee");
    String travel_expenses = request.getParameter("travel_expenses");
    String sql = "INSERT INTO teachreserch_fund (fund_id,office_supply,data_fee,travel_expenses) "
    		+"VALUES (\'"+id2+"\', \'"+office_supply+"\', \'"+data_fee+"\', \'"+ travel_expenses+"')";
    MyBean.executeUpdate(sql);
  %>
  <p style="font-size:20px;margin-left:20px;margin-top:20px">填写经费信息成功！<p>
  