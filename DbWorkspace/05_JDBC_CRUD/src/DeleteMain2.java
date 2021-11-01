import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteMain2 {

	public static void main(String[] args) throws SQLException {

		//삭제할 사람 이름 입력하면 그 사람 삭제
		Scanner sc = new Scanner(System.in);
		// 연결 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "delete from db_test where d_no = ?";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		

		
		System.out.println("삭제할 사람 넘버 입력 : ");
		int number = sc.nextInt();
		
		
		pstmt.setInt(1, number);
		
		int row = pstmt.executeUpdate();
		
		if(row == 1) {
			System.out.println(number + "번 삭제 성공!");
		}
		
		
		
		pstmt.close();
		con.close();
		
	}

}
