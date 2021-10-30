import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB2 {

	public static void main(String[] args) throws SQLException {
		//껍데기 con, st, rs
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select*from db_test";
		//연결
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		//실행도구
		Statement st = con.createStatement();
		//결과 얻기
		ResultSet rs = st.executeQuery(sql);
		
		
		rs.next();
		
		if(rs.next()) {
			String name = rs.getString("d_name");
			int age = rs.getInt("d_age");
			System.out.println(name);
			System.out.println(age);
		}
		
		rs.close();
		st.close();
		con.close();
		
		
	}

}
