package timeTable;

import java.sql.ResultSet;
import java.sql.SQLException;

public class creatTable {

public static void main(String[] args) throws SQLException  {
	ResultSet rSet;
	rSet=time_table_do.getAll();
	table.makeTable(rSet);
 }
}

	
	

	
	
	
	

