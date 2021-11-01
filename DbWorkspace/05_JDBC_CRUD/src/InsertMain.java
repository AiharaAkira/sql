import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {

	public static void main(String[] args) throws SQLException {

		Scanner sc = new Scanner(System.in);
		// ���� 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into db_test values(db_test_seq.nextval, ?, ?)";
		
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		System.out.println("�̸��� : ");
		String name = sc.next();
		System.out.println("���̴� : ");
		int age = sc.nextInt();
		
		pstmt.setString(1, name);  //?ä���. 1��° �ڸ��� name
		pstmt.setInt(2, age);    // ?ä���. 2��° �ڸ��� age
		
		int row = pstmt.executeUpdate(); // CUD       R(Select):excuteQuery() 
		
		if(row == 1) {
			System.out.println("��ϼ���!");
		}
		
		
		
		
		pstmt.close();
		con.close();
		
	}

}
