import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteMain2 {

	public static void main(String[] args) throws SQLException {

		//������ ��� �̸� �Է��ϸ� �� ��� ����
		Scanner sc = new Scanner(System.in);
		// ���� 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "delete from db_test where d_no = ?";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		

		
		System.out.println("������ ��� �ѹ� �Է� : ");
		int number = sc.nextInt();
		
		
		pstmt.setInt(1, number);
		
		int row = pstmt.executeUpdate();
		
		if(row == 1) {
			System.out.println(number + "�� ���� ����!");
		}
		
		
		
		pstmt.close();
		con.close();
		
	}

}
