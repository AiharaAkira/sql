import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteMain3 {

	public static void main(String[] args) throws SQLException {

		//������ ��� �̸� �Է��ϸ� �� ��� ����
		Scanner sc = new Scanner(System.in);
		// ���� 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select * from db_test";
		String sql2 = "delete from db_test where d_no = ?";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			String name1 = rs.getString("d_name");
			int age = rs.getInt("d_age");
			System.out.println(rs.getInt("d_no"));
			System.out.println(name1);
			System.out.println(age);
			System.out.println("------------");
		}

		
		System.out.println("������ ��� �ѹ� �Է� : ");
		int number = sc.nextInt();
		
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, number);
		
		int row = pstmt.executeUpdate();
		
		if(row == 1) {
			System.out.println(number + "�� ���� ����!");
		}
		
		
		
		pstmt.close();
		con.close();
		
	}

}
