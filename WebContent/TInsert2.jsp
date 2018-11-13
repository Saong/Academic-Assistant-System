<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
  <%    
    request.setCharacterEncoding("utf-8");
    
    //String srtp_name = new String(srtp_name1.getBytes("ios-8859-1"),"utf-8");
    String teachReserch_name = request.getParameter("teachReserch_name");
    String first_id = request.getParameter("first_id");
    String apply_time = request.getParameter("apply_time");
    String guide_id = request.getParameter("guide_id");
    String type = request.getParameter("type");
    String ifNfinish = request.getParameter("ifNfinish").toString();
    String fund = request.getParameter("fund");
    String paper = request.getParameter("paper");
    String partner_one = request.getParameter("partner_one");
    String partner_two = request.getParameter("partner_two"); 
    String partner_three = request.getParameter("partner_three"); 
    String background = request.getParameter("background"); 
    String bascis = request.getParameter("bascis"); 
    String goal = request.getParameter("goal");
    String content = request.getParameter("content"); 
    String method = request.getParameter("method"); 
    String sql = "INSERT INTO teachreserch (teachReserch_name, first_id,apply_time,guide_id, type, ifNfinish, fund,paper, partner_one, partner_two,partner_three, background, bascis,goal,content,method) "
    		+"VALUES (\'"+teachReserch_name+"\', \'"+first_id+"\', \'"+apply_time+"\', \'"+ guide_id+"\', \'"+ type+"\', \'"+ ifNfinish+"\', \'"+  fund+"\', \'" +  paper+"\', \'" + partner_one+"\', \'"+ partner_two+"\', \'"+ partner_three+"\', \'"+background+"\', \'"+  bascis+"\', \'"+  goal+"\', \'"+  content+"\', \'"+method+"')";
    MyBean.executeUpdate(sql);  %>
  <p style="font-size:20px;margin-left:20px;margin-top:20px">申请成功！<p>
  <a style="display:block;font-size:20px;margin-left:20px;margin-top:20px" href="TApply.jsp">返回</a>
  