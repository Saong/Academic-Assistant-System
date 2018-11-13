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
            //获取文件描述信息
        	request.setCharacterEncoding("utf-8");
            String desc=request.getParameter("desc");
            //获取上传的文件
            Part part=request.getPart("file");
            //获取请求的信息
            String name=part.getHeader("content-disposition");
            //System.out.println(name);//测试使用
            //System.out.println(desc);//
            
            //获取上传文件的目录
            String root=request.getServletContext().getRealPath("/upload");
            System.out.println("测试上传文件的路径："+root);
            
            //获取文件的后缀
            String str=name.substring(name.lastIndexOf("."), name.length()-1);
            System.out.println("测试获取文件的后缀："+str);
            
            //生成一个新的文件名，不重复，数据库存储的就是这个文件名，不重复的
            String filename=root+"\\"+desc.toString()+str;
            System.out.println("测试产生新的文件名："+filename);
            String srtpid = request.getParameter("id");
            String sql = "UPDATE ggg SET final_file = '"+desc.toString()+str+"' WHERE id="+srtpid;
            
            QueryUpdate mysql = new QueryUpdate();
            mysql.executeUpdate(sql);
            //上传文件到指定目录，不想上传文件就不调用这个
            part.write(filename);
            
            request.setAttribute("info", "上传文件成功");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("info", "上传文件失败");
        }
        
        request.getRequestDispatcher("/GProjectForm.jsp").forward(request, response);
    }
    
}