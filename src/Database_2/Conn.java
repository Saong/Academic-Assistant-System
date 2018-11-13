package Database_2;
import java.sql.*;
public class Conn
{
    public static Connection getMySQLConnect() throws Exception
    {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost/academic_secretary_system?user=root&password=8288545&useUnicode=true&characterEncoding=UTF-8";
		Connection conn = DriverManager.getConnection(url);

		return conn;
	}
}