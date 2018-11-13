<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="MyBean" scope="page" class="Database.QueryUpdate"/>
  <%    request.setCharacterEncoding("utf-8");
    
    //String srtp_name = new String(srtp_name1.getBytes("ios-8859-1"),"utf-8");
    String textbook_name = request.getParameter("textbook_name");
    String apply_time = request.getParameter("apply_time");
    String first_author_id = request.getParameter("first_author_id");
    String type = request.getParameter("type");
    String outline = request.getParameter("outline");
    String word = request.getParameter("word");
    
    String course_name = request.getParameter("course_name");
    String fund = request.getParameter("fund");
    String partner_one = request.getParameter("partner_one");
    String partner_two = request.getParameter("partner_two");  
    String purpose = request.getParameter("purpose"); 
    String goal = request.getParameter("goal"); 
    String sql = "INSERT INTO textbook (textbook_name, apply_time, first_author_id, type, word, course, fund, partner_one, partner_two, outline, purpose,goal) "
    		+"VALUES (\'"+textbook_name+"\', \'"+apply_time+"\', \'"+first_author_id+"\', \'"+ type+"\', \'"+ word+"\', \'"+ course_name+"\', \'"+  fund+"\', \'"+ partner_one+"\', \'"+ partner_two+"\', \'"+ outline+"\', \'"+purpose+"\', \'"+goal+"')";
    MyBean.executeUpdate(sql);
  %>
  <p style="font-size:20px;margin-left:20px;margin-top:20px">申请成功！<p>
  <a style="display:block;font-size:20px;margin-left:20px;margin-top:20px" href="TApply.jsp">返回</a>
  