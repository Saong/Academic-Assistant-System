package servlet;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DownloadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//��ȡ�ļ�����·��
		String path = "E:/eclipse+ADT+SDK+JDK/eclipse-jee-mars-R-win32-x86_64/eclipse/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SoftWare/upload/";
		String filename = request.getParameter("filename");
		File file = new File(path + filename);
		if(file.exists()){
			//������Ӧ�����������֪����ʲô��  ��application/octet-streamҲ���ԣ�����ʲô�����
			response.setContentType("application/x-msdownload");
			//����ͷ��Ϣ
			response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
			InputStream inputStream = new FileInputStream(file);
			ServletOutputStream ouputStream = response.getOutputStream();
			byte b[] = new byte[1024];
			int n ;
			while((n = inputStream.read(b)) != -1){
				ouputStream.write(b,0,n);
			}
			//�ر���
			ouputStream.close();
			inputStream.close();
		}else{
			request.setAttribute("errorResult", "�ļ�������,����ʧ��!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SMidProject.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
