import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {

	public static void main(String[] args) throws SQLException {

		Scanner sc = new Scanner(System.in);
		// 연결 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into db_test values(db_test_seq.nextval, ?, ?)";
		
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		System.out.println("이름은 : ");
		String name = sc.next();
		System.out.println("나이는 : ");
		int age = sc.nextInt();
		
		pstmt.setString(1, name);  //?채우기. 1번째 자리에 name
		pstmt.setInt(2, age);    // ?채우기. 2번째 자리에 age
		
		int row = pstmt.executeUpdate(); // CUD       R(Select):excuteQuery() 
		
		if(row == 1) {
			System.out.println("등록성공!");
		}
		
		
		
		
		pstmt.close();
		con.close();
		
	}

}
