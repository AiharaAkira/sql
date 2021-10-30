import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMain {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {

//		DB 관련작업
//		껍데기 시리즈
//		뭘하든 CRUD     DB에 연결 먼저
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		1.연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select * from db_test";
		
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결 성공");
		
//		2.실행도구
		Statement st = con.createStatement();
	
//		3. 결과 얻기
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {
			String name = rs.getString("d_name");
			int age = rs.getInt("d_age");
			
			System.out.println(name);
			System.out.println(age);
			System.out.println("___________________");
		}
		
		rs.close();
		st.close();
		con.close();
		
		
	}

}
