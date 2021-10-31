import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionMain {

	public static void main(String[] args) throws SQLException {
		
		//연결 시도 -> 주소 -> 연결할 db메이커 판단
		// 자동으로 메이커 맞는 driver 찾아줌
		
		// 연결 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		con.close();
		
		
		
		
	}

}
