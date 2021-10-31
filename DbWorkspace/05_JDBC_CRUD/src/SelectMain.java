import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectMain {

	public static void main(String[] args) throws SQLException {

		// 연결 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select * from db_test";
		
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// select 때 필요
		ResultSet rs = pstmt.executeQuery();
		
		// rs.next() : 다음 레코드로 가는 기능(화살표 아래로 내려감)
		//			   다음 데이터가 있으면 true, 없으면 false
		while(rs.next()) {
			String name = rs.getString("d_name");
			int age = rs.getInt("d_age");
			System.out.println(name);
			System.out.println(age);
			System.out.println("------------");
		}
		
		
		con.close();
		pstmt.close();
		rs.close();
	}

}
