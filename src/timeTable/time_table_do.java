package timeTable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Out;

import sun.util.logging.resources.logging;

public class time_table_do {
	private static Connection getConn() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/srtp?user=root&password=8288545&useUnicode=true&characterEncoding=utf8&useSSL=true";
		Connection conn = null;
	    try {
	        Class.forName(driver); //classLoader,加载对应驱动
	        //System.out.println("Connecting to a selected database...\n");
	        conn = (Connection) DriverManager.getConnection(url);
	       // System.out.println("Connected database successfully!\n");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	       // System.out.println("Connected database NotFound!\n");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}
	
	
	public static ResultSet getAll() {

		Connection conn = getConn();
		String sql = "select * from time_table";
		PreparedStatement pstmt;
		ResultSet rSet = null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rSet = rs;
		} catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
			System.out.println("query failed!");
		}
		return rSet;
	}
	
	public static void InsertTable(String course,int i,int j) {

		Connection conn = getConn();
		j++;
		i++;
		String sql = "UPDATE course_table SET "+j+"_"+i+" = \'"+course+"\' WHERE name = 'admin'";
		//System.out.println(sql);
		PreparedStatement pstmt;
		ResultSet rSet = null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.execute(sql);
			//ResultSet rs = pstmt.executeQuery();
			//rSet = rs;
		} catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
			System.out.println("insert failed!");
		}
	}
	
	public static void InsertTableFail(String course) {

		Connection conn = getConn();
		String sql = "Insert into fail_course (course) values('"+course+"')";
		//System.out.println(sql);
		PreparedStatement pstmt;
		//ResultSet rSet = null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.execute(sql);
			//ResultSet rs = pstmt.executeQuery();
			//rSet = rs;
		} catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
			System.out.println("insert failed!");
		}
	}
	public static void ClearFail() {

		Connection conn = getConn();
		String sql = "truncate fail_course";
		//System.out.println(sql);
		PreparedStatement pstmt;
		//ResultSet rSet = null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.execute(sql);
			//ResultSet rs = pstmt.executeQuery();
			//rSet = rs;
		} catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
			System.out.println("insert failed!");
		}
	}
	
}
