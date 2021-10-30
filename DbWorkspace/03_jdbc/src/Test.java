import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test {

	public static void main(String[] args) throws SQLException {

		// 스낵테이블에 있는거 전체 출력
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		//1.연결
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		//2.실행 도구 생성
		Statement st = con.createStatement();
		
		//3. 결과 받기
		String sql = "select * from SNACK";
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {
			String name = rs.getString("s_name");
			
			System.out.println(name);
		}
		
		
		rs.close();
		st.close();
		con.close();
		
		

	}

}
