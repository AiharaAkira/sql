import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectMain {

	public static void main(String[] args) throws SQLException {

		// ���� 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select * from db_test";
		
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// select �� �ʿ�
		ResultSet rs = pstmt.executeQuery();
		
		// rs.next() : ���� ���ڵ�� ���� ���(ȭ��ǥ �Ʒ��� ������)
		//			   ���� �����Ͱ� ������ true, ������ false
		while(rs.next()) {
			String name = rs.getString("d_name");
			int age = rs.getInt("d_age");
			System.out.println(name);
			System.out.println(age);
			System.out.println("------------");
		}
		
		
		con.close();
		pstmt.close();
		rs.close();
	}

}
