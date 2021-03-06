import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.util.Scanner;


public class DBMain2_Modi {

	public static void main(String[] args) throws SQLException {

		//사람의 이름, 나이 입력해서 db에 저장
		
		Scanner k = new Scanner(System.in);
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into db_test values (db_test_seq.nextval, ?, ?)";
		
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		//입력 폼
		System.out.println("이름 : ");
		String name = k.next();
		System.out.println("나이 : ");
		int age = k.nextInt();
		
		
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		
		System.out.println(sql);
		
		if(pstmt.executeUpdate() == 1) {
			System.out.println("등록 성공");
		}else {
			System.out.println("등록 실패");
		}
		
		pstmt.close();
		con.close();
		
	}

}
