import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//			1.드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		2. 연결 객체 얻기
		Connection con = DriverManager.getConnection(
		url, "cmw", "cmw");
		System.out.println("연결성공");
		
//		3.실행도구 생성
		Statement st = con.createStatement();
		
//		4. 결과 얻기
		String sql = "select * from db_test";
		ResultSet rs = st.executeQuery(sql);
		
		if(rs.next()) {
		String name = rs.getString("d_name");
		System.out.println(name);
		int age = rs.getInt("d_age");
		System.out.println(age);
		
		}
		
		rs.close();
		st.close();
		con.close();
	}
}
