<%@ page language="java" contentType="text/html; charset=GBK" import="java.sql.*"%>
<%@ page import = "javax.swing.*"%>
<%request.setCharacterEncoding("GBK"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp.useBean id="MyBean" scope="session" class="Database.QueryUpdate"/>//缺东西
<%
    //从表单上获取数据并存入对应的变量中
    //a1是用户ID、a2是用户输入的密码
    //String a1 = request.getParameter("userID");
	//String a2 = request.getParameter("pass");
	String a1 = new String("song");
	String a2 = new String("123456");
	//String a3 = request.getParameter("enter");
	//调试程序时使用，测试获取的数据是否正确，正确后再写数据库，保留供参考
	log(a1+"<BR>");
	log(a2+"<BR>");
	
	String sql = "";
	int type = JOptionPane.WARNING_MESSAGE;
	String Mess = "";
	int k= 0;
	JFrame Jf = new JFrame("OptionPane");
	
	//判断输入信息是否规范合理，并作出对应的输出JFrame
	if(a1.equalsIgnoreCase(""))
	{
		Mess = "您没有填写用户ID\n";
		k++;
		JOptionPane.showMessageDialog(Jf, Mess, "警告", type);//弹出的错误提示框
	}
	if(a2.equalsIgnoreCase(""))
	{
		Mess = "您没有填写密码\n";
		k++;
		JOptionPane.showMessageDialog(Jf, Mess, "警告", type);
	}
	
	if(k > 0)
		//出现错误之后，将跳转回之前的登录界面
		response.sendRedirect("login.jsp");
	else{
		//如果没有出错，判断输入的账户ID与密码是否匹配
		//String s1 = "";
		//s1 = "User_id = " + "'" +a1 +"'";//设置查找内容 
		sql = "SELECT User_id, password FROM User WHERE User_id = 'song'";
		ResultSet rs = MyBean.executeQuery(sql);//得到查询结果
		rs.next();//从查询结合中拿到的一条数据，同时拿到集合表中的第一个元素
		if(rs.isLast())
        {
		   if(rs.getString("password").equalsIgnoreCase(a2))
		   {
				   Mess = "ID号是：" + a1 + ",  登录成功！\n";
				   Mess = Mess.concat("点击登按钮进入教务秘书管理系统\n");
				   int typel = JOptionPane.PLAIN_MESSAGE;
				   JOptionPane.showMessageDialog(Jf, Mess, "成功", typel);
				   response.sendRedirect("main.html");
		   }
		   else
		   {
			   Mess = a2.concat("密码错误！\n点击'确认'按钮，重新登录\n");
			   int typel = JOptionPane.ERROR_MESSAGE;
			   JOptionPane.showMessageDialog(Jf, Mess, "有错误", typel);
			   response.sendRedirect("login.jsp");
		   }
		}
		else
		{
			//不存该用户
			Mess = a2.concat("不存在该用户\n点击'确认'按钮，重新登录\n");
			int typel = JOptionPane.ERROR_MESSAGE;
            JOptionPane.showMessageDialog(Jf, Mess, "有错误", typel);
		    response.sendRedirect("login.jsp");
		}
		rs.close();//关闭查询结果对象集
	}
%>
</body>
</html>