<%@ page language="java" contentType="text/html; charset=GBK" import="java.sql.*"%>
<%@ page import = "javax.swing.*"%>
<%request.setCharacterEncoding("GBK"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp.useBean id="MyBean" scope="session" class="Database.QueryUpdate"/>//ȱ����
<%
    //�ӱ��ϻ�ȡ���ݲ������Ӧ�ı�����
    //a1���û�ID��a2���û����������
    //String a1 = request.getParameter("userID");
	//String a2 = request.getParameter("pass");
	String a1 = new String("song");
	String a2 = new String("123456");
	//String a3 = request.getParameter("enter");
	//���Գ���ʱʹ�ã����Ի�ȡ�������Ƿ���ȷ����ȷ����д���ݿ⣬�������ο�
	log(a1+"<BR>");
	log(a2+"<BR>");
	
	String sql = "";
	int type = JOptionPane.WARNING_MESSAGE;
	String Mess = "";
	int k= 0;
	JFrame Jf = new JFrame("OptionPane");
	
	//�ж�������Ϣ�Ƿ�淶������������Ӧ�����JFrame
	if(a1.equalsIgnoreCase(""))
	{
		Mess = "��û����д�û�ID\n";
		k++;
		JOptionPane.showMessageDialog(Jf, Mess, "����", type);//�����Ĵ�����ʾ��
	}
	if(a2.equalsIgnoreCase(""))
	{
		Mess = "��û����д����\n";
		k++;
		JOptionPane.showMessageDialog(Jf, Mess, "����", type);
	}
	
	if(k > 0)
		//���ִ���֮�󣬽���ת��֮ǰ�ĵ�¼����
		response.sendRedirect("login.jsp");
	else{
		//���û�г����ж�������˻�ID�������Ƿ�ƥ��
		//String s1 = "";
		//s1 = "User_id = " + "'" +a1 +"'";//���ò������� 
		sql = "SELECT User_id, password FROM User WHERE User_id = 'song'";
		ResultSet rs = MyBean.executeQuery(sql);//�õ���ѯ���
		rs.next();//�Ӳ�ѯ������õ���һ�����ݣ�ͬʱ�õ����ϱ��еĵ�һ��Ԫ��
		if(rs.isLast())
        {
		   if(rs.getString("password").equalsIgnoreCase(a2))
		   {
				   Mess = "ID���ǣ�" + a1 + ",  ��¼�ɹ���\n";
				   Mess = Mess.concat("����ǰ�ť��������������ϵͳ\n");
				   int typel = JOptionPane.PLAIN_MESSAGE;
				   JOptionPane.showMessageDialog(Jf, Mess, "�ɹ�", typel);
				   response.sendRedirect("main.html");
		   }
		   else
		   {
			   Mess = a2.concat("�������\n���'ȷ��'��ť�����µ�¼\n");
			   int typel = JOptionPane.ERROR_MESSAGE;
			   JOptionPane.showMessageDialog(Jf, Mess, "�д���", typel);
			   response.sendRedirect("login.jsp");
		   }
		}
		else
		{
			//������û�
			Mess = a2.concat("�����ڸ��û�\n���'ȷ��'��ť�����µ�¼\n");
			int typel = JOptionPane.ERROR_MESSAGE;
            JOptionPane.showMessageDialog(Jf, Mess, "�д���", typel);
		    response.sendRedirect("login.jsp");
		}
		rs.close();//�رղ�ѯ�������
	}
%>
</body>
</html>