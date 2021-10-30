import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class DBMain3_Modify {

	public static void main(String[] args) throws SQLException {

		//���� ���̺� ���� �ϳ� �ֱ�
		
		Scanner k = new Scanner(System.in);
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into SNACK values(SNACK_seq.nextval, ?, ?, ?, ?)";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		//�Է� ��
		System.out.println("�̸� : ");
		String name = k.next();
		System.out.println("����Ŀ : ");
		String maker = k.next();
		System.out.println("���� : ");
		int weight = k.nextInt();
		System.out.println("���� : ");
		int price = k.nextInt();
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, maker);
		pstmt.setInt(3, weight);
		pstmt.setInt(4, price);
		
	
		if(pstmt.executeUpdate(sql) == 1) {
			System.out.println("��� ����");
		}else {
			System.out.println("��� ����");
		}
		
		pstmt.close();
		con.close();
		
	}

}
