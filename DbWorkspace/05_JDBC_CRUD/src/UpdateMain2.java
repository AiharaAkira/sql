import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain2 {

	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
		//건우 2 이름이 '건'이 포함된 사람의 나이를 20으로 수정
		String sql = "update db_test set d_age =? where d_name like '%' || ? || '%'";
		// 포함쪽[구글링]
		
		// 연결 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		//나이를 수정하고 싶은 사람 이름
		System.out.println("나이를 수정하고 싶은 사람 이름 : ");
		String name = sc.next();
		// 몇 살로 수정 할까요?
		System.out.println("나이를 수정하고 싶은 사람 나이 : ");
		int age = sc.nextInt();
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(2, name);
		pstmt.setInt(1, age);
		
		if(pstmt.executeUpdate() >= 1) {
			System.out.println("수정 완료!");
		}
		
		
		
		pstmt.close();
		con.close();
		
		
	}

}
