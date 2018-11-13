package Database;
import java.sql.*;
public class Conn
{
    public static Connection getMySQLConnect() throws Exception
    {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost/srtp?user=root&password=8288545&useUnicode=true&characterEncoding=UTF-8";
		Connection conn = DriverManager.getConnection(url);

		return conn;
	}
}