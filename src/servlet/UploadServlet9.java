package servlet;
import Database.*;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.mysql.jdbc.DatabaseMetaData;
@WebServlet("/upload9")
@MultipartConfig
public class UploadServlet9 extends HttpServlet{

    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            //��ȡ�ļ�������Ϣ
        	request.setCharacterEncoding("utf-8");
            String desc=request.getParameter("desc");
            //��ȡ�ϴ����ļ�
            Part part=request.getPart("file");
            //��ȡ�������Ϣ
            String name=part.getHeader("content-disposition");
            //System.out.println(name);//����ʹ��
            //System.out.println(desc);//
            
            //��ȡ�ϴ��ļ���Ŀ¼
            String root=request.getServletContext().getRealPath("/upload");
            System.out.println("�����ϴ��ļ���·����"+root);
            
            //��ȡ�ļ��ĺ�׺
            String str=name.substring(name.lastIndexOf("."), name.length()-1);
            System.out.println("���Ի�ȡ�ļ��ĺ�׺��"+str);
            
            //����һ���µ��ļ��������ظ������ݿ�洢�ľ�������ļ��������ظ���
            String filename=root+"\\"+desc.toString()+str;
            System.out.println("���Բ����µ��ļ�����"+filename);
            String srtpid = request.getParameter("id");
            String sql = "UPDATE ggg SET final_file = '"+desc.toString()+str+"' WHERE id="+srtpid;
            
            QueryUpdate mysql = new QueryUpdate();
            mysql.executeUpdate(sql);
            //�ϴ��ļ���ָ��Ŀ¼�������ϴ��ļ��Ͳ��������
            part.write(filename);
            
            request.setAttribute("info", "�ϴ��ļ��ɹ�");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("info", "�ϴ��ļ�ʧ��");
        }
        
        request.getRequestDispatcher("/GProjectForm.jsp").forward(request, response);
    }
    
}