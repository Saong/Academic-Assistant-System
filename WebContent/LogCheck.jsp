<%@ page language="java" contentType="text/html; charset=GBK" import="java.sql.*"%>
<%@ page import = "javax.swing.*"%>
<%request.setCharacterEncoding("GBK"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp.useBean id="MyBean" scope="session" class="Database.QueryUpdate"/>//È±¶«Î÷
<%
    //´Ó±íµ¥ÉÏ»ñÈ¡Êý¾Ý²¢´æÈë¶ÔÓ¦µÄ±äÁ¿ÖÐ
    //a1ÊÇÓÃ»§ID¡¢a2ÊÇÓÃ»§ÊäÈëµÄÃÜÂë
    //String a1 = request.getParameter("userID");
	//String a2 = request.getParameter("pass");
	String a1 = new String("song");
	String a2 = new String("123456");
	//String a3 = request.getParameter("enter");
	//µ÷ÊÔ³ÌÐòÊ±Ê¹ÓÃ£¬²âÊÔ»ñÈ¡µÄÊý¾ÝÊÇ·ñÕýÈ·£¬ÕýÈ·ºóÔÙÐ´Êý¾Ý¿â£¬±£Áô¹©²Î¿¼
	log(a1+"<BR>");
	log(a2+"<BR>");
	
	String sql = "";
	int type = JOptionPane.WARNING_MESSAGE;
	String Mess = "";
	int k= 0;
	JFrame Jf = new JFrame("OptionPane");
	
	//ÅÐ¶ÏÊäÈëÐÅÏ¢ÊÇ·ñ¹æ·¶ºÏÀí£¬²¢×÷³ö¶ÔÓ¦µÄÊä³öJFrame
	if(a1.equalsIgnoreCase(""))
	{
		Mess = "ÄúÃ»ÓÐÌîÐ´ÓÃ»§ID\n";
		k++;
		JOptionPane.showMessageDialog(Jf, Mess, "¾¯¸æ", type);//µ¯³öµÄ´íÎóÌáÊ¾¿ò
	}
	if(a2.equalsIgnoreCase(""))
	{
		Mess = "ÄúÃ»ÓÐÌîÐ´ÃÜÂë\n";
		k++;
		JOptionPane.showMessageDialog(Jf, Mess, "¾¯¸æ", type);
	}
	
	if(k > 0)
		//³öÏÖ´íÎóÖ®ºó£¬½«Ìø×ª»ØÖ®Ç°µÄµÇÂ¼½çÃæ
		response.sendRedirect("login.jsp");
	else{
		//Èç¹ûÃ»ÓÐ³ö´í£¬ÅÐ¶ÏÊäÈëµÄÕË»§IDÓëÃÜÂëÊÇ·ñÆ¥Åä
		//String s1 = "";
		//s1 = "User_id = " + "'" +a1 +"'";//ÉèÖÃ²éÕÒÄÚÈÝ 
		sql = "SELECT User_id, password FROM User WHERE User_id = 'song'";
		ResultSet rs = MyBean.executeQuery(sql);//µÃµ½²éÑ¯½á¹û
		rs.next();//´Ó²éÑ¯½áºÏÖÐÄÃµ½µÄÒ»ÌõÊý¾Ý£¬Í¬Ê±ÄÃµ½¼¯ºÏ±íÖÐµÄµÚÒ»¸öÔªËØ
		if(rs.isLast())
        {
		   if(rs.getString("password").equalsIgnoreCase(a2))
		   {
				   Mess = "IDºÅÊÇ£º" + a1 + ",  µÇÂ¼³É¹¦£¡\n";
				   Mess = Mess.concat("µã»÷µÇ°´Å¥½øÈë½ÌÎñÃØÊé¹ÜÀíÏµÍ³\n");
				   int typel = JOptionPane.PLAIN_MESSAGE;
				   JOptionPane.showMessageDialog(Jf, Mess, "³É¹¦", typel);
				   response.sendRedirect("main.html");
		   }
		   else
		   {
			   Mess = a2.concat("ÃÜÂë´íÎó£¡\nµã»÷'È·ÈÏ'°´Å¥£¬ÖØÐÂµÇÂ¼\n");
			   int typel = JOptionPane.ERROR_MESSAGE;
			   JOptionPane.showMessageDialog(Jf, Mess, "ÓÐ´íÎó", typel);
			   response.sendRedirect("login.jsp");
		   }
		}
		else
		{
			//²»´æ¸ÃÓÃ»§
			Mess = a2.concat("²»´æÔÚ¸ÃÓÃ»§\nµã»÷'È·ÈÏ'°´Å¥£¬ÖØÐÂµÇÂ¼\n");
			int typel = JOptionPane.ERROR_MESSAGE;
            JOptionPane.showMessageDialog(Jf, Mess, "ÓÐ´íÎó", typel);
		    response.sendRedirect("login.jsp");
		}
		rs.close();//¹Ø±Õ²éÑ¯½á¹û¶ÔÏó¼¯
	}
%>
</body>
</html>