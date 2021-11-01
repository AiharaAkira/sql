import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {

	public static void main(String[] args) throws SQLException {
		Scanner sc = new Scanner(System.in);
		String sql = "update db_test set d_age =? where d_name = ?";
		
		// ���� 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		//���̸� �����ϰ� ���� ��� �̸�
		System.out.println("���̸� �����ϰ� ���� ��� �̸� : ");
		String name = sc.next();
		// �� ��� ���� �ұ��?
		System.out.println("���̸� �����ϰ� ���� ��� ���� : ");
		int age = sc.nextInt();
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(2, name);
		pstmt.setInt(1, age);
		
		if(pstmt.executeUpdate() >= 1) {
			System.out.println("���� �Ϸ�!");
		}
		
		
		
		pstmt.close();
		con.close();
		
		
	}

}
