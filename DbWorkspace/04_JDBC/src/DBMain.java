import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBMain {

	public static void main(String[] args) throws SQLException {

		//DB관련 작업 - 껍데기
		//CRUD - C     rs- 필요없음 - select
		
//		excuteQuery = select(R)
//		excuteUpdate = 나머지 (CUD)
		
//		연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		Statement st = con.createStatement();
		String sql = "insert into db_test values (db_test_seq.nextval, '지호', 21)";
		
	
		if(st.executeUpdate(sql) == 1) {
			System.out.println("등록 성공");
		}else {
			System.out.println("등록 실패");
		}
		
		st.close();
		con.close();
		
	}

}
