import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteMain {

	public static void main(String[] args) throws SQLException {

		//������ ��� �̸� �Է��ϸ� �� ��� ����
		Scanner sc = new Scanner(System.in);
		// ���� 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "delete from db_test where d_name = ?";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		System.out.println("������ ��� �̸� �Է� : ");
		String name = sc.next();
		
		pstmt.setString(1, name);
		int row = pstmt.executeUpdate();
		
		if(row == 1) {
			System.out.println(name + " ���� ����!");
		}
		
		
		
		pstmt.close();
		con.close();
		
	}

}
