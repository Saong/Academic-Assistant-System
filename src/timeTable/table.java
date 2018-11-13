package timeTable;

import java.awt.print.Printable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;
import java.util.Random;
/**
 * 排课功能，输入：一周内的五天随意选择不上课的天，每天内随意选择不上课的节次
 * 输出：课表+未能成功排课的教师
 * @author lizhe
 * @date Jun 12, 2018
 * @descripe TODO
 */
public class table {
	public static void makeTable(ResultSet rs) throws SQLException {
		String[][] week1 = new String[5][5];//一维星期几，二维第几节
		String[] nottable = new String[10];
		int notableId=0;
		int frequency=0;
	
		for(int j=0; j<5;j++) {
			for(int i=0;i<5;i++) {
				week1[j][i] = null; 			
			}
		}
		
		while(rs.next()) {
			frequency = rs.getInt("frequency");
			for(int i=1;i<=frequency;i++) {//判断需要一周上几节课
				int intable = 0;
				for(int k=0;k<100;k++){
					intable = randomSet(rs, week1);
					if(intable==1)
						break;
				}
			
				if (intable == 0) {
					nottable[notableId] = "教师："+ rs.getString("teacher_name") + "  课程："+rs.getString("course_name")+ "  类别："+rs.getString("classes");
					notableId++;
				}
			}
		}
		for(int j=0; j<5;j++) {
			System.out.println("星期"+(j+1));
			for(int i=0;i<5;i++) {
				System.out.print(week1[j][i]+"\t");
				time_table_do.InsertTable(week1[j][i], i, j);
			
			}
			System.out.println("\n");
		}
		time_table_do.ClearFail();
		for(int i=0;i<notableId;i++) {
			System.out.println("未成功排课的教师     "+nottable[i]);
			time_table_do.InsertTableFail(nottable[i]);
		}
		
	}
	
	public static int randomSet(ResultSet rs, String[][] week) throws SQLException{
		java.util.Random r=new java.util.Random();
		int day, time;
		day = r.nextInt(5);
		time = r.nextInt(5);
		if (rs.getString(day+12).equals("1") && rs.getString(time+7).equals("1") && week[day][time]==null){
			week[day][time] = rs.getString(3) + " " + rs.getString(2) + " "+rs.getString("building") + " "+rs.getString("classes");
			System.out.println(week[day][time]);
			return 1;
		}
		return 0;
	}
}
	

