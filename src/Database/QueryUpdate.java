package Database;
import java.sql.*;
import Database.Conn;
public class QueryUpdate {
	Statement stmt = null;
	Connection con = null;
	public QueryUpdate() throws Exception{
		this.con = Conn.getMySQLConnect();
	}
	public void executeUpdate(String sql){
		try{
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		}
		catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
	}
	public ResultSet executeQuery(String sql){
		ResultSet rs1 = null;
		try{
			stmt = con.createStatement();
			rs1 = stmt.executeQuery(sql);
		}
		catch(SQLException ex){
			System.err.println("executeQuery:"+ex.getMessage());
		}
		return rs1;
	}
	public void close(){
		try{stmt.close(); con.close();}
		catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
	}

}
